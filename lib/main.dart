// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:lenta_app/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenta_app/blocs/auth/auth_bloc.dart';
import 'package:lenta_app/screens/welcome_screen.dart';
import 'package:lenta_app/blocs/login/login_bloc.dart';
import 'package:lenta_app/blocs/register/register_bloc.dart';

import 'package:lenta_app/screens/sign_in_screen.dart';

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
      BlocProvider(create: (_) => di.sl<RegisterBloc>())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Лента',
      debugShowCheckedModeBanner: false,
      // home: SignInScreen(),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
            if (state is UserAuthenticated){
                return MainPage();
            } else if (state is UserUnauthenticated){
              return SignInScreen();
            }
          return WelcomeScreen();
        },
      ),
    );
  }
}
