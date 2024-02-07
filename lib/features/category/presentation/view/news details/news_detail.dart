import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  Color favoriteIconColor = Colors.grey;
  Color bookmarkIconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        // Add back button functionality
        leading: IconButton(
          alignment: Alignment.centerRight,
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://yt3.googleusercontent.com/y_esGAQOhX4rTpWvrALErAJlFbm_2TIVrvcVfcZny7TuA8dJZgOQcC6KRfd_J5hljFe-foYXj9U=s900-c-k-c0x00ffffff-no-rj'),
                  radius: 20, // Adjust as needed
                ),
                const SizedBox(width: 10),
                Text(
                  'BBC News',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

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
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1981174306.jpeg?c=16x9&q=h_720,w_1280,c_fill'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ukraine\'s President Zelensky to BBC: Blood money being paid for Russian oil',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of "earning their money in other people\'s blood". In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomAppBar(
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    // Toggle the icon color on tap
                    setState(() {
                      favoriteIconColor = favoriteIconColor == Colors.grey
                          ? Colors.red
                          : Colors.grey;
                    });
                  },
                  icon: Icon(Icons.favorite, color: favoriteIconColor),
                ),
                IconButton(
                  onPressed: () {
                    // Toggle the icon color on tap
                    setState(() {
                      bookmarkIconColor = bookmarkIconColor == Colors.grey
                          ? darkBlueButton
                          : Colors.grey;
                    });
                  },
                  icon: Icon(Icons.bookmark, color: bookmarkIconColor),
                  color: Colors.grey, // Change color as needed
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
