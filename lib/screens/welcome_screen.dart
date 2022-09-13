// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenta_app/blocs/auth/auth_bloc.dart'; 

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
      
          if (state is UserAuthenticated) {
            router.replaceNamed('/main-page');
          }  if (state is UserUnauthenticated) {
            router.replaceNamed('/sign-in');
          }
        },
        child: Center(
          child: Text(
            "ЛЕНТА",
            style: GoogleFonts.manrope(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
