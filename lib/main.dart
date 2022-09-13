// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenta_app/blocs/auth/auth_bloc.dart';
import 'package:lenta_app/blocs/login/login_bloc.dart';
import 'package:lenta_app/blocs/register/register_bloc.dart';
import 'package:lenta_app/blocs/location/location_bloc.dart';
import 'package:lenta_app/blocs/restaurant/restaurant_bloc.dart';
import 'package:lenta_app/screens/routes.dart/app_router.gr.dart';
import 'package:lenta_app/screens/routes.dart/route_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => di.sl<AuthBloc>()..add(AppStarted())),
      BlocProvider(create: (_) => di.sl<LoginBloc>()),
      BlocProvider(create: (_) => di.sl<LocationBloc>()),
      BlocProvider(create: (_) => di.sl<RegisterBloc>()),
      BlocProvider(
          create: (_) => di.sl<RestaurantBloc>()
            ..add(FetchRestaurantEvent(queryRestuarant: ""))),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Лента',
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [MyObserver()],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
