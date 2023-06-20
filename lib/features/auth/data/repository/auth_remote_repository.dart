import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

final authRemoteRepository =
    Provider<IAuthRepository>((ref) => AuthRemoteRepoImpl(
          authRemoteDataSource: ref.read(authRemoteDataSourceProvider),
        ));

//making remote repository
class AuthRemoteRepoImpl implements IAuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRemoteRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, bool>> loginUser(String username, String password) {
    return authRemoteDataSource.loginUser(username, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(UserEntity user) {
    return authRemoteDataSource.registerUser(user);
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return authRemoteDataSource.uploadProfilePicture(file);
  }
}
