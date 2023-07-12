import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/core/shared-prefs/user_shared_preferences.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';
import 'package:the_daily_digest/features/dashboard/domain/repository/news_repository.dart';

final newsUseCaseProvider = Provider<NewsUseCase>(
  (ref) => NewsUseCase(
    newsRepository: ref.read(newsRepositoryProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class NewsUseCase {
  final INewsRepository newsRepository;
  final UserSharedPrefs userSharedPrefs;

  NewsUseCase({
    required this.newsRepository,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, List<NewsEntity>>> getAllNews() async {
    String? token;

    await userSharedPrefs.getUserToken().then((value) {
      value.fold((l) => null, (r) => token = r);
    });

    if (token != null) {
      return await newsRepository.getAllNews(token: token!);
    } else {
      return Left(Failure(error: 'Token not available'));
    }
  }
}
