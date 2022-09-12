import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenta_app/widgets/resturant_card_widget.dart';
import 'package:lenta_app/blocs/restaurant/restaurant_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({ Key? key }) : super(key: key);

 @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      body: BlocConsumer<RestaurantBloc, RestaurantState>(
        listener: (context, state) {},
        buildWhen: (oldState, newState) =>
            newState is FetchingRestaurantState ||
            newState is SuccessFetchingRestaurantState ||
            newState is ErrorFetchingRestaurantState,
        builder: (context, state) {
          if (state is SuccessFetchingRestaurantState) {
            var restaurantList = state.favRestaurants;
            return restaurantList.isEmpty
                ? _emptyData(size)
                : ListView.builder(
                    itemCount: restaurantList.length,
                    itemBuilder: (context, index) {
                      return ResturantCardWidget(
                          restaurantModel: restaurantList[index]);
                    });
          }

          if (state is ErrorFetchingRestaurantState) {
            return _errorState(size);
          }
          return _loadingWidget(size);
        },
      ),
    );
  }

  _errorState(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.3),
      child: Center(
        child: Text(
          "Oops!!\nError fetching data....",
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: style.Colors.redColor,
          ),
        ),
      ),
    );
  }

  _emptyData(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.3),
      child: Center(
        child: Text(
          "Oops!!\nEmpty list....",
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _loadingWidget(Size size) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.3),
        child: CircularProgressIndicator(color: style.Colors.purpleColor),
      ),
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
