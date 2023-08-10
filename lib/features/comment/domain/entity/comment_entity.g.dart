// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) =>
    CommentEntity(
      commentid: json['commentid'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      newsid: json['newsid'] as String,
      userid: json['userid'] as String,
    );

Map<String, dynamic> _$CommentEntityToJson(CommentEntity instance) =>
    <String, dynamic>{
      'commentid': instance.commentid,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'newsid': instance.newsid,
      'userid': instance.userid,
    };
