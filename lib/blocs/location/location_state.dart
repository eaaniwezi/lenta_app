// ignore_for_file: prefer_const_constructors_in_immutables

part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class CurrentLocationFetchingState extends LocationState {}

class CurrentLocationSuccessState extends LocationState {
  final Position currentLocation;
  final List<Restaurant> allRestaurants;
  CurrentLocationSuccessState({
    required this.currentLocation,
    required this.allRestaurants,
  });
}

class CurrentLocationErrorState extends LocationState {}
