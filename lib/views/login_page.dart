import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/text_style.dart';
import 'package:the_daily_digest/views/dashboard_page.dart';
import 'package:the_daily_digest/widget/bottom_nav.dart';
import '../core/colors.dart';
import '../core/space.dart';
import '../widget/main_button.dart';
import '../widget/text_field.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller for the text field
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        // padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceVH(height: 80.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(children: const [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hello Again!',
                      style: headlinebold,
                    ),
                  ),
                  SpaceVH(height: 10.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Please sign in to your account',
                      style: headline3,
                    ),
                  ),
                ]),
              ),
              const SpaceVH(height: 50.0),
              textField(
                controller: userName,
                hintTxt: 'Username',
              ),
              textField(
                controller: userPass,
                image: 'hide.svg',
                isObs: true,
                hintTxt: 'Password',
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                          activeColor: darkBlueButton,
                        ),

                        const Text(
                          'Remember Me',
                          style: headline3,
                        ),
                        //here
                      ],
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: headline3,
                    ),
                  ),
                ]),
              ),
              const SpaceVH(height: 50.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const BottomNavBar()));
                      },
                      text: 'Sign in',
                      btnColor: darkBlueButton,
                    ),

                    //divider
                    SizedBox(
                      height: 50,
                      width: 320, // Specify the desired height here
                      child: Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'or',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Mainbutton(
                      onPressed: () {},
                      text: 'Sign in with Google',
                      imagePath: 'assets/images/',
                      image: 'google.png',
                      btnColor: whiteBackground,
                      txtColor: darkBlueText,
                    ),

                    const SpaceVH(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const SignUpPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Don\' have an account? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Sign Up',
                            style: headline3.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    ),

                    const SpaceVH(height: 20.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
