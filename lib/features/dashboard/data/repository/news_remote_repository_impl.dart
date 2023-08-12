import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/core/utils/internet_connect.dart';
import 'package:the_daily_digest/features/dashboard/data/data_source/news_local_data_source.dart';
import 'package:the_daily_digest/features/dashboard/data/data_source/news_remote_data_source.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';
import 'package:the_daily_digest/features/dashboard/domain/repository/news_repository.dart';

final newsRemoteRepoProvider = Provider<INewsRepository>(
  (ref) => NewsRemoteRepoImpl(
      newsRemoteDataSource: ref.read(newsRemoteDataSourceProvider),
      newsLocalDataSource: ref.read(newsLocalDataSourceProvider)),
);

class NewsRemoteRepoImpl implements INewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsLocalDataSource newsLocalDataSource;
  NewsRemoteRepoImpl(
      {required this.newsRemoteDataSource, required this.newsLocalDataSource});
  @override
  Future<Either<Failure, List<NewsEntity>>> getAllNews({
    required String token,
  }) async {
    final a = await checkConnectivity();

    if (a) {
      return await newsRemoteDataSource.getAllNews(token: token);
    } else {
      return newsLocalDataSource.getAllNews();
    }
    // return newsLocalDataSource.getAllNews();
  }
}
