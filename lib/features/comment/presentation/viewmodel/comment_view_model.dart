import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/features/comment/domain/use_case/comment_usecase.dart';
import 'package:the_daily_digest/features/comment/presentation/state/comment_state.dart';


final CommentViewModelProvider =
    StateNotifierProvider<CommentViewModel, CommentState>(
  (ref) => CommentViewModel(ref.read(commentUseCaseProvider)),
);

class CommentViewModel extends StateNotifier<CommentState> {
  final CommentUseCase commentUseCase;

  CommentViewModel(this.commentUseCase) : super(CommentState.initial()) {
    getAllComments();
  }

  getAllComments() async {
    state.copyWith(isLoading: true);
    var data = await commentUseCase.getAllComments();
    data.fold(
      (l) => state.copyWith(isLoading: true, error: l.error),
      (r) => state = state.copyWith(isLoading: false, comment: r, error: null),
    );
  }
}
