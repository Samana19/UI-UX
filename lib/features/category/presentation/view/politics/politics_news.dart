import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom widgets/custom_bottom_navbar.dart';

class PoliticsScreen extends StatelessWidget {
  const PoliticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Politics Screen'),
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Center(
        child: Text('Politics Screen'),
      ),
      // bottomNavigationBar: const CustomNavbar(),
    );
  }
}
