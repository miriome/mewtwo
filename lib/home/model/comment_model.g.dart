// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: Utility.parseInt(json['id']),
      user_id: Utility.parseInt(json['user_id']),
      post_id: Utility.parseInt(json['post_id']),
      created_timestamp: Utility.parseInt(json['created_timestamp']),
      comment: json['comment'] as String,
      created_at: json['created_at'] as String,
      commented_by:
          UserModel.fromJson(json['commented_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'post_id': instance.post_id,
      'created_timestamp': instance.created_timestamp,
      'comment': instance.comment,
      'created_at': instance.created_at,
      'commented_by': instance.commented_by.toJson(),
    };
