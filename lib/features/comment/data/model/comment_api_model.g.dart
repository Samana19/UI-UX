// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentApiModel _$CommentApiModelFromJson(Map<String, dynamic> json) =>
    CommentApiModel(
      commentid: json['_id'] as String?,
      content: json['content'] as String,
      userid: json['userid'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CommentApiModelToJson(CommentApiModel instance) =>
    <String, dynamic>{
      '_id': instance.commentid,
      'content': instance.content,
      'userid': instance.userid,
      'createdAt': instance.createdAt.toIso8601String(),
    };
