import 'package:flutter/material.dart';
import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_view/bookmark/bookmark_page.dart';
import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_view/profile/user_profile.dart';
import '../../../../core/common/color/colors.dart';
import '../../../../model/bottom_menu.dart';
import 'bottom_view/dashboard/dashboard_page.dart';
import 'bottom_view/bookmark/bookmark_page.dart';
import 'bottom_view/profile/user_profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController();
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: child.length,
        controller: pageController,
        onPageChanged: (value) => setState(() => selectIndex = value),
        itemBuilder: (itemBuilder, index) {
          return Container(
            child: child[index],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; bottomMenu.length > i; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(i);
                      selectIndex = i;
                    });
                  },
                  child: Image.asset(
                    bottomMenu[i].imagePath,
                    color: selectIndex == i
                        ? darkBlueText
                        : grayText.withOpacity(0.5),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> child = [const DashboardPage(), BookmarkPage(), UserProfile()];
