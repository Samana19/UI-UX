import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/config/constants/api_endpoints.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/dashboard/presentation/widgets/sidebar.dart';
import 'package:the_daily_digest/features/dashboard/presentation/viewmodel/news_view_model.dart';
import 'package:the_daily_digest/model/category_model.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
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
                      image: NetworkImage(
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
                  // Handle the news item tap
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
          elevation: 0,
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
        ),

        drawer: const SideBarDrawer(),

        // drawer: SizedBox(
        //   width: screenheight * 0.5,
        //   child: Drawer(
        //     child: SizedBox(
        //         height: 100,
        //         child: ListView(
        //           padding: EdgeInsets.zero,
        //           children: const [
        //             DrawerHeader(
        //               decoration: BoxDecoration(
        //                 image: DecorationImage(
        //                   image: AssetImage('assets/images/logo.png'),
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //               child: Text(''),
        //             ),
        //           ],
        //         )),
        //   ),
        // ),
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
                        const SizedBox(
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
                  const SizedBox(width: 20),
                  Container(
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
                      color: white,
                      height: 25,
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
            // Text("data:     ${newsState.news.map((e) => {Text(e.newsName)})}"),
          ]),
        ),
      ),
    );
  }

  int selectId = 0;
}
