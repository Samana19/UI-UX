import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';

class CommentState {
  final bool isLoading;
  final List<CommentEntity> comment;
  final String? error;

  CommentState({
    required this.isLoading,
    required this.comment,
    this.error,
  });

  factory CommentState.initial() {
    return CommentState(
      isLoading: false,
      comment: [],
    );
  }

  bool get hasError => error != null;
  List<CommentEntity> get data => comment;

  CommentState copyWith({
    bool? isLoading,
    List<CommentEntity>? comment,
    String? error,
  }) {
    return CommentState(
      isLoading: isLoading ?? this.isLoading,
      comment: comment ?? this.comment,
      error: error ?? this.error,
    );
  }
}
