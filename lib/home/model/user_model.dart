import 'package:json_annotation/json_annotation.dart';
import 'package:mewtwo/utils.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(
    fromJson: Utility.parseInt,
  )
  final int id;
  @JsonKey(
    fromJson: Utility.parseInt,
  )
  final int followers;
  @JsonKey(fromJson: Utility.parseBool)
  final bool myFollow;
  final String styles, username, name, photo_url;
  final String? email, password, pronouns, weight, height, bust, waist, hips;

  UserModel(
      {required this.id,
      required this.followers,
      required this.myFollow,
      required this.styles,
      required this.username,
      required this.name,
      required this.photo_url,
      required this.weight,
      required this.height,
      required this.bust,
      required this.waist,
      required this.hips,
      this.email,
      this.password,
      this.pronouns});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
