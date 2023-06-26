import 'package:flutter/material.dart';
import '../../../../core/common/color/colors.dart';
import '../../../../core/common/spacing/space.dart';
import '../../../../core/common/text style/text_style.dart';
import '../../../../core/common/widget/main_button.dart';
import '../../../../app.dart';
import '../../../auth/presentation/view/login_page.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: height * 0.7,
                color: white,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height / 3,
                width: double.infinity,
                child: ListView(
                  children: [
                    Center(
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: 'Stay informed, Stay ahead',
                            style: CustomTextStyles.headline,
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
                    const SpaceVH(height: 20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
