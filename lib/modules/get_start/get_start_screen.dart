import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:math' as math;
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import '../../routes/route_path.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/size_config.dart';

import 'dart:math';

import '../../shared/utils/utils.dart';
import '../../shared/widgets/border_button.dart';

class GetStartScreen extends StatefulWidget {
  @override
  _GetStartScreenState createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _buildWidget();
  }

  Widget _buildWidget() {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 30.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ic_get_start_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                  style: GoogleFonts.lato(
                      fontSize: 48, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.centerRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Image.asset(
                      "assets/images/ic_doctor_women.png",
                      height: 297,
                      width: 207,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: Image.asset(
                      "assets/images/ic_doctor_man.png",
                      height: 320,
                      width: 257,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: ColorConstants.lightScaffoldBackgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Improve the Quality of Service for Patient Happiness",
                        style: TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CommonWidget.rowHeight(height: 20),
                    BorderButton(
                      text: 'Get Started',
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.white,
                      ),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      backgroundColor: ColorConstants.toscaColor,
                      onPressed: () {
                        Navigator.pushNamed(context, RoutePath.login);
                      },
                    ),
                    // CommonWidget.rowHeight(height: 10),
                    // RichText(
                    //   text: TextSpan(
                    //       text: 'Have an account? ',
                    //       style: TextStyle(
                    //           color: ColorConstants.hintTextColor,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w200),
                    //       children: [
                    //         TextSpan(
                    //           text: 'Login',
                    //           style: TextStyle(
                    //               color: ColorConstants.toscaColor,
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.w600),
                    //           recognizer: TapGestureRecognizer()
                    //             ..onTap = () => {
                    //                   Navigator.pushNamed(
                    //                       context, RoutePath.login)
                    //                 },
                    //         )
                    //       ]),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
