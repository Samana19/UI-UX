import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';

class Category {
  final int id;
  final String name;

  Category(this.id, this.name);
}

List<Category> categories = [
  Category(0, 'General'),
  Category(1, 'Health'),
  Category(2, 'Politics'),
  Category(3, 'Sports'),
  Category(4, 'Technology'),
];

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var category in categories)
          GestureDetector(
            onTap: () {
              // Navigate to the corresponding category page
              switch (category.id) {
                case 0:
                  Navigator.pushNamed(context, '/general');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/healthscreen');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/politicsscreen');
                  break;
                case 3:
                  Navigator.pushNamed(context, '/sportsscreen');
                  break;
                case 4:
                  Navigator.pushNamed(context, '/technologyscreen');
                  break;
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                category.name,
                style: TextStyle(
                  color: darkBlueText,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
