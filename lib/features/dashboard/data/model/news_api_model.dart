import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';

part 'news_api_model.g.dart';

final newsApiModelProvider = Provider<NewsApiModel>(
  (ref) => NewsApiModel.empty(),
);

@JsonSerializable()
class NewsApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? newsid;
  final String newsName;
  final String newsDescription;
  final String newsPoster;
  final String category;
  final String userid;
  final DateTime createdAt;

  NewsApiModel({
    this.newsid,
    required this.newsName,
    required this.newsDescription,
    required this.newsPoster,
    required this.category,
    required this.userid,
    required this.createdAt,
  });

  NewsApiModel.empty()
      : newsid = '',
        newsName = '',
        newsDescription = '',
        newsPoster = '',
        category = '',
        userid = '',
        createdAt = DateTime.now();

  Map<String, dynamic> toJson() => _$NewsApiModelToJson(this);

  factory NewsApiModel.fromJson(Map<String, dynamic> json) =>
      _$NewsApiModelFromJson(json);

  // Convert API Object to Entity
  NewsEntity toEntity() => NewsEntity(
        newsid: newsid,
        newsName: newsName,
        newsDescription: newsDescription,
        newsPoster: newsPoster,
        category: category,
        userid: userid,
        createdAt: createdAt,
      );

  // Convert Entity to API Object
  NewsApiModel fromEntity(NewsEntity entity) => NewsApiModel(
        newsid: entity.newsid ?? "",
        newsName: entity.newsName,
        newsDescription: entity.newsDescription,
        newsPoster: entity.newsPoster,
        category: entity.category,
        userid: entity.userid,
        createdAt: entity.createdAt,
      );

  // Convert API List to Entity List
  List<NewsEntity> toEntityList(List<NewsApiModel> models) =>
      models.map((model) => toEntity()).toList();

  @override
  String toString() {
    return 'NewsApiModel(newsid: $newsid, newsName: $newsName, newsDescription: $newsDescription, newsPoster: $newsPoster,  category: $category, userid: $userid, createdAt: $createdAt)';
  }

  @override
  List<Object?> get props => [
        newsid,
        newsName,
        newsDescription,
        newsPoster,
        category,
        userid,
        createdAt,
      ];
}
