// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../const/theme.dart' as style;
import 'package:google_fonts/google_fonts.dart';
import 'package:lenta_app/models/restaurant.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final Restaurant restaurantModel;
  const RestaurantDetailScreen({
    Key? key,
    required this.restaurantModel,
  }) : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  dynamic maxLines = 2;
  bool isTextExpanded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: size.height * 0.3,
                width: double.infinity,
                child: widget.restaurantModel.images!.isEmpty
                    ? Image.asset(
                        "assets/empty_store.png",
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        widget.restaurantModel.images![0].url.toString(),
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                      color: Colors.white,
                    ),
                    Text(
                      widget.restaurantModel.title.toString(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: SvgPicture.asset(
                        "assets/heart.svg",
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          _text(
            title: "Описание",
            isUnderlined: false,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 14, right: 14),
            child: Text(
              widget.restaurantModel.description.toString(),
              textAlign: TextAlign.justify,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          _text(
            title: isTextExpanded == false ? "Подробнее" : "Поменьше",
            isUnderlined: true,
          ),
          Divider(),
          _extraInfo(
            icon: "assets/clock.svg",
            extraInfo:
                "Работаем с ${widget.restaurantModel.schedule!.opening} до ${widget.restaurantModel.schedule!.closing}",
          ),
          _extraInfo(
            icon: "assets/location.svg",
            extraInfo: widget.restaurantModel.coords!.address_name.toString(),
          ),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }

  void toggleMaxLineWidth() {
    if (isTextExpanded == false) {
      setState(() {
        isTextExpanded = true;
        maxLines = 500;
      });
    } else if (isTextExpanded == true) {
      setState(() {
        isTextExpanded = false;
        maxLines = 2;
      });
    }
  }

  _text({
    required String title,
    required bool isUnderlined,
  }) {
    return Padding(
      padding: EdgeInsets.only(
          top: isUnderlined ? 10 : 14, left: 14, bottom: isUnderlined ? 10 : 0),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          isUnderlined == true ? toggleMaxLineWidth() : null;
        },
        child: Text(
          title,
          style: GoogleFonts.manrope(
              fontSize: 13,
              color: isUnderlined == true
                  ? style.Colors.purpleColor
                  : style.Colors.greyTextColor,
              fontWeight: FontWeight.w400,
              decoration: isUnderlined == true
                  ? TextDecoration.underline
                  : TextDecoration.none),
        ),
      ),
    );
  }

  _extraInfo({required String icon, required String extraInfo}) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 10),
          Text(
            extraInfo,
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
