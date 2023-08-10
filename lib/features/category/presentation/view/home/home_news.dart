import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Home Screen'),
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
      // bottomNavigationBar: const CustomNavbar(),
    );
  }
}
