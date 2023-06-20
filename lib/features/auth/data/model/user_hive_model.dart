import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:the_daily_digest/config/constants/hive_table_constant.dart';
import 'package:the_daily_digest/features/auth/domain/entity/user_entity.dart';

part 'user_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => UserHiveModel.empty(),
);

//user model for the application
@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String password;

  //empty contructor
  UserHiveModel.empty() : this(email: "", username: "", password: "");

  UserHiveModel({
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  String toString() =>
      'UserEntity(email: $email, username: $username, password:$password)';

  //convert hive object to entity
  UserEntity toEntity() =>
      UserEntity(email: email, username: username, password: password);

  // convert entity into hive object
  UserHiveModel toHiveModel(UserEntity entity) => UserHiveModel(
        email: entity.email,
        username: entity.username,
        password: entity.password,
      );

  // convert hive list to entity list
  List<UserEntity> toEntityList(List<UserHiveModel> hiveList) =>
      hiveList.map((e) => e.toEntity()).toList();
}
