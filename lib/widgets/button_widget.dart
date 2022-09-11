// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonLabel;
  final Function onPressed;
  const ButtonWidget({
    Key? key,
    required this.buttonLabel,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 15),
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          onPressed();
        },
        child: Container(
          height: 64,
          decoration: BoxDecoration(
              color: style.Colors.purpleColor,
              borderRadius: BorderRadius.circular(6)),
          child: Center(
            child: Text(
              buttonLabel,
              style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
