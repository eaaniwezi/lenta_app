import 'package:json_annotation/json_annotation.dart';

part 'tokens.g.dart';

@JsonSerializable()
class Tokens {
  String? accessToken;
  String? refreshToken;

  Tokens({
    this.accessToken,
    this.refreshToken,
  });
  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

}
