// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenta_app/models/restaurant.dart';
import 'package:lenta_app/screens/restaurant_detail_screen.dart';


class ResturantCardWidget extends StatelessWidget {
  final Restaurant restaurantModel;
  const ResturantCardWidget({
    Key? key,
    required this.restaurantModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Get.to(
              () => RestaurantDetailScreen(restaurantModel: restaurantModel));
        },
        child: Container(
          height: 234,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: restaurantModel.images!.isEmpty
                      ? Image.asset(
                          "assets/empty_store.png",
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          restaurantModel.images![0].url.toString(),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: Text(
                            restaurantModel.title.toString(),
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
                            restaurantModel.description.toString(),
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
                            restaurantModel.coords!.address_name.toString(),
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
      ),
    );
  }
}
