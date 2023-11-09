import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../blocs/home/home_bloc.dart';
import '../../modules/auth/auth_screen.dart';
import '../../modules/home/home_screen.dart';
import '../route_path.dart';
import 'i_app_route.dart';

class HomeRoutes implements IAppRoute {
  static final String key = RoutePath.home;
  final HomeBloc _homeBloc = new HomeBloc();

  @override
  List<String>? names = [RoutePath.home];

  @override
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: _homeBloc,
            child: HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AuthScreen(),
        );
    }
  }
}
