import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/core/shared-prefs/user_shared_preferences.dart';
import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';
import 'package:the_daily_digest/features/comment/domain/repository/comment_repository.dart';

final commentUseCaseProvider = Provider<CommentUseCase>(
  (ref) => CommentUseCase(
    commentRepository: ref.read(commentRepositoryProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class CommentUseCase {
  final ICommentRepository commentRepository;
  final UserSharedPrefs userSharedPrefs;

  CommentUseCase({
    required this.commentRepository,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, List<CommentEntity>>> getAllComments() async {
    String? token;

    await userSharedPrefs.getUserToken().then((value) {
      value.fold((l) => null, (r) => token = r);
    });

    if (token != null) {
      return await commentRepository.getAllComments(token: token!);
    } else {
      return Left(Failure(error: 'Token not available'));
    }
  }

  Future<Either<Failure, CommentEntity>> postComment(String newsid, String content) async {
    String? token;

    await userSharedPrefs.getUserToken().then((value) {
      value.fold((l) => null, (r) => token = r);
    });

    if (token != null) {
      return await commentRepository.postComment(newsid: newsid, content: content, token: token!, userid: '');
    } else {
      return Left(Failure(error: 'Token not available'));
    }
  }

  // Future<Either<Failure, Unit>> deleteComment(String commentid) async {
  //   String? token;

  //   await userSharedPrefs.getUserToken().then((value) {
  //     value.fold((l) => null, (r) => token = r);
  //   });

  //   if (token != null) {
  //     return await commentRepository.deleteComment(commentid: commentid, token: token!);
  //   } else {
  //     return Left(Failure(error: 'Token not available'));
  //   }
  // }
}
