import 'package:Pourosova/shared/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/request/login_request.dart';
import '../models/request/register_request.dart';
import '../shared/shared.dart';
import 'interceptor/api_interceptor.dart';

class ApiProvider {
  static final ApiProvider _singleton = new ApiProvider._internal();
  static final dio = Dio();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal() {
    dio
      ..options.baseUrl = ApiConstants.base_url
      ..options.receiveTimeout = 15000
      ..options.responseType = ResponseType.json
      ..interceptors.add(ApiInterceptors())
      ..interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ));
  }

  Future<Response> login(String path, LoginRequest data) {
    return dio.post(path, data: data);
  }

  Future<Response> register(String path, RegisterRequest data) {
    return dio.post(path, data: data);
  }

  Future<Response> getDashboard(String path) async {
    final SharedPreferences sharedPreferences = await prefs;
    return dio.get(path,
        options: Options(headers: {
          "authorization":
              "Bearer ${sharedPreferences.getString(StorageConstants.token)}",
        }));
  }

  Future<Response> getSystemData(String path) async {
    final SharedPreferences sharedPreferences = await prefs;
    return dio.get(path,
        options: Options(headers: {
          "authorization":
              "Bearer ${sharedPreferences.getString(StorageConstants.token)}",
        }));
  }
}
