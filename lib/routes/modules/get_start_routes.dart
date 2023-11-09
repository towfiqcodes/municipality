import 'package:flutter/material.dart';
import '../../modules/auth/auth_screen.dart';
import '../../modules/get_start/get_start_screen.dart';
import '../route_path.dart';
import 'i_app_route.dart';

class GetStartRoutes implements IAppRoute {
  static final String key = RoutePath.getStart;
  // final HomeBloc _homeBloc = new HomeBloc();

  @override
  List<String>? names = [RoutePath.getStart];

  @override
  Route routes(RouteSettings settings) {
    switch (settings.name) {
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
