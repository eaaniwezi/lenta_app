// ignore_for_file: non_constant_identifier_names

import 'package:lenta_app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  bool? is_favourite;
  int? id;
  String? title;
  String? description;
  int? schedule_id;
  int? coords_id;
  int? user_id;
  Schedule? schedule;
  Coords? coords;
  List<Images>? images;
  User? user;

  Restaurant(
      {this.is_favourite,
      this.id,
      this.title,
      this.description,
      this.schedule_id,
      this.coords_id,
      this.user_id,
      this.schedule,
      this.coords,
      this.images,
      this.user});

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

@JsonSerializable()
class Schedule {
  String? opening;
  String? closing;
  int? id;

  Schedule({this.opening, this.closing, this.id});
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

@JsonSerializable()
class Coords {
  double? longitude;
  double? latitude;
  String? address_name;
  int? id;

  Coords({this.longitude, this.latitude, this.address_name, this.id});
  factory Coords.fromJson(Map<String, dynamic> json) =>
      _$CoordsFromJson(json);
}

@JsonSerializable()
class Images {
  int? id;
  String? url;
  int? restaurantId;

  Images({this.id, this.url, this.restaurantId});
  factory Images.fromJson(Map<String, dynamic> json) =>
      _$ImagesFromJson(json);
}
