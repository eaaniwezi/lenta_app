// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../const/theme.dart' as style;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchBarWidget extends StatelessWidget {
  final bool? isMapScreen;
  final Function(String)? sendFunction;
  const SearchBarWidget({
    Key? key,
    this.isMapScreen,
    this.sendFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CupertinoSearchTextField(
        style: GoogleFonts.manrope(
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        onChanged: sendFunction,
        decoration: BoxDecoration(
          color: isMapScreen == true ? Colors.white : null,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: style.Colors.greyColor),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 5,
          ),
          child: SvgPicture.asset(
            "assets/search.svg",
            height: 14.93,
            width: 14.93,
          ),
        ),
        placeholder: "Поиск",
        placeholderStyle: GoogleFonts.manrope(
          fontSize: 13,
          color: style.Colors.greyColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
