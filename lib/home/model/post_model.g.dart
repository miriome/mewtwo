// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      image: json['image'] as String,
      caption: json['caption'] as String,
      hypertext: json['hypertext'] as String,
      hyperlink: json['hyperlink'] as String,
      created_at: json['created_at'] as String,
      id: Utility.parseInt(json['id']),
      chat_enabled: Utility.parseBool(json['chat_enabled']),
      added_by: Utility.parseInt(json['added_by']),
      likes: Utility.parseInt(json['likes']),
      my_like: Utility.parseBool(json['my_like']),
      hashtag: json['hashtag'] as String?,
      posted_by: json['posted_by'] == null
          ? null
          : UserModel.fromJson(json['posted_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'image': instance.image,
      'caption': instance.caption,
      'hypertext': instance.hypertext,
      'hyperlink': instance.hyperlink,
      'created_at': instance.created_at,
      'id': instance.id,
      'chat_enabled': instance.chat_enabled,
      'added_by': instance.added_by,
      'likes': instance.likes,
      'my_like': instance.my_like,
      'hashtag': instance.hashtag,
      'posted_by': instance.posted_by?.toJson(),
    };
