import 'package:flutter/material.dart';

import '../../modules/auth/auth_screen.dart';
import '../../modules/auth/login_screen.dart';
import '../../modules/auth/register_screen.dart';
import '../../modules/get_start/get_start_screen.dart';
import '../route_path.dart';
import 'i_app_route.dart';

class AuthRoutes implements IAppRoute {
  static final String key = RoutePath.auth;

  @override
  List<String>? names = [RoutePath.auth, RoutePath.login, RoutePath.register];

  @override
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.auth:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AuthScreen(),
        );
      case RoutePath.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LoginScreen(),
        );
      case RoutePath.register:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => RegisterScreen(),
        );
      case RoutePath.getStart:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => GetStartScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AuthScreen(),
        );
    }
  }
}
