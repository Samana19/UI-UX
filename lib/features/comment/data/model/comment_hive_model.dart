// import 'package:hive/hive.dart';
// import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';
// import 'package:the_daily_digest/features/comments/domain/entity/comment_entity.dart';

// part 'comment_hive_model.g.dart';

// @HiveType(typeId: 1)
// class CommentHiveModel extends HiveObject {
//   @HiveField(0)
//   late String? commentid;

//   @HiveField(1)
//   late String content;

//   @HiveField(2)
//   late String userId;

//   @HiveField(3)
//   late DateTime createdAt;

//   CommentHiveModel({
//     this.commentid,
//     required this.content,
//     required this.userId,
//     required this.createdAt,
//   });

//   CommentEntity toEntity() {
//     return CommentEntity(
//       commentid: commentid ?? '',
//       content: content,
//       createdAt: createdAt,
//       newsId: '',
//       userid: userid,
//     );
//   }

//   static List<CommentEntity> toEntityList(List<CommentHiveModel> models) {
//     return models.map((model) => model.toEntity()).toList();
//   }

//   static CommentHiveModel fromEntity(CommentEntity entity) {
//     return CommentHiveModel(
//       commentid: entity.commentid,
//       content: entity.content,
//       createdAt: entity.createdAt,
//       userid: entity.userid,
//     );
//   }
// }
