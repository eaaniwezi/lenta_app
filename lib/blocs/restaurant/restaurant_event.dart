// ignore_for_file: prefer_const_constructors_in_immutables

part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();

  @override
  List<Object> get props => [];
}

class FetchRestaurantEvent extends RestaurantEvent {
  final String queryRestuarant;
  const FetchRestaurantEvent({
    required this.queryRestuarant,
  });
  @override
  List<Object> get props => [ queryRestuarant];
}

class AddToFavListEvent extends RestaurantEvent {
  final int resturantId;
  AddToFavListEvent({
    required this.resturantId,
  });
  @override
  List<Object> get props => [resturantId];
}

class RemoveFromFavListEvent extends RestaurantEvent {
  final int resturantId;
  RemoveFromFavListEvent({
    required this.resturantId,
  });
  @override
  List<Object> get props => [resturantId];
}
