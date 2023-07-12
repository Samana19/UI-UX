
import 'package:json_annotation/json_annotation.dart';
import 'package:the_daily_digest/features/dashboard/data/model/news_api_model.dart';

part 'get_all_news_dto.g.dart';

@JsonSerializable()
class GetAllNewsDTO {
  final bool success;
  final int count;
  final List<NewsApiModel> data;

  GetAllNewsDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllNewsDTOToJson(this);

  factory GetAllNewsDTO.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<NewsApiModel> newsList =
        list.map((i) => NewsApiModel.fromJson(i)).toList();

    return GetAllNewsDTO(
      success: json['success'],
      count: json['count'],
      data: newsList,
    );
  }
}
