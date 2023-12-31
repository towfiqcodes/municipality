import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/auth/login_screen.dart';
import '../../shared/utils/navigation_service.dart';
import 'loading_apis.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    print("REQUEST[${options.method}] => PATH: ${options.path}");
    // var prefs = await SharedPreferences.getInstance();
    // var accessToken = prefs.getString('access_token');
    // if (accessToken != null) {
    //   options.headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');
    // }

    if (isInLoadingApis(options.path)) {
      EasyLoading.show(status: 'loading...');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print("RESPONSE[${response.statusCode}] => PATH: ${response.realUri.path}");
    // _refreshAccessToken(response);

    if (isInLoadingApis(response.realUri.path)) {
      EasyLoading.dismiss();
    }

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");

    if (isInLoadingApis(err.requestOptions.path) || err.response == null) {
      EasyLoading.dismiss();
    }

    if (err.response?.statusCode == 401) {
      print('TODO: go to auth page');
      EasyLoading.dismiss();
      navigator_logout();
    }

    handler.next(err);
  }

  void navigator_logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
        NavigationService.navigatorKey.currentState!.context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);
  }

  // _refreshAccessToken(Response response) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var accessToken = response.headers.map['access_token'] != null
  //       ? response.headers.map['access_token'][0]
  //       : null;
  //   if (accessToken != null) {
  //     prefs.setString('access_token', accessToken);
  //   }
  // }
}
