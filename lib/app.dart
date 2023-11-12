import 'package:Pourosova/blocs/blocs.dart';
import 'package:Pourosova/blocs/totho/totho_bloc.dart';
import 'package:Pourosova/providers/holding_entry_provider.dart';
import 'package:Pourosova/shared/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'blocs/auth/auth_bloc.dart';
import 'routes/routes.dart';
import 'theme/theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(),),
        BlocProvider(create: (context) => HomeBloc(),),
        BlocProvider(create: (context) => TothoBloc(),),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> HoldingEntryProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigatorKey,
          title: 'flutter flutter_bloc boilerplate',
          theme: ThemeConfig.lightTheme,
          onGenerateRoute: _appRouter.routes,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
