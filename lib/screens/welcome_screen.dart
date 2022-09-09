// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "ЛЕНТА",
          style: GoogleFonts.manrope(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
