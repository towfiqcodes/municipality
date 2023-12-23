import 'package:Pourosova/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import '../../models/request/login_request.dart';
import '../../routes/route_path.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/common_widget.dart';
import '../../shared/utils/regex.dart';
import '../../shared/widgets/border_button.dart';
import '../../shared/widgets/gradient_background.dart';
import '../../shared/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  final _emailController = TextEditingController(text: "dhanbari-admin@pourashava.org");

  final _passwordController = TextEditingController(text: "Dhanbari\$%67");

  final _idNumberController = TextEditingController();

  final _mobileNumberController = TextEditingController();

  final _pinNumberController = TextEditingController();
  bool _passwordVisible = true;

  @override
  void initState() {
    // BlocProvider.of<AuthBloc>(context).add(AuthAppInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return MultiBlocListener(listeners: [
      BlocListener<AuthBloc, AuthState>(
        bloc: BlocProvider.of<AuthBloc>(context),
        listener: (context, state) {
          if (state is AuthSuccessState) {
            print('AuthSuccessState');
            Navigator.pushNamed(context, RoutePath.home);
          }
          if (state is AuthFailState) {
            print('AuthFailState');
            Navigator.pushNamed(context, RoutePath.login);
          }
        },
      ),
      BlocListener<AuthBloc, AuthState>(
        bloc: BlocProvider.of<AuthBloc>(context),
        listener: (context, state) {
          if (state is AuthLoginSuccessState) {
            Navigator.pushNamed(context, RoutePath.home);
          }

          if (state is AuthAppFailureState) {
            CommonWidget.toast(state.message);
          }
        },
      ),
    ], child: _buildWidget(context, authBloc));
  }

  Widget _buildWidget(BuildContext context, AuthBloc authBloc) {
    int flag = 1;
    const textStyle = TextStyle(
        fontSize: 12.0, color: Colors.white, fontFamily: 'OpenSans', fontWeight: FontWeight.w600);
    return Stack(
      children: [
        GradientBackground(
          needWave: false,
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            // appBar: CommonWidget.appBar(
            //   context,
            //   'Sign In',
            //   Icons.arrow_back,
            //   ColorConstants.textColor,
            // ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidget.rowHeight(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    child: Text(
                      "Pourosova Management System",
                      style: GoogleFonts.lato(
                          fontSize: 24, color: ColorConstants.white, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CommonWidget.rowHeight(height: 30),
                  BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                    if (state is AuthOnTapState) {
                      flag = state.flag;
                    }
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: double.infinity,
                            child: Card(
                              color: Colors.white,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: flag == 1
                                            ? BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                //topLeft: Radius.circular(10.0),
                                                // topRight: Radius.circular(10.0),
                                                //bottomLeft: Radius.circular(5.0),
                                              )
                                            : BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                //topLeft: Radius.circular(5.0),
                                              ),
                                        color: flag == 1
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.white,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              // flag=1;
                                              authBloc.add(const Increment(value1: 1));
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(right: 68, left: 40),
                                              child: Container(
                                                child: Text(
                                                  "Citizen",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: flag == 1
                                                          ? ColorConstants.white
                                                          : ColorConstants.primaryColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              authBloc.add(const Decrement(value1: 2));
                                            },
                                            child: Center(
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: flag == 2
                                                      ? const BorderRadius.only(
                                                          //topRight: Radius.circular(10.0),
                                                          bottomLeft: Radius.circular(5.0),
                                                        )
                                                      : const BorderRadius.only(
                                                          //topRight: Radius.circular(10.0),
                                                          topLeft: Radius.circular(5.0),
                                                        ),
                                                  color: flag == 2
                                                      ? ColorConstants.primaryColor
                                                      : ColorConstants.white,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(right: 68, left: 40),
                                                  child: Center(
                                                    child: Text(
                                                      "Admin",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: flag == 2
                                                              ? ColorConstants.white
                                                              : ColorConstants.primaryColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flag == CommonConstants.admin
                                        ? Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: _buildForms(context, CommonConstants.citizen),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: _buildForms(context, CommonConstants.admin),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context, int i) {
    return i == 1
        ? Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        width: 2,
                        color: ColorConstants.darkGray,
                        style: BorderStyle.solid,
                      )),
                  child: InputField(
                    controller: _idNumberController,
                    keyboardType: TextInputType.number,
                    color: ColorConstants.black,
                    labelText: 'ID Number',
                    //  placeholder: 'Enter Id Number',
                    validator: (value) {
                      // if (!Regex.isEmail(value!)) {
                      //   return 'Email format error.';
                      // }

                      if (value!.isEmpty) {
                        return 'Id Number is required.';
                      }
                      return null;
                    },
                  ),
                ),
                CommonWidget.rowHeight(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        width: 2,
                        color: ColorConstants.darkGray,
                        style: BorderStyle.solid,
                      )),
                  child: InputField(
                    controller: _mobileNumberController,
                    keyboardType: TextInputType.number,
                    color: ColorConstants.black,
                    labelText: 'Mobile Number',
                    //  placeholder: 'Enter Password',
                    password: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mobile Number is required.';
                      }

                      // if (value.length < 6 || value.length > 15) {
                      //   return 'Password should be 6~15 characters';
                      // }

                      return null;
                    },
                  ),
                ),
                CommonWidget.rowHeight(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        width: 2,
                        color: ColorConstants.darkGray,
                        style: BorderStyle.solid,
                      )),
                  child: InputField(
                    controller: _pinNumberController,
                    keyboardType: TextInputType.number,
                    color: ColorConstants.black,
                    labelText: 'Pin Number',
                    //  placeholder: 'Enter Password',
                    password: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Pin Number is required.';
                      }

                      // if (value.length < 6 || value.length > 15) {
                      //   return 'Password should be 6~15 characters';
                      // }

                      return null;
                    },
                  ),
                ),
                CommonWidget.rowHeight(height: 10),
                BorderButton(
                  text: 'Sign In',
                  backgroundColor: ColorConstants.primaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePath.home);
                    // if (_formKey.currentState!.validate()) {
                    //
                    //   // BlocProvider.of<AuthBloc>(context).add(
                    //   //   AuthLoginEvent(
                    //   //     loginRequest: LoginRequest(
                    //   //       email: _emailController.text,
                    //   //       password: _passwordController.text,
                    //   //     ),
                    //   //   ),
                    //   // );
                    // }
                  },
                ),
              ],
            ),
          )
        : Form(
            key: _formKey1,
            child: ListView(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        width: 2,
                        color: ColorConstants.darkGray,
                        style: BorderStyle.solid,
                      )),
                  child: InputField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    color: ColorConstants.black,
                    labelText: 'Username',
                    //  placeholder: 'Enter Id Number',
                    validator: (value) {
                      // if (!Regex.isEmail(value!)) {
                      //   return 'Email format error.';
                      // }

                      if (value!.isEmpty) {
                        return 'Username is required.';
                      }
                      return null;
                    },
                  ),
                ),
                CommonWidget.rowHeight(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        width: 2,
                        color: ColorConstants.darkGray,
                        style: BorderStyle.solid,
                      )),
                  child: InputField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    color: ColorConstants.black,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    labelText: 'Password',
                    placeholder: 'Enter Password',
                    password: _passwordVisible,
                    validator: (value) {
                      // if (value!.isEmpty) {
                      //   return 'Mobile Number is required.';
                      // }

                      if (value!.length < 6 || value.length > 15) {
                        return 'Password should be 6~15 characters';
                      }

                      return null;
                    },
                  ),
                ),
                CommonWidget.rowHeight(),
                BorderButton(
                  text: 'Sign In',
                  backgroundColor: ColorConstants.primaryColor,
                  onPressed: () {
                    if (_formKey1.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(
                        AuthLoginEvent(
                          loginRequest: LoginRequest(
                            username: _emailController.text,
                            password: _passwordController.text,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
  }
}
