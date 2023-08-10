import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom widgets/custom_bottom_navbar.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Health Screen'),
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Center(
        child: Text('Health Screen'),
      ),
      // bottomNavigationBar: const CustomNavbar(),
    );
  }
}
