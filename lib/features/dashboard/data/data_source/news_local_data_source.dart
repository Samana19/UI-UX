
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/core/network/local/hive_service.dart';
import 'package:the_daily_digest/features/dashboard/data/model/news_hive_model.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';

final newsLocalDataSourceProvider = Provider<NewsLocalDataSource>((ref) {
  return NewsLocalDataSource(
    hiveService: ref.watch(hiveServiceProvider),
    newsHiveModel: ref.watch(newsHiveModelProvider),
  );
});

class NewsLocalDataSource {
  final HiveService hiveService;
  final NewsHiveModel newsHiveModel;

  NewsLocalDataSource({
    required this.hiveService,
    required this.newsHiveModel,
  });

  Future<Either<Failure, List<NewsEntity>>> getAllNews() async {
    try {
      // Get all News from Hive
      final news = await hiveService.getAllNews();
      // Convert Hive Object to Entity
      final newsEntities = newsHiveModel.toEntityList(news);
      return Right(newsEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}