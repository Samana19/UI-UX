import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';

import '../../../../core/common/color/colors.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          //outline_search

          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'bookmark',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: darkBlueText,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        // Handle navigation based on index
        switch (index) {
          case 0:
            // Navigate to Home
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            // Navigate to Search
            Navigator.pushNamed(context, '/explorernew');
            break;
          case 2:
            // Navigate to Bookmark page
            Navigator.pushNamed(context, '/bookmarknew');
            break;
          case 3:
            // Navigate to Profile
            Navigator.pushNamed(context, '/editprofile');
            break;
        }
      },
    );
  }
}
