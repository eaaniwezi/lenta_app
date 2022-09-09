import 'package:json_annotation/json_annotation.dart';
import 'package:lenta_app/models/user.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  bool? isFavourite;
  int? id;
  String? title;
  String? description;
  int? scheduleId;
  int? coordsId;
  int? userId;
  Schedule? schedule;
  Coords? coords;
  List<Images>? images;
  User? user;

  Restaurant(
      {this.isFavourite,
      this.id,
      this.title,
      this.description,
      this.scheduleId,
      this.coordsId,
      this.userId,
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
  String? addressName;
  int? id;

  Coords({this.longitude, this.latitude, this.addressName, this.id});
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
