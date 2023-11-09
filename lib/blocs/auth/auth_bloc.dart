import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_provider.dart';
import '../../api/api_repository.dart';
import '../../shared/constants/storage.dart';
import '../../shared/shared.dart';
import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitState());

  final ApiRepository _apiRepository =
      ApiRepository(apiProvider: new ApiProvider());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthAppInitEvent) {
      yield* _mapAuthAppInitState(event);
    }

    if (event is AuthRegisterEvent) {
      yield* _mapAuthRegisterState(event);
    }

    if (event is AuthLoginEvent) {
      yield* _mapAuthLoginState(event);
    }
    if (event is Increment) {
      yield* _mapAuthOnTapState(event);
    }
    if (event is Decrement) {
      yield* _mapAuthOnTapState(event);
    }
    if (event is AuthSignoutEvent) {
      yield* _mapAuthSignoutState(event);
    }


  }

  Stream<AuthState> _mapAuthAppInitState(AuthAppInitEvent event) async* {
    try {
      await Future.delayed(const Duration(milliseconds: 2000)); // a simulated delay
      final SharedPreferences sharedPreferences = await prefs;
      if (sharedPreferences.getString(StorageConstants.token) != null) {
        yield AuthSuccessState();
      } else {
        yield AuthFailState();
      }
    }
    catch (e) {
      yield AuthAppFailureState(
          message: e.toString() ?? 'An unknown error occurred');
    }
  //  yield AuthInitState();
  }

  Stream<AuthState> _mapAuthRegisterState(AuthRegisterEvent event) async* {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      final res = await _apiRepository.register(event.registerRequest!);
      if (res.token.isNotEmpty) {
        sharedPreferences.setString(StorageConstants.token, res.token);
        yield AuthRegisterSuccessState();
      } else {
        yield AuthRegisterFailState(message: 'AuthRegisterFailState');
      }
    } catch (e) {
      yield AuthAppFailureState(
          message: e.toString() );
    }
  }

  Stream<AuthState> _mapAuthLoginState(AuthLoginEvent event) async* {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      final res = await _apiRepository.login(event.loginRequest!);
      if (res.token.isNotEmpty) {
        sharedPreferences.setString(StorageConstants.token, res.token);
        yield AuthLoginSuccessState();
      } else {
        yield AuthLoginFailState(message: 'AuthLoginFailState');
      }
    } catch (e) {
      if(e is DioError){
        if(e.response?.statusCode==401){
          yield AuthAppFailureState(
              message: e.response!.data['message']! );
        }

      }
    }
    // yield AuthInitState();
  }

  Stream<AuthState> _mapAuthSignoutState(AuthSignoutEvent event) async* {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      sharedPreferences.clear();

      yield AuthSignoutState();
    } catch (e) {
      yield AuthAppFailureState(
          message: e.toString() );
    }
  }

  Stream<AuthState> _mapAuthOnTapState(T) async* {

    if(T is Increment){
      print("Increment");
      yield AuthOnTapState(
              flag:CommonConstants.citizen
            );
    }else if(T is Decrement){
      print("decrement");
    yield  AuthOnTapState(
          flag:CommonConstants.admin
      );
    }
  }
}
