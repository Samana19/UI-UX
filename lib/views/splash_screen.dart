import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/space.dart';
import '../core/text_style.dart';
import '../widget/main_button.dart';
import '../app.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Container(
            height: height * 0.8,
            color: white,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height / 3,
              width: double.infinity,
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: gradient,
              //     begin: Alignment.bottomCenter,
              //     end: Alignment.topCenter,
              //   ),
              // ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 20),
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Stay informed, Stay ahead',
                          style: headline,
                        ),
                      ]),
                    ),
                  ),
                  const SpaceVH(height: 20.0),
                  Mainbutton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const LoginPage()));
                    },
                    btnColor: darkBlueButton,
                    text: 'Register Today',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
