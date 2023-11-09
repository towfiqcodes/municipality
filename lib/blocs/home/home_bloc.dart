import 'dart:math';

import 'package:Pourosova/models/dashboard/dashboard_response.dart';
import 'package:Pourosova/shared/utils/navigation_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_provider.dart';
import '../../api/api_repository.dart';
import '../../models/response/users_response.dart';
import '../../shared/shared.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitState());

  final ApiRepository _apiRepository =
      ApiRepository(apiProvider: new ApiProvider());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadUsersEvent) {
      yield* _mapHomeLoadUsersState(event);
    }

    if (event is HomeGetUserEvent) {
      yield* _mapHomeGetUserState(event);
    }
  }

  Stream<HomeState> _mapHomeLoadUsersState(HomeLoadUsersEvent event) async* {
    final SharedPreferences sharedPreferences = await prefs;
    try {
     final res = await _apiRepository.getUsers();
      if (res.error==false) {
        _saveUserInfo(res);
        yield HomeLoadUsersSuccessState(users: res.data);
      } else {
        yield HomeLoadUsersFailState(message: '');
      }
    } catch (e) {
     if(e is DioError){
       if(e.response?.statusCode==401){
         print("object ${e.response?.statusCode}");
       }
     }

    }
  }

  Stream<HomeState> _mapHomeGetUserState(HomeGetUserEvent event) async* {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      var user = sharedPreferences.getString(StorageConstants.userInfo);
      var userObj = DashboardData.fromRawJson(user!);
      yield HomeGetUserSuccessState(user: userObj);
    } catch (e) {
      yield HomeFailureState(message: e.toString());
    }
  }

  void _saveUserInfo(DashboardResponse users) async {
    final SharedPreferences sharedPreferences = await prefs;
    var random = new Random();
    //var index = random.nextInt(users.data!.);
    sharedPreferences.setString(
      StorageConstants.userInfo,
      users.data!.toRawJson(),
    );

    // var userInfo = prefs.getString(StorageConstants.userInfo);
    // var userInfoObj = Datum.fromRawJson(xx!);
    // print(userInfoObj);
  }
}
