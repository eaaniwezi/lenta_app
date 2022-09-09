import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? email;
  String? nickname;

  User({
    this.id,
    this.email,
    this.nickname,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
