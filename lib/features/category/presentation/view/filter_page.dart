import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom widgets/custom_bottom_navbar.dart';
import 'package:the_daily_digest/features/dashboard/presentation/widgets/downmenu.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: Text('Filter'),
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45.0,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: darkBlueText),
                boxShadow: [
                  BoxShadow(
                    color: darkBlueText.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 45,
                    width: 310,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icons/search.png',
                    height: 25,
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for the first button
                  },
                  child: Text('Button 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for the second button
                  },
                  child: Text('Button 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for the third button
                  },
                  child: Text('Button 3'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for the fourth button
                  },
                  child: Text('Button 4'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for the fifth button
                  },
                  child: Text('Button 5'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
