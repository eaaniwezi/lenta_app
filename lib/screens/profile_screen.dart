// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../const/theme.dart' as style;
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Text(
                "Aninwezi Emmanuel",
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(
                "eaaninwezi@gmail.com",
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
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
                child: Text(
                  "Выйти",
                  style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: style.Colors.redColor),
                ),
              ),
            ),
          )
        ],
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
