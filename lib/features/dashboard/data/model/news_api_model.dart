import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';

part 'news_api_model.g.dart';

final newsApiModelProvider = Provider<NewsApiModel>(
  (ref) => NewsApiModel.empty(),
);

@JsonSerializable()
class NewsApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? newsId;
  final String newsName;
  final String newsDescription;
  final String newsPoster;

  const NewsApiModel({
    this.newsId,
    required this.newsName,
    required this.newsDescription,
    required this.newsPoster,
  });
  NewsApiModel.empty()
      : newsId = '',
        newsName = '',
        newsDescription = '',
        newsPoster = '';

  Map<String, dynamic> toJson() => _$NewsApiModelToJson(this);

  factory NewsApiModel.fromJson(Map<String, dynamic> json) =>
      _$NewsApiModelFromJson(json);

  // Convert API Object to Entity
  NewsEntity toEntity() => NewsEntity(
        newsId: newsId,
        newsName: newsName,
        newsDescription: newsDescription,
        newsPoster: newsPoster,
      );

  // Convert Entity to API Object
  NewsApiModel fromEntity(NewsEntity entity) => NewsApiModel(
        newsId: entity.newsId ?? "",
        newsName: entity.newsName,
        newsDescription: entity.newsDescription,
        newsPoster: entity.newsPoster,
      );

  // Convert API List to Entity List
  List<NewsEntity> toEntityList(List<NewsApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        newsId,
        newsName,
        newsDescription,
        newsPoster,
      ];
}
