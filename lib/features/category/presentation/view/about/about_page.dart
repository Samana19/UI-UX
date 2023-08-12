import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/core/common/widget/main_button.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'About Us',
          style: TextStyle(
            color: darkBlueText,
            fontSize: 18,
          ),
        ),

        onBackButtonPressed: () {
          Navigator.pop(context);
        },

        // Set the desired background color for the app bar
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundColor: white,
                backgroundImage: AssetImage(
                    'assets/images/logo.png'), // Replace with your logo image
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome to Our Company',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl id aliquet ultrices, nunc nunc tincidunt nunc, id lacinia nunc nunc id nunc.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Mainbutton(
                onPressed: () {
                  // Add functionality for the button
                },
                btnColor: darkBlueText,
                text: 'Contact Us',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
