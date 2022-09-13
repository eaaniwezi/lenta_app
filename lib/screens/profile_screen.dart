// ignore_for_file: prefer_const_constructors

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenta_app/blocs/auth/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UserUnauthenticated) {
          router.replaceNamed('/sign-in');
        }
      },
      child: Scaffold(
        appBar: _appBar(),
        body: ListView(
          children: [
            SizedBox(height: 30),
            SvgPicture.asset(
              "assets/profile.svg",
              color: Colors.black,
              height: 64,
              width: 64,
            ),
            SizedBox(height: 15),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is UserAuthenticated) {
                      var userModel = state.userModel;
                      return Text(
                        userModel.nickname.toString(),
                        style: GoogleFonts.manrope(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                    return Text(
                      "......",
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is UserAuthenticated) {
                      var userModel = state.userModel;
                      return Text(
                        userModel.email.toString(),
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }
                    return Text(
                      "......",
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 64,
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () =>
                        BlocProvider.of<AuthBloc>(context).add(LogOutEvent()),
                    child: Text(
                      "Выйти",
                      style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: style.Colors.redColor),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Профиль",
        style: GoogleFonts.manrope(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
