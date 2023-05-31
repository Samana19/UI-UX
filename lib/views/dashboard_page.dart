import 'package:flutter/material.dart';
import 'package:the_daily_digest/widget/sidebar.dart';
import '../theme/colors.dart';
import '../model/category_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        leading: TextButton(
          onPressed: () {},
          child: Image.asset(
            'assets/icons/paragraph.png',
          ),
        ),
      ),
      drawer: SizedBox(
        width: screenheight * 0.5,
        child: Drawer(
          child: SizedBox(
              height: 100,
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(''),
                  ),
                ],
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Popular',
            //         style: TextStyle(
            //           color: black.withOpacity(0.7),
            //           fontWeight: FontWeight.bold,
            //           fontSize: 18.0,
            //         ),
            //       ),
            //       Image.asset(
            //         'assets/icons/more.png',
            //         color: darkBlueText,
            //         height: 20,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  int selectId = 0;

//   SizedBox sideBarDrawer(BuildContext context, double screenHeight) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.6,
//       child: Drawer(
//         child: SizedBox(
//           height: screenHeight,
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/ima/logo.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Text(''),
//               ),
//               ListTile(
//                 title: const Text('Home'),
//                 onTap: () {
//                   // updateCategory('Home');
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Now Showing'),
//                 onTap: () {
//                   // updateCategory('Now Showing');
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Popular Movies'),
//                 onTap: () {
//                   // updateCategory('Popular Movies');
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Coming Soon'),
//                 onTap: () {
//                   // updateCategory('Coming Soon');
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
}
