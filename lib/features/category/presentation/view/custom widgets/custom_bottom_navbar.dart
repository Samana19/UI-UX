import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_view/dashboard/dashboard_page.dart';

import 'package:the_daily_digest/model/bottom_menu.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  PageController pageController = PageController();
  int selectIndex = 0;

  List<Widget> child = [
    const DashboardPage(), // Replace with your desired content for the first navbar item
    Container(
        color: Colors
            .white), // Replace with your desired content for the second navbar item
    Container(
        color: Colors
            .white), // Replace with your desired content for the third navbar item
    Container(
        color: Colors
            .white), // Replace with your desired content for the fourth navbar item
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bottom Navbar and PageView
        Scaffold(
          body: PageView.builder(
            itemCount: child.length,
            controller: pageController,
            onPageChanged: (value) => setState(() => selectIndex = value),
            itemBuilder: (context, index) {
              return Container(
                child: child[index],
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: darkBlueText,
            unselectedItemColor: grayText.withOpacity(0.5),
            currentIndex: selectIndex,
            onTap: (index) {
              setState(() {
                pageController.jumpToPage(index);
                selectIndex = index;
              });
            },
            items: [
              for (int i = 0; i < bottomMenu.length; i++)
                BottomNavigationBarItem(
                  label: '', // Add a dummy label
                  icon: Image.asset(
                    '${bottomMenu[i].imagePath}',
                  ),
                ),
            ],
          ),
        ),
        // Additional Widgets to Show When Not on Navbar Items
        if (selectIndex != 0) // Add condition to check if not on navbar item
          Positioned(
            top: 0,
            bottom: kBottomNavigationBarHeight,
            left: 0,
            right: 0,
            child: Container(
              // Customize the overlay widget's content
              color:
                  Colors.transparent, // Change the color or add other widgets
            ),
          ),
      ],
    );
  }
}
