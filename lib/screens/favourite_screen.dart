import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Избранные",
        style: GoogleFonts.manrope(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
