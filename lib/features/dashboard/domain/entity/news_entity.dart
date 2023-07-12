import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String? newsId;
  final String newsPoster;
  final String newsName;
  final String newsDescription;

  const NewsEntity({
    this.newsId,
    required this.newsPoster,
    required this.newsName,
    required this.newsDescription,
  });

  factory NewsEntity.fromJson(Map<String, dynamic> json) => NewsEntity(
        newsId: json["_id"],
        newsPoster: json["newsPoster"],
        newsName: json["newsName"],
        newsDescription: json["newsDescription"],
      );

  Map<String, dynamic> toJson() => {
        "newsId": newsId,
        "newsPoster": newsPoster,
        "newsName": newsName,
        "newsDescription": newsDescription,
      };

  factory NewsEntity.fromMap(Map<String, dynamic> map) {
    return NewsEntity(
      newsId: map['newsId'] as String,
      newsPoster: map['newsPoster'] as String,
      newsName: map['newsName'] as String,
      newsDescription: map['newsDescription'] as String,
    );
  }

  @override
  String toString() {
    return 'NewsEntity(newsId: $newsId, newsPoster: $newsPoster, newsName: $newsName, newsDescription: $newsDescription)';
  }

  @override
  List<Object?> get props => [
        newsId,
        newsPoster,
        newsName,
        newsDescription,
      ];
}
