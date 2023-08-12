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
          // newsHiveModel: ref.read(newsHiveModelProvider),
        ));

class CommentRemoteDataSource {
  final Dio dio;
  final CommentApiModel commentApiModel;
  // final CommentHiveModel commentHiveModel;

  CommentRemoteDataSource({
    required this.dio,
    required this.commentApiModel,
    // required this.commentHiveModel,
  });

  Future<Either<Failure, List<CommentEntity>>> getAllComments({
    required String token,
  }) async {
    try {
      // print("token is: $token");
      var response = await dio.get(
        ApiEndpoints.getAllComments,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      // print("api res: ${response.data}");

      if (response.statusCode == 200) {
        var list = response.data as List;
        List<CommentApiModel> comment = list
            .map((item) =>
                CommentApiModel.fromJson(item as Map<String, dynamic>))
            .toList();
        final commentEntities = commentApiModel.toEntityList(comment);

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
}
