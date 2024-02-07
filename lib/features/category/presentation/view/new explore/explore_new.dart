import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom widgets/custom_bottom_navbar.dart';
import 'package:the_daily_digest/features/dashboard/presentation/widgets/downmenu.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(kToolbarHeight), // Remove space from appbar
        child: CustomAppBar(
          title: Text('Explore '),
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        // Adjust margin to remove space from top

        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Popular Topics',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/newsdetails');
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: 375.0,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100.0,
                              width: 375.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      'https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1981174306.jpeg?c=16x9&q=h_720,w_1280,c_fill'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ukraine\'s President Zelensky to BBC: Blood money being paid for Russian oil',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  // Add subtext below the title
                                  Text(
                                    '2h ago',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
