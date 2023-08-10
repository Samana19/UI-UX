import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';

part 'comment_api_model.g.dart';

final commentApiModelProvider = Provider<CommentApiModel>(
  (ref) => CommentApiModel.empty(),
);

@JsonSerializable()
class CommentApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? commentid;
  final String content;
  final String userid;
  final DateTime createdAt;

  CommentApiModel({
    this.commentid,
    required this.content,
    required this.userid,
    required this.createdAt,
  });

  CommentApiModel.empty()
      : commentid = '',
        content = '',
        userid = '',
        createdAt = DateTime.now();

  factory CommentApiModel.fromJson(Map<String, dynamic> json) =>
      _$CommentApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentApiModelToJson(this);

  // Convert API Object to Entity
  CommentEntity toEntity() {
    return CommentEntity(
      commentid: commentid ?? '',
      content: content,
      createdAt: createdAt,
      newsid: '',
      userid: userid,
    );
  }

  // Convert Entity to API Object
  CommentApiModel fromEntity(CommentEntity entity) => CommentApiModel(
        commentid: entity.commentid ?? "",
        content: entity.content,
        createdAt: entity.createdAt,
        userid: entity.userid,
      );

  // Convert API List to Entity List
  List<CommentEntity> toEntityList(List<CommentApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [commentid, content, userid, createdAt];
}
