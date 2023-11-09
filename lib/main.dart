import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'app.dart';
import 'shared/constants/colors.dart';

void main() {
  runApp(App());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = ColorConstants.darkOrange
    ..textColor = ColorConstants.darkOrange
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
