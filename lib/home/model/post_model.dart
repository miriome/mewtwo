import 'package:json_annotation/json_annotation.dart';
import 'package:mewtwo/home/model/comment_model.dart';
import 'package:mewtwo/home/model/user_model.dart';
import 'package:mewtwo/utils.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx/mobx.dart';
part 'post_model.g.dart';


@JsonSerializable(explicitToJson: true)
class PostModel extends _PostModel with _$PostModel {
  PostModel({
    required super.image,
    required super.caption,
    required super.hypertext,
    required super.hyperlink,
    required super.created_at,
    required super.id,
    required super.chat_enabled,
    required super.added_by,
    required super.likes,
    required super.my_like,
    super.hashtag,
    super.posted_by,
    super.comments
  });
  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  /// Connect the generated [_$PostModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}


abstract class _PostModel with Store {
  final String image;
  final String caption;
  final String hypertext;
  final String hyperlink;
  final String created_at;
  @JsonKey(
    fromJson: Utility.parseInt,
  )
  final int id;
  //try. if not stick to int
  @JsonKey(
    fromJson: Utility.parseBool,
  )
  final bool chat_enabled;
  @JsonKey(
    fromJson: Utility.parseInt,
  )
  final int added_by;

  @observable
  @JsonKey(
    fromJson: Utility.parseInt,
  )
  int likes;
  //try. if not stick to int
  @JsonKey(
    fromJson: Utility.parseBool,
  )
  @observable
  bool my_like;
  final String? hashtag;
  final UserModel? posted_by;

  final List<CommentModel>? comments;

  _PostModel({
    required this.image,
    required this.caption,
    required this.hypertext,
    required this.hyperlink,
    required this.created_at,
    required this.id,
    required this.chat_enabled,
    required this.added_by,
    required this.likes,
    required this.my_like,
    this.hashtag,
    this.posted_by,
    required this.comments
  });

}
