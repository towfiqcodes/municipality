import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import '../../routes/route_path.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(AuthAppInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<AuthBloc, AuthState>(
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
      child: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/ic_splash_background.png",
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/ic_logo.png",
                height: 67,
                width: 67,
              ),
              Text(
                "iHope",
                style:
                    GoogleFonts.lato(fontSize: 48, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
