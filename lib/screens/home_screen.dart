// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenta_app/blocs/auth/auth_bloc.dart';
import 'package:lenta_app/widgets/search_bar_widget.dart';
import 'package:lenta_app/widgets/resturant_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: SearchBarWidget(),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is UserAuthenticated) {
                var restaurantList = state.allRestaurants;
                return restaurantList.isEmpty
                    ? _emptyData(size)
                    : Expanded(
                        child: ListView(
                            children:
                                state.allRestaurants.map((restaurantModel) {
                          return ResturantCardWidget(
                              restaurantModel: restaurantModel);
                        }).toList()),
                      );
              }
              return _loadingWidget(size);
            },
          )
        ],
      )),
    );
  }

  _emptyData(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.3),
      child: Text(
        "Oops!!\nEmpty list....",
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }

  _loadingWidget(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.3),
      child: CircularProgressIndicator(color: style.Colors.purpleColor),
    );
  }
}
