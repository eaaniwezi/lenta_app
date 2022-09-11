// ignore_for_file: unnecessary_new, empty_catches

import 'package:lenta_app/models/restaurant.dart';
import 'package:lenta_app/repositories/dio_config.dart';

class RestaurantRepo {
  Future<List<Restaurant>> getAllRestaurants({required String query}) async {
    List<Restaurant> _intialList = [];
    List<Restaurant> _searchedList = [];
    try {
      var response =
          await Api().api.get("/api/v1/restaurants/all?page=1&perPage=10");
      for (var resturant in response.data['restaurants']) {
        Restaurant _completeRestaurantList = Restaurant.fromJson(resturant);
        _intialList.add(_completeRestaurantList);
      }
      if (query.isEmpty) {
        return _intialList;
      } else {
        _searchedList = _intialList.where((restaurantModel) {
          return restaurantModel.title!
              .toLowerCase()
              .contains(query.toLowerCase());
        }).toList();
      }
      return _searchedList;
    } catch (e) {
      return _intialList;
    }
  }

  Future<List<Restaurant>> getFavRestaurants() async {
    List<Restaurant> _favList = [];
    try {
      var response = await Api().api.get("/api/v1/likes/all");
      for (var resturant in response.data['restaurants']) {
        Restaurant _completeRestaurantList = Restaurant.fromJson(resturant);
        _favList.add(_completeRestaurantList);
      }
      return _favList;
    } catch (e) {
      return _favList;
    }
  }

  Future<void> addToFavList({required int resturantId}) async {
    try {
      var requestData = {"restaurant_id": resturantId};
      await Api().api.post("/api/v1/likes/new", data: requestData);
    } catch (e) {}
  }

  Future<void> removeFromFavList({required int resturantId}) async {
    try {
      await Api().api.delete("/api/v1/likes/$resturantId");
    } catch (e) {}
  }
}
