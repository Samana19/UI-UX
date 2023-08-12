import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:the_daily_digest/config/constants/hive_table_constant.dart';
import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';
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
  final String newsid;
  @HiveField(1)
  final String newsPoster;
  @HiveField(2)
  final String newsName;
  @HiveField(3)
  final String newsDescription;

  @HiveField(4)
  final String category;
  @HiveField(5)
  final String userid;
  @HiveField(6)
  final DateTime createdAt;

  //empty constructor
  NewsHiveModel.empty()
      : newsid = '',
        newsPoster = '',
        newsName = '',
        newsDescription = '',
        category = '',
        userid = '',
        createdAt = DateTime.now();

  NewsHiveModel({
    String? newsid,
    required this.newsPoster,
    required this.newsName,
    required this.newsDescription,
    required this.category,
    required this.userid,
    required this.createdAt,
  }) : newsid = newsid ?? const Uuid().v4();

  // Convert hive Object to Entity
  NewsEntity toEntity() => NewsEntity(
        newsid: newsid,
        newsPoster: newsPoster,
        newsName: newsName,
        newsDescription: newsDescription,
        category: category,
        userid: userid,
        createdAt: createdAt,
      );

  // Convert Entity to hive Object
  NewsHiveModel toHiveModel(NewsEntity entity) => NewsHiveModel(
        // newsid: entity.newsid ?? '',
        newsPoster: entity.newsPoster,
        newsName: entity.newsName,
        newsDescription: entity.newsDescription,
        category: entity.category,
        userid: entity.userid,
        createdAt: entity.createdAt,
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
              category: apiModel.category,
              userid: apiModel.userid,
              createdAt: apiModel.createdAt,
            ))
        .toList();
  }

  @override
  String toString() {
    return 'NewsHiveModel(newsid: $newsid, newsPoster: $newsPoster, newsName: $newsName, newsDescription: $newsDescription,  category: $category, userid: $userid, createdAt: $createdAt)';
  }
}
