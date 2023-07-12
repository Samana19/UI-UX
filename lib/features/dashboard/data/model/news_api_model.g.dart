// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsApiModel _$NewsApiModelFromJson(Map<String, dynamic> json) => NewsApiModel(
      newsId: json['_id'] as String?,
      newsName: json['newsName'] as String,
      newsDescription: json['newsDescription'] as String,
      newsPoster: json['newsPoster'] as String,
    );

Map<String, dynamic> _$NewsApiModelToJson(NewsApiModel instance) =>
    <String, dynamic>{
      '_id': instance.newsId,
      'newsName': instance.newsName,
      'newsDescription': instance.newsDescription,
      'newsPoster': instance.newsPoster,
    };
