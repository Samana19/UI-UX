import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_daily_digest/config/constants/api_endpoints.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/core/network/remote/http_service.dart';
import 'package:the_daily_digest/features/dashboard/data/model/news_api_model.dart';
import 'package:the_daily_digest/features/dashboard/data/model/news_hive_model.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';

final newsRemoteDataSourceProvider = Provider((ref) => NewsRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      newsApiModel: ref.read(newsApiModelProvider),
      newsHiveModel: ref.read(newsHiveModelProvider),
    ));

class NewsRemoteDataSource {
  final Dio dio;
  final NewsApiModel newsApiModel;
  final NewsHiveModel newsHiveModel;

  NewsRemoteDataSource({
    required this.dio,
    required this.newsApiModel,
    required this.newsHiveModel,
  });

  Future<Either<Failure, List<NewsEntity>>> getAllNews({
    required String token,
  }) async {
    try {
      // print("token is: $token");
      var response = await dio.get(
        ApiEndpoints.getAllNews,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      // print("api res: ${response.data}");

      if (response.statusCode == 200) {
        var newsList = response.data as List;
        print('list: $newsList');
        List<NewsEntity> newsEntities = newsList
            .map((item) => NewsApiModel.fromJson(item).toEntity())
            .toList();
        print(newsEntities);

        return Right(newsEntities);
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
