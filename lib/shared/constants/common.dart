import 'package:Pourosova/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class CommonConstants {
  static const String test = 'test';
  static const num testNum = 1;
  static const double largeText = 40.0;
  static const double normalText = 22.0;
  static const double smallText = 16.0;
  static const double mediumText = 18.0;
  static const double xSmallText = 12.0;
  static const int citizen = 1;
  static const int admin = 2;
  static const int flag = 3;
  static const String khanaProdhanTottho = "Khana prodhan tottho";
  static const String thikana = "thikana";
  static const String paribarik = "paribarik";
  static const String onnanno = "onnanno";
}

Future<void> showLoadingDialog(BuildContext context) async {
  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            elevation: 0.0,
            scrollable: true,
            insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            content: Center(
                child: CircularProgressIndicator(
              color: ColorConstants.primaryColor,
            )),
          ),
        );
      });
}
