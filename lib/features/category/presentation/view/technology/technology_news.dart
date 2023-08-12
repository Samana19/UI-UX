import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom widgets/custom_bottom_navbar.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Technology Screen'),
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Center(
        child: Text('Technology Screen'),
      ),
      // bottomNavigationBar: const CustomNavbar(),
    );
  }
}
