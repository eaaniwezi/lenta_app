// ignore_for_file: prefer_const_constructors_in_immutables

part of 'restaurant_bloc.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class FetchingRestaurantState extends RestaurantState {}

class SuccessFetchingRestaurantState extends RestaurantState {
  final List<Restaurant> allRestaurants;
  final List<Restaurant> favRestaurants;
  SuccessFetchingRestaurantState({
    required this.allRestaurants,
    required this.favRestaurants,
  });
}

class ErrorFetchingRestaurantState extends RestaurantState {}

class AddToFavListState extends RestaurantState {
  // final List<Restaurant> favRestaurants;
  // AddToFavListState({
  //   required this.favRestaurants,
  // });
}

class RemoveFromFavListState extends RestaurantState {
  // final List<Restaurant> favRestaurants;

  // RemoveFromFavListState({
  //   required this.favRestaurants,
  // });
}
