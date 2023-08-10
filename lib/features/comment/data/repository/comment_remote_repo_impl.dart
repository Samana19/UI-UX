import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/core/utils/internet_connect.dart';
import 'package:the_daily_digest/features/comment/data/data_source/comment_remote_data_source.dart';
import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';
import 'package:the_daily_digest/features/comment/domain/repository/comment_repository.dart';

final commentRemoteRepoProvider = Provider<ICommentRepository>(
  (ref) => CommentRemoteRepoImpl(
    commentRemoteDataSource: ref.read(commentRemoteDataSourceProvider),
  ),
);

class CommentRemoteRepoImpl implements ICommentRepository {
  final CommentRemoteDataSource commentRemoteDataSource;

  CommentRemoteRepoImpl({
    required this.commentRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<CommentEntity>>> getAllComments({
    // required String newsid,
    required String token,
  }) async {

    if (await checkConnectivity()) {
      return await commentRemoteDataSource.getAllComments( token:token);
    } else {
      return Left(Failure(error: 'No internet connection - Failed to fetch comments'));
    }
  }

  // @override
  // Future<Either<Failure, CommentEntity>> postComment({
  //   required String newsid,
  //   required String content,
  //   required String token,
  // }) async {
  //   if (await checkConnectivity()) {
  //     return await commentRemoteDataSource.postComment(newsid, content, token);
  //   } else {
  //     return Left(Failure(error: 'No internet connection - Failed to add comment'));
  //   }
  // }

  // @override
  // Future<Either<Failure, Unit>> deleteComment({
  //   required String commentid,
  //   required String token,
  // }) async {
  //   if (await checkConnectivity()) {
  //     return await commentRemoteDataSource.deleteComment(commentid, token);
  //   } else {
  //     return Left(Failure(error: 'No internet connection - Failed to delete comment'));
  //   }
  // }
}
