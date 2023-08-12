import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/features/splash/presentation/viewmodel/splash_viewmodel.dart';
import '../../../../core/common/color/colors.dart';
import '../../../../core/common/spacing/space.dart';
import '../../../../core/common/text style/text_style.dart';
import '../../../../core/common/widget/main_button.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    // Wait for 2 seconds and then navigate
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(splashViewModelProvider.notifier).init(context);
    });

    super.initState();
  }

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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => const LoginPage()));
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
