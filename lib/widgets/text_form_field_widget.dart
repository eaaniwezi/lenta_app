// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  final bool isLast;
  final String hintText;
  final bool? isPassword;
  final bool? obscureText;
  final bool? isPhoneNumber;
  final String? suffixIconSvg;
  final Function? seePassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const TextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.isLast,
    this.isPassword,
    this.obscureText,
    this.seePassword,
    this.isPhoneNumber,
    this.suffixIconSvg,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            TextFormField(
              cursorColor: style.Colors.purpleColor,
              obscureText: isPassword != null ? obscureText! : false,
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              controller: controller,
              validator: validator,
              keyboardType: isPhoneNumber == true
                  ? TextInputType.number
                  : TextInputType.text,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: isPassword != true
                    ? Text("")
                    : IconButton(
                        onPressed: () {
                          seePassword!();
                        },
                        icon: SvgPicture.asset(
                          suffixIconSvg!,
                          fit: BoxFit.cover,
                          color: Colors.black,
                        ),
                      ),
                hintStyle: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: style.Colors.greyColor,
                ),
                border: InputBorder.none,
              ),
            ),
            isLast == true ? Text("") : Divider(),
          ],
        ),
      ),
    );
  }
}
