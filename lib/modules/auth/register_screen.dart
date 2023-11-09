import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import '../../models/request/register_request.dart';
import '../../routes/route_path.dart';
import '../../shared/utils/common_widget.dart';
import '../../shared/utils/focus.dart';
import '../../shared/utils/regex.dart';
import '../../shared/widgets/app_check_box.dart';
import '../../shared/widgets/border_button.dart';
import '../../shared/widgets/gradient_background.dart';
import '../../shared/widgets/input_field.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: BlocProvider.of<AuthBloc>(context),
      listener: (context, state) {
        if (state is AuthRegisterSuccessState) {
          Navigator.pushNamed(context, RoutePath.home);
        }

        if (state is AuthRegisterFailState) {
          CommonWidget.toast(state.message);
        }
      },
      child: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Stack(
      children: [
        GradientBackground(
          needWave: true,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CommonWidget.appBar(
            context,
            'Sign Up',
            Icons.arrow_back,
            Colors.white,
          ),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: _buildForms(context),
          ),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context) {
    bool _termsChecked = false;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              controller: _emailController,
              keyboardType: TextInputType.text,
              labelText: 'Email address',
              placeholder: 'Enter Email Address',
              validator: (value) {
                if (!Regex.isEmail(value!)) {
                  return 'Email format error.';
                }

                if (value.isEmpty) {
                  return 'Email is required.';
                }
                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Password',
              placeholder: 'Enter Password',
              password: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required.';
                }

                if (value.length < 6 || value.length > 15) {
                  return 'Password should be 6~15 characters';
                }

                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              controller: _confirmPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Confirm Password',
              placeholder: 'Enter Password',
              password: true,
              validator: (value) {
                if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  return 'Confirm Password is not consistence with Password.';
                }

                if (value!.isEmpty) {
                  return 'Confirm Password is required.';
                }
                return null;
              },
            ),
            CommonWidget.rowHeight(height: 10.0),
            AppCheckbox(
              label:
                  'I have read and agreed to the Terms & Conditions and Privay Policy of Demo.',
              checked: _termsChecked,
              onChecked: (val) {
                _termsChecked = val;
              },
            ),
            CommonWidget.rowHeight(height: 80),
            BorderButton(
              text: 'Sign Up',
              backgroundColor: Colors.white,
              onPressed: () {
                AppFocus.unfocus(context);
                if (_formKey.currentState!.validate()) {
                  if (!_termsChecked) {
                    CommonWidget.toast('Please check the terms first.');
                    return;
                  }

                  BlocProvider.of<AuthBloc>(context).add(
                    AuthRegisterEvent(
                      registerRequest: RegisterRequest(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
