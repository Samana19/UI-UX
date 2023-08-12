import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_entity.g.dart';

@JsonSerializable()
class CommentEntity extends Equatable {
  final String commentid;
  final String content;
  final DateTime createdAt;
  final String newsid;
  final String userid;

  CommentEntity({
    required this.commentid,
    required this.content,
    required this.createdAt,
    required this.newsid,
    required this.userid,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommentEntityToJson(this);

  @override
  List<Object?> get props => [commentid, content, createdAt, newsid, userid];
}
