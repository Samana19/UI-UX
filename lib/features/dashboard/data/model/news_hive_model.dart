import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:the_daily_digest/config/constants/hive_table_constant.dart';
import 'package:the_daily_digest/features/dashboard/data/model/news_api_model.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';
import 'package:uuid/uuid.dart';

// dart run build_runner build --delete-conflicting-outputs
part 'news_hive_model.g.dart';

final newsHiveModelProvider = Provider(
  (ref) => NewsHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.newsTableId)
class NewsHiveModel {
  @HiveField(0)
  final String newsId;
  @HiveField(1)
  final String newsPoster;
  @HiveField(2)
  final String newsName;
  @HiveField(3)
  final String newsDescription;

  //empty constructor
  NewsHiveModel.empty()
      : newsId = '',
        newsPoster = '',
        newsName = '',
        newsDescription = '';

  NewsHiveModel({
    String? newsId,
    required this.newsPoster,
    required this.newsName,
    required this.newsDescription,
  }) : newsId = newsId ?? const Uuid().v4();

  // Convert hive Object to Entity
  NewsEntity toEntity() => NewsEntity(
        newsId: newsId,
        newsPoster: newsPoster,
        newsName: newsName,
        newsDescription: newsDescription,
      );

  // Convert Entity to hive Object
  NewsHiveModel toHiveModel(NewsEntity entity) => NewsHiveModel(
        // newsId: entity.newsId ?? '',
        newsPoster: entity.newsPoster,
        newsName: entity.newsName,
        newsDescription: entity.newsDescription,
      );

  // Convert hive List to Entity List
  List<NewsEntity> toEntityList(List<NewsHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  // Convert api List to hive List
  List<NewsHiveModel> fromApiModelList(List<NewsApiModel> apiModels) {
    return apiModels
        .map((apiModel) => NewsHiveModel(
              newsPoster: apiModel.newsPoster,
              newsName: apiModel.newsName,
              newsDescription: apiModel.newsDescription,
            ))
        .toList();
  }

  @override
  String toString() {
    return 'NewsHiveModel(newsId: $newsId, newsPoster: $newsPoster, newsName: $newsName, newsDescription: $newsDescription)';
  }
}
