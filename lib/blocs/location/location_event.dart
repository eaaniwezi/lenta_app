// ignore_for_file: prefer_const_constructors_in_immutables

part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends LocationEvent {}

class GetCurrentLocation extends LocationEvent {
 
}
