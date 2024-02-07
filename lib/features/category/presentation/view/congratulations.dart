import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/core/common/spacing/space.dart';
import 'package:the_daily_digest/core/common/text%20style/text_style.dart';
import 'package:the_daily_digest/core/common/widget/main_button.dart';

class CongratulationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 200,
            ),
          ),
          const SpaceVH(height: 20.0), // Vertical space

          // Congratulations text
          Text(
            'Congratulations!',
            style: CustomTextStyles.headlinebold,
          ),
          const SpaceVH(height: 100.0), // Vertical space

          // Main button
          Mainbutton(
            onPressed: () {
              //navigate to login page
              Navigator.of(context).pushNamed('/login');
              // Add your button action here
            },
            text: 'Go to LoginPage',
            btnColor: darkBlueButton,
          ),
        ],
      ),
    );
  }
}
