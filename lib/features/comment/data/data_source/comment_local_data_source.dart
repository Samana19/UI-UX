// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:the_daily_digest/core/failure/failure.dart';
// import 'package:the_daily_digest/core/network/local/hive_service.dart';
// import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';
// import 'package:the_daily_digest/features/comments/data/model/comment_hive_model.dart';


// final commentLocalDataSourceProvider = Provider<CommentLocalDataSource>((ref) {
//   return CommentLocalDataSource(
//     hiveService: ref.watch(hiveServiceProvider),
//     commentHiveModel: ref.watch(commentHiveModelProvider),
//   );
// });

// class CommentLocalDataSource {
//   final HiveService hiveService;
//   final CommentHiveModel commentHiveModel;

//   CommentLocalDataSource({
//     required this.hiveService,
//     required this.commentHiveModel,
//   });

//   Future<Either<Failure, List<CommentEntity>>> getComments(
//       String postid) async {
//     try {
//       // Get comments for the specified post from Hive
//       final comments = await hiveService.getComments(postid);
//       // Convert Hive objects to CommentEntity objects
//       final commentEntities = commentHiveModel.toEntityList(comments);
//       return Right(commentEntities);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }

//   Future<Either<Failure, CommentEntity>> postComment(
//       CommentEntity comment) async {
//     try {
//       // Convert CommentEntity to Hive object
//       final commentObject = commentHiveModel.fromEntity(comment);
//       // Add the comment to Hive
//       await hiveService.postComment(commentObject);
//       return Right(comment);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }

//   Future<Either<Failure, Unit>> deleteComment(String commentid) async {
//     try {
//       // Delete the comment from Hive
//       await hiveService.deleteComment(commentid);
//       return Right(unit);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }
// }
