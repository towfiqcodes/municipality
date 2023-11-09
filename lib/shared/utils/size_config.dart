import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig._();
  static final SizeConfig _instance = SizeConfig._();
  factory SizeConfig() => _instance;

  MediaQueryData? _mediaQueryData;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  double blockSizeHorizontal = 0.0;
  double blockSizeVertical = 0.0;
  double _safeAreaHorizontal = 0.0;
  double _safeAreaVertical = 0.0;
  double safeBlockHorizontal = 0.0;
  double safeBlockVertical = 0.0;
  double profileDrawerWidth = 0.0;
  double refHeight = 0.0;
  double refWidth = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    refHeight = 1450;
    refWidth = 670;

    if (screenHeight < 1200) {
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;

      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    } else {
      blockSizeHorizontal = screenWidth / 120;
      blockSizeVertical = screenHeight / 120;

      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 120;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 120;
    }
  }

  double getWidthRatio(double val) {
    double res = (val / refWidth) * 100;
    double temp = res * blockSizeHorizontal;

    return temp;
  }

  double getHeightRatio(double val) {
    double res = (val / refHeight) * 100;
    double temp = res * blockSizeVertical;
    return temp;
  }

  double getFontRatio(double val) {
    double res = (val / refWidth) * 100;
    double temp = 0.0;
    if (screenWidth < screenHeight) {
      temp = res * safeBlockHorizontal;
    } else {
      temp = res * safeBlockVertical;
    }

    return temp;
  }
}

extension SizeUtils on num {
  double get toWidth => SizeConfig().getWidthRatio(this.toDouble());
  double get toHeight => SizeConfig().getHeightRatio(this.toDouble());
  double get toFont => SizeConfig().getFontRatio(this.toDouble());
}
