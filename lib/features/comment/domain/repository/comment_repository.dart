import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/features/comment/data/repository/comment_remote_repo_impl.dart';
import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';


final commentRepositoryProvider = Provider<ICommentRepository>((ref) {
  return ref.watch(commentRemoteRepoProvider);
});

abstract class ICommentRepository {
  Future<Either<Failure, List<CommentEntity>>> getAllComments({required String token});
  // Future<Either<Failure, CommentEntity>> postComment({required String newsid, required String content,required String token});
  // Future<Either<Failure, Unit>> deleteComment({required String commentid,required String token});
}

