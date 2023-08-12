import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';

class BookmarkPage extends StatelessWidget {
  final List<NewsArticle> bookmarks = [
    NewsArticle(
      title: 'News 1',
      description: 'Category: General',
      imageUrl:
          'https://github.com/Samana19/https---github.com-SoftwaricaCollege-final-assignment-Samana19/blob/internet-connectivity/assets/images/18144590.jpg',
    ),
    // f
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmarks',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: darkBlueText,
      ),
      body: ListView.builder(
        itemCount: bookmarks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  bookmarks[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookmarks[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        bookmarks[index].description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
