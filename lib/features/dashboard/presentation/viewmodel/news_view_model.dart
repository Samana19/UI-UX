import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/features/dashboard/domain/use_case/news_usecase.dart';
import 'package:the_daily_digest/features/dashboard/presentation/state/news_state.dart';

final newsViewModelProvider =
    StateNotifierProvider<NewsViewModel, NewsState>(
  (ref) => NewsViewModel(ref.read(newsUseCaseProvider)),
);

class NewsViewModel extends StateNotifier<NewsState> {
  final NewsUseCase newsUseCase;

  NewsViewModel(this.newsUseCase) : super(NewsState.initial()) {
    getAllNews();
  }

  getAllNews() async {
    state.copyWith(isLoading: true);
    var data = await newsUseCase.getAllNews();
    data.fold(
      (l) => state.copyWith(isLoading: true, error: l.error),
      (r) => state = state.copyWith(isLoading: false, news: r, error: null),
    );
  }
}
