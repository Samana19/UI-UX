// import 'package:json_annotation/json_annotation.dart';

// part 'comment_dto.g.dart';

// @JsonSerializable()
// class CommentDto {
//   final String commentid;
//   final String content;
//   final String userid;
//   final DateTime createdAt;

//   CommentDto({
//     required this.commentid,
//     required this.content,
//     required this.userid,
//     required this.createdAt,
//   });

//   factory CommentDto.fromJson(Map<String, dynamic> json) =>
//       _$CommentDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$CommentDtoToJson(this);
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:the_daily_digest/features/comment/data/model/comment_api_model.dart';

part 'comment_dto.g.dart';

//dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class GetAllCommentDTO {
  final bool success;
  final int count;
  final List<CommentApiModel> data;

  GetAllCommentDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllCommentDTOToJson(this);

  factory GetAllCommentDTO.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<CommentApiModel> commentList =
        list.map((i) => CommentApiModel.fromJson(i)).toList();

    return GetAllCommentDTO(
      success: json['success'],
      count: json['count'],
      data: commentList,
    );
  }
}
