import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  final List<NewsArticle> bookmarks = [
    NewsArticle(
      title: 'Article 1',
      description: 'Description of Article 1',
      imageUrl: 'https://example.com/article1.jpg',
    ),
    NewsArticle(
      title: 'Article 2',
      description: 'Description of Article 2',
      imageUrl: 'https://example.com/article2.jpg',
    ),
    NewsArticle(
      title: 'Article 3',
      description: 'Description of Article 3',
      imageUrl: 'https://example.com/article3.jpg',
    ),
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
        backgroundColor: Colors.blue,
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
