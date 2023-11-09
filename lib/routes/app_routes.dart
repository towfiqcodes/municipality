import 'package:Pourosova/modules/auth/login_screen.dart';
import 'package:flutter/material.dart';


import '../modules/splash/splash_screen.dart';
import 'app_routes_factory.dart';
import 'modules/auth_routes.dart';
import 'modules/get_start_routes.dart';
import 'modules/home_routes.dart';
import 'modules/me_routes.dart';
import 'routes.dart';

class AppRoutes {
  static final AppRoutes _singleton = new AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal() {
    _appRoutesFactory = new AppRoutesFactory();
    _appRoutesFactory?.registerRoutes(AuthRoutes.key, new AuthRoutes());
    _appRoutesFactory?.registerRoutes(GetStartRoutes.key, GetStartRoutes());
    _appRoutesFactory?.registerRoutes(HomeRoutes.key, HomeRoutes());
    _appRoutesFactory?.registerRoutes(MeRoutes.key, new MeRoutes());

    print('AppRoutes._internal()');
  }

  AppRoutesFactory? _appRoutesFactory;

  Route routes(RouteSettings settings) {
    if (settings.name == RoutePath.root) {
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => LoginScreen(),
      );
    }

    return _appRoutesFactory!.routes(settings);
  }
}
