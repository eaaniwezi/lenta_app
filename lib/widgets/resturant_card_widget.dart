// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenta_app/models/restaurant.dart';
import 'package:lenta_app/blocs/restaurant/restaurant_bloc.dart'; 
import 'package:lenta_app/screens/routes.dart/app_router.gr.dart';

import '../../const/theme.dart' as style;

class ResturantCardWidget extends StatelessWidget {
  final Restaurant restaurantModel;

  const ResturantCardWidget({
    Key? key,
    required this.restaurantModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  final router = AutoRouter.of(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
               router.push(RestaurantDetailScreenRoute(restaurantModel: restaurantModel));
        },
        child: Container(
          height: 234,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                        color: style.Colors.purpleColor),
                  )),
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: restaurantModel.images!.isEmpty
                          ? Image.asset(
                              "assets/empty_store.png",
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              restaurantModel.images![0].url.toString(),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
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
                      onPressed: () {
                        restaurantModel.is_favourite == false
                            ? BlocProvider.of<RestaurantBloc>(context).add(
                                AddToFavListEvent(
                                    resturantId: restaurantModel.id!))
                            : BlocProvider.of<RestaurantBloc>(context).add(
                                RemoveFromFavListEvent(
                                    resturantId: restaurantModel.id!));
                      },
                      icon: SvgPicture.asset(
                        restaurantModel.is_favourite == false
                            ? "assets/heart.svg"
                            : "assets/heart-filled.svg",
                      ),
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
