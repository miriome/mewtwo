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

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostModel on _PostModel, Store {
  late final _$likesAtom = Atom(name: '_PostModel.likes', context: context);

  @override
  int get likes {
    _$likesAtom.reportRead();
    return super.likes;
  }

  @override
  set likes(int value) {
    _$likesAtom.reportWrite(value, super.likes, () {
      super.likes = value;
    });
  }

  late final _$my_likeAtom = Atom(name: '_PostModel.my_like', context: context);

  @override
  bool get my_like {
    _$my_likeAtom.reportRead();
    return super.my_like;
  }

  @override
  set my_like(bool value) {
    _$my_likeAtom.reportWrite(value, super.my_like, () {
      super.my_like = value;
    });
  }

  @override
  String toString() {
    return '''
likes: ${likes},
my_like: ${my_like}
    ''';
  }
}
