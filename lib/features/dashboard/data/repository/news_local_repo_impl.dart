import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/features/dashboard/data/data_source/news_local_data_source.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';
import 'package:the_daily_digest/features/dashboard/domain/repository/news_repository.dart';

final newsLocalRepoProvider = Provider<INewsRepository>((ref) {
  return NewsLocalRepositoryImpl(
    newsLocalDataSource: ref.watch(newsLocalDataSourceProvider),
  );
});

class NewsLocalRepositoryImpl implements INewsRepository {
  final NewsLocalDataSource newsLocalDataSource;

  NewsLocalRepositoryImpl({
    required this.newsLocalDataSource,
  });

  @override
  Future<Either<Failure, List<NewsEntity>>> getAllNews(
      {required String token}) async {
    return await newsLocalDataSource.getAllNews();
  }
}
