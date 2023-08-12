import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/config/constants/api_endpoints.dart';
import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_nav.dart';
import 'package:the_daily_digest/features/dashboard/presentation/viewmodel/news_view_model.dart';

class NewsDetails extends ConsumerStatefulWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends ConsumerState<NewsDetails> {
  late String newsid;
  TextEditingController _commentController = TextEditingController();
  List<String> comments = [];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)!.settings.arguments != null) {
      newsid = ModalRoute.of(context)!.settings.arguments as String;
    }
  }

  @override
  Widget build(BuildContext context) {
    final newsState = ref.watch(newsViewModelProvider);
    final newsIndex =
        newsState.data.indexWhere((element) => element.newsid == newsid);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
        backgroundColor: darkBlueText,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CachedNetworkImage(
                imageUrl:
                    '${ApiEndpoints.baseUrl}${newsState.news[newsIndex].newsPoster}',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 200.0,
                width: 200.0,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                newsState.news[newsIndex].newsDescription,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Category: ${newsState.news[newsIndex].category}',
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
            Text(
              'Created At: ${newsState.news[newsIndex].createdAt}',
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
            SizedBox(height: 8.0),
            Text(
              'By: ${newsState.news[newsIndex].userid}',
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
            SizedBox(height: 24.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comments',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      String comment = _commentController.text;
                    
                      if (comment.isNotEmpty) {
                        setState(() {
                          comments.add(comment);
                          _commentController.clear();
                        });
                      }
                    },
                    child: Text('Post Comment'),
                  ),
                  SizedBox(height: 16.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text(comments[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Handle editing the comment here
                              // You can show a dialog or navigate to a new screen
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
