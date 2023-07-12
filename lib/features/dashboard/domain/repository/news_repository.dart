import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/features/dashboard/data/repository/news_remote_repository_impl.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';

final newsRepositoryProvider = Provider<INewsRepository>((ref) {
  return ref.watch(newsRemoteRepoProvider);
});

abstract class INewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getAllNews({required String token});
}
