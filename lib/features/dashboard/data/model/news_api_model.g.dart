// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsApiModel _$NewsApiModelFromJson(Map<String, dynamic> json) => NewsApiModel(
      newsid: json['_id'] as String?,
      newsName: json['newsName'] as String,
      newsDescription: json['newsDescription'] as String,
      newsPoster: json['newsPoster'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] as String,
      userid: json['userid'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$NewsApiModelToJson(NewsApiModel instance) =>
    <String, dynamic>{
      '_id': instance.newsid,
      'newsName': instance.newsName,
      'newsDescription': instance.newsDescription,
      'newsPoster': instance.newsPoster,
      'comments': instance.comments,
      'category': instance.category,
      'userid': instance.userid,
      'createdAt': instance.createdAt.toIso8601String(),
    };
