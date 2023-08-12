import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/core/common/spacing/space.dart';
import 'package:the_daily_digest/core/common/text%20style/text_style.dart';
import 'package:the_daily_digest/core/common/widget/main_button.dart';
import 'package:the_daily_digest/features/auth/presentation/viewmodel/auth_viewmodel.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String dummyUsername = 'test'; // Dummy username
    const String dummyEmail = 'test@example.com'; // Dummy email

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceVH(height: 80.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Profile',
                    style: CustomTextStyles.headlinebold,
                  ),
                  SpaceVH(height: 10.0),
                  Text(
                    'Update your profile',
                    style: CustomTextStyles.headline3,
                  ),
                ],
              ),
            ),
            const SpaceVH(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SpaceVH(height: 5.0),
                  Text(
                    dummyUsername,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SpaceVH(height: 20.0),
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SpaceVH(height: 5.0),
                  Text(
                    dummyEmail,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SpaceVH(height: 50.0),
                  Mainbutton(
                    onPressed: () async {},
                    text: 'Update',
                    btnColor: darkBlueButton,
                  ),
                ],
              ),
            ),
            const SpaceVH(height: 20.0),
          ],
        ),
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
