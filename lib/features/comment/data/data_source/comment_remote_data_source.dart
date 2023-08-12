import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../domain/entity/comment_entity.dart';
import '../model/comment_api_model.dart';

final commentRemoteDataSourceProvider =
    Provider((ref) => CommentRemoteDataSource(
          dio: ref.read(httpServiceProvider),
          commentApiModel: ref.read(commentApiModelProvider),
        ));

class CommentRemoteDataSource {
  final Dio dio;
  final CommentApiModel commentApiModel;

  CommentRemoteDataSource({
    required this.dio,
    required this.commentApiModel,
  });

  Future<Either<Failure, List<CommentEntity>>> getAllComments({
    required String token,
  }) async {
    try {
      var response = await dio.get(
        ApiEndpoints.getAllComments,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        var list = response.data as List;
        List<CommentApiModel> commentList = list
            .map((item) =>
                CommentApiModel.fromJson(item as Map<String, dynamic>))
            .toList();

        final commentEntities = commentList.map((comment) {
          return commentApiModel.toEntity();
        }).toList();
        print("comment entities: $commentEntities");

        return Right(commentEntities);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, CommentEntity>> postComment({
    required String token,
    required String newsId,
    required String content,
    required String userid,
  }) async {
    try {
      var response = await dio.post(
        ApiEndpoints.postComment,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {
          'newsId': newsId,
          'content': content,
          'userid': userid,
        },
      );

      if (response.statusCode == 201) {
        final comment = CommentApiModel.fromJson(response.data);
        final commentEntity = comment.toEntity();

        return Right(commentEntity);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, CommentEntity>> updateComment({
    required String token,
    required String commentId,
    required String updatedContent,
    required String content,
  }) async {
    try {
      var response = await dio.put(
        '${ApiEndpoints.updateComment}/$commentId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {
          'content': updatedContent,
        },
      );

      if (response.statusCode == 200) {
        final updatedComment = CommentApiModel.fromJson(response.data);
        final updatedCommentEntity = commentApiModel.toEntity();

        return Right(updatedCommentEntity);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  // Future<Either<Failure, CommentEntity>> deleteComment({
  //   required String token,
  //   required String commentId,
  // }) async {
  //   try {
  //     var response = await dio.delete(
  //       '${ApiEndpoints.deleteComment}/$commentId',
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );

  //     if (response.statusCode == 204) {
  //       final deletedComment = CommentApiModel.fromJson(response.data);
  //       final deletedCommentEntity = commentApiModel.toEntity();

  //       return Right(deletedCommentEntity);
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.statusMessage.toString(),
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.error.toString(),
  //       ),
  //     );
  //   }
  // }
}
