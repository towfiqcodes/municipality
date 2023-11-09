import 'dart:async';
import 'package:Pourosova/models/dashboard/dashboard_response.dart';
import 'package:Pourosova/shared/constants/api_constants.dart';

import '../models/get_system/get_system_config_response.dart';
import '../models/request/login_request.dart';
import '../models/request/register_request.dart';
import '../models/response/login_response.dart';
import '../models/response/register_response.dart';
import '../models/response/users_response.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({this.apiProvider});

  final ApiProvider? apiProvider;

  Future<LoginResponse> login(LoginRequest data) async {
    final res = await apiProvider?.login(ApiConstants.login, data);
    if (res?.statusCode == 200) {
      return LoginResponse.fromJson(res?.data);
    }

    return Future.error(res!.statusCode!);
  }

  Future<RegisterResponse> register(RegisterRequest data) async {
    final res = await apiProvider?.register('/api/register', data);
    if (res?.statusCode == 200) {
      return RegisterResponse.fromJson(res?.data);
    }

    return Future.error(res!.statusCode!);
  }

  Future<DashboardResponse> getUsers() async {
    final res = await apiProvider?.getDashboard(ApiConstants.dashboard);
    if (res?.statusCode == 200) {
      return DashboardResponse.fromJson(res?.data);
    }

    return Future.error(res!.statusCode!);
  }

  Future<GetSystemConfig> getSystemData() async {
    final res = await apiProvider?.getSystemData(ApiConstants.systemConfigData);
    if (res?.statusCode == 200) {
      return GetSystemConfig.fromJson(res?.data);
    }

    return Future.error(res!.statusCode!);
  }
}
