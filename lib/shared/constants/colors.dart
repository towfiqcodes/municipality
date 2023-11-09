import 'package:flutter/material.dart';

class ColorConstants {
  static Color darkOrange = hexToColor('#FF7F00');
  static Color lightOrange = hexToColor('#FFD47F');
  static Color primaryColor = hexToColor('#008000');
  static Color secondaryColor = hexToColor('#008000');
  static Color toscaColor = hexToColor('#257CFF');
  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color darkGray = Color(0xFF9F9F9F);
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color textColor = hexToColor('#3A3A3C');
  static Color lineColor = hexToColor('#A0A0A0');
  static Color textSecondaryColor = hexToColor('#A0A0A0');
  static Color hintTextColor = Color(0xFF808D9E);
  static Color backgroundColor = Color(0xFFDBDBDB);
  static Color holdingbackgroundColor = hexToColor('#0BA350');
  static Color holdingCardbackgroundColor = hexToColor('#6A3599');
  static Color tradingbackgroundColor = hexToColor('#45A1E4');
  static Color tradingCardbackgroundColor = hexToColor('#F58C1D');
  static Color linebackgroundColor = hexToColor('#A0A0A0');
  static Color cardBackgroundColor = Color(0x1A008000);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
