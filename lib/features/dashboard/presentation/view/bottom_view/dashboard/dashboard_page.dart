import 'dart:async';

import 'package:all_sensors/all_sensors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/config/constants/api_endpoints.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_nav.dart';
import 'package:the_daily_digest/features/dashboard/presentation/widgets/downmenu.dart';
import 'package:the_daily_digest/features/dashboard/presentation/widgets/sidebar.dart';

import 'package:the_daily_digest/features/dashboard/presentation/viewmodel/news_view_model.dart';
import 'package:the_daily_digest/model/category_model.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  @override
  void dispose() {
    for (final subscription in _streamSubscription) {
      subscription.cancel();
    }

    super.dispose();
  }

  // void initState() {
  //   super.initState();
  //   _streamSubscription.add(gyroscopeEvents!.listen((GyroscopeEvent event) {
  //     if (event.x < -3 || event.x > 3) {
  //       SystemNavigator.pop();
  //     }
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    final newsState = ref.watch(newsViewModelProvider);
    final screenheight = MediaQuery.of(context).size.height;
    Widget _buildNewsWidget() {
      if (newsState.isLoading) {
        return const CircularProgressIndicator();
      } else if (newsState.hasError) {
        return Text('Error: ${newsState.error}');
      } else {
        final news = newsState.data;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: news.length,
          itemBuilder: (context, index) {
            final newsItem = news[index];
            return Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "${ApiEndpoints.baseUrl}${newsItem.newsPoster}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  newsItem.newsName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  newsItem.newsDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/newsdetails', arguments: newsItem.newsid);
                },
              ),
            );
          },
        );
      }
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(newsViewModelProvider.notifier);
      },
      child: Scaffold(
        backgroundColor: whiteBackground,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: white,
          automaticallyImplyLeading: false,
          leadingWidth: 60,
          leading: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(
                'assets/icons/paragraph.png',
              ),
            ),
          ),

          //ADD GAP BETWEEN THE ICON AND THE LOGO
          // leadingWidth: 60,
          // ADD LOGO IN THE MIDDLE OF THE APPBAR

          title: Image.asset(
            'assets/images/logo.png',
            height: 200,
            width: 200,
          ),
        ),
        drawer: const SideBarDrawer(),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 45.0,
                    width: 300.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                          width: 250,
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
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/filter');
                    },
                    child: Container(
                      height: 45.0,
                      width: 50.0,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: darkBlueText,
                        boxShadow: [
                          BoxShadow(
                            color: darkBlueText.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/icons/adjust.png',
                        color: Colors.white,
                        height: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //ADD TRENDING TO LEFT AND SEE ALL TO RIGHT
                  //ADD SPACE BEFORE LATEST\

                  const Text(
                    'Trending',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkBlueText,
                      fontSize: 16.0,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/trending');
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: darkBlueText,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //ADD TRENDING NEWS CARDS
            Container(
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
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
                            height: 150.0,
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
                                  'Ukraine\'s President Zelensky to BBC',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                //add subtext below the title
                                Text(
                                  '  2h ago',
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

            SizedBox(
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //ADD TRENDING TO LEFT AND SEE ALL TO RIGHT
                  //ADD SPACE BEFORE LATEST\

                  const Text(
                    'Latest',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkBlueText,
                      fontSize: 16.0,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/trending');
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: darkBlueText,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 35.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < categories.length; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() => selectId = categories[i].id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categories[i].name,
                            style: TextStyle(
                              color: selectId == i
                                  ? darkBlueText
                                  : black.withOpacity(0.7),
                              fontSize: 16.0,
                            ),
                          ),
                          if (selectId == i)
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: darkBlueText,
                            )
                        ],
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              height: 205.0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
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

                                //add subtext below the title
                                Text(
                                  '  2h ago',
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

            GestureDetector(
              onTap: () async {
                var connectivityResult =
                    await (Connectivity().checkConnectivity());
                if (connectivityResult == ConnectivityResult.none) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No internet connection'),
                    ),
                  );
                } else {
                  ref.read(newsViewModelProvider.notifier);
                }
              },
              child: _buildNewsWidget(),
            ),
          ]),
        ),
        //ADD BOTTOM NAVIGATION BAR
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }

  int selectId = 0;
}
