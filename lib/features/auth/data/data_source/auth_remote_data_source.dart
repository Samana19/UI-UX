import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared-prefs/user_shared_preferences.dart';
import '../../domain/entity/user_entity.dart';

final authRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

//registrating and login data source remotely
class AuthRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  const AuthRemoteDataSource(
      {required this.dio, required this.userSharedPrefs});

  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    try {
      Response response = await dio.post(ApiEndpoints.register, data: {
        'username': user.username,
        'password': user.password,
        'email': user.email,
      });
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, bool>> loginUser(
      String username, String password) async {
    try {
      Response response = await dio.post(ApiEndpoints.login, data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        String token = response.data["token"];
        await userSharedPrefs.setUserToken(token);
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, String>> uploadProfilePicture(
    File image,
  ) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        "profilePicture": await MultipartFile.fromFile(
          image.path,
          filename: fileName,
        ),
      });

      Response response = await dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );
      return Right(response.data["data"]);
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  // Future<Either<Failure, UserEntity>> getUserInfo() async {
  //   String? token;

  //   await userSharedPrefs.getUserToken().then((value) {
  //     value.fold((l) => null, (r) => token = r);
  //   });

  //   try {
  //     Response response = await dio.get(
  //       ApiEndpoints.getUserInfo,
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );
  //     if (response.statusCode == 200) {
  //       if (response.statusCode == 200) {
  //         print(response);
  //         final getUserInfoDTO = GetUserInfoDTO.fromJson(response.data);
  //         print("remote data ${getUserInfoDTO.data}");
  //         UserEntity user = userApiModel.toUserEntity(getUserInfoDTO.data);

  //         // final box =
  //         //     await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
  //         // box.clear();
  //         // final hiveUser = userLocalDataSource.toHiveModel(user);
  //         // box.put(hiveUser.id, hiveUser);
  //         //var res = box.values.toString();

  //         print('user: $user');

  //         return Right(user);
  //       } else {
  //         return Left(
  //           Failure(
  //             error: response.statusMessage.toString(),
  //             statusCode: response.statusCode.toString(),
  //           ),
  //         );
  //       }
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.data["message"],
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.message.toString(),
  //         statusCode: e.response?.statusCode.toString() ?? '0',
  //       ),
  //     );
  //   }
  // }


}
