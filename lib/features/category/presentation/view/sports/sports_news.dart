import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom widgets/custom_bottom_navbar.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Sports Screen'),
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Center(
        child: Text('Sports Screen'),
      ),
      // bottomNavigationBar: const CustomNavbar(),
    );
  }
}
