// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:the_daily_digest/core/failure/failure.dart';
// import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';
// import 'package:the_daily_digest/features/comments/data/data_source/comment_local_data_source.dart';
// import 'package:the_daily_digest/features/comments/domain/entity/comment_entity.dart';
// import 'package:the_daily_digest/features/comments/domain/repository/comment_repository.dart';

// final commentLocalRepoProvider = Provider<ICommentRepository>((ref) {
//   return CommentLocalRepositoryImpl(
//     commentLocalDataSource: ref.watch(commentLocalDataSourceProvider),
//   );
// });

// class CommentLocalRepositoryImpl implements ICommentRepository {
//   final CommentLocalDataSource commentLocalDataSource;

//   CommentLocalRepositoryImpl({
//     required this.commentLocalDataSource,
//   });

//   @override
//   Future<Either<Failure, List<CommentEntity>>> getCommentsForNews(
//       String newsid) async {
//     try {
//       final comments = await commentLocalDataSource.getCommentsForNews(newsid);
//       return Right(comments);
//     } catch (e) {
//       return Left(Failure('Failed to get comments for news: $newsid'));
//     }
//   }

//   @override
//   Future<Either<Failure, CommentEntity>> addComment(
//       CommentEntity comment) async {
//     try {
//       final addedComment =
//           await commentLocalDataSource.addComment(comment);
//       return Right(addedComment);
//     } catch (e) {
//       return Left(Failure('Failed to add comment'));
//     }
//   }

//   @override
//   Future<Either<Failure, Unit>> deleteComment(String commentId) async {
//     try {
//       await commentLocalDataSource.deleteComment(commentId);
//       return Right(unit);
//     } catch (e) {
//       return Left(Failure('Failed to delete comment: $commentId'));
//     }
//   }
// }
