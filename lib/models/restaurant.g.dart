// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      is_favourite: json['is_favourite'] as bool?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      schedule_id: json['schedule_id'] as int?,
      coords_id: json['coords_id'] as int?,
      user_id: json['user_id'] as int?,
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      coords: json['coords'] == null
          ? null
          : Coords.fromJson(json['coords'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'is_favourite': instance.is_favourite,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'schedule_id': instance.schedule_id,
      'coords_id': instance.coords_id,
      'user_id': instance.user_id,
      'schedule': instance.schedule,
      'coords': instance.coords,
      'images': instance.images,
      'user': instance.user,
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      opening: json['opening'] as String?,
      closing: json['closing'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'opening': instance.opening,
      'closing': instance.closing,
      'id': instance.id,
    };

Coords _$CoordsFromJson(Map<String, dynamic> json) => Coords(
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      address_name: json['address_name'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CoordsToJson(Coords instance) => <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'address_name': instance.address_name,
      'id': instance.id,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      id: json['id'] as int?,
      url: json['url'] as String?,
      restaurantId: json['restaurantId'] as int?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'restaurantId': instance.restaurantId,
    };
