// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ResturantCardWidget extends StatelessWidget {
  const ResturantCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 234,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  "https://www.chasingpoland.com/images/shopping-g01fceb92f_1920dsdsds.jpg",
                  // width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.45,
                        child: Text(
                          "EsentailEsentailEsentailEsentailEsentail Mall",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.7,
                        child: Text(
                          "EsentailEsentailEsentailEsentailEsentailEsentailEsentailEsentailEsentailEsentail Mall",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.manrope(
                            fontSize: 13,
                            color: style.Colors.greyTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.7,
                        child: Text(
                          "EsentailEsentailEsentailEsentailEsentail Mall",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.manrope(
                            fontSize: 13,
                            color: style.Colors.greyTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/heart.svg"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
