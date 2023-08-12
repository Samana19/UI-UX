import 'package:equatable/equatable.dart';
import 'package:the_daily_digest/features/comment/domain/entity/comment_entity.dart';

class NewsEntity extends Equatable {
  final String? newsid;
  final String newsPoster;
  final String newsName;
  final String newsDescription;
  final String category;
  final String userid;
  final DateTime createdAt;

  NewsEntity({
    this.newsid,
    required this.newsPoster,
    required this.newsName,
    required this.newsDescription,
    required this.category,
    required this.userid,
    required this.createdAt,
  });

  factory NewsEntity.fromJson(Map<String, dynamic> json) => NewsEntity(
        newsid: json["_id"],
        newsPoster: json["newsPoster"],
        newsName: json["newsName"],
        newsDescription: json["newsDescription"],
        category: json["category"],
        userid: json["userid"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "newsid": newsid,
        "newsPoster": newsPoster,
        "newsName": newsName,
        "newsDescription": newsDescription,
        "category": category,
        "userid": userid,
        "createdAt": createdAt,
      };

  factory NewsEntity.fromMap(Map<String, dynamic> map) {
    return NewsEntity(
      newsid: map['newsid'] as String,
      newsPoster: map['newsPoster'] as String,
      newsName: map['newsName'] as String,
      newsDescription: map['newsDescription'] as String,
      category: map['category'] as String,
      userid: map['userid'] as String,
      createdAt: map['createdAt'] as DateTime,
    );
  }

  @override
  String toString() {
    return 'NewsEntity(newsid: $newsid, newsPoster: $newsPoster, newsName: $newsName, newsDescription: $newsDescription, category: $category, userid: $userid, createdAt: $createdAt)';
  }

  @override
  List<Object?> get props => [
        newsid,
        newsPoster,
        newsName,
        newsDescription,
        category,
        userid,
        createdAt,
      ];
}
