import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/text_style.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceVH(height: 50.0),
              const Padding(
                padding: EdgeInsets.only(right: 150.0),
                child: Text(
                  'Hello Again!',
                  style: headlinebold,
                ),
              ),
              const SpaceVH(height: 10.0),
              const Padding(
                padding: EdgeInsets.only(right: 150.0),
                child: Text(
                  'Please sign in to your account',
                  style: headline3,
                ),
              ),
              const SpaceVH(height: 60.0),
              textField(
                controller: userName,
                image: 'user.svg',
                hintTxt: 'Username',
              ),
              textField(
                controller: userPass,
                image: 'hide.svg',
                isObs: true,
                hintTxt: 'Password',
              ),
              const SpaceVH(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: headline3,
                    ),
                  ),
                ),
              ),
              const SpaceVH(height: 100.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onTap: () {},
                      text: 'Sign in',
                      btnColor: darkBlueButton,
                    ),
                    const SpaceVH(height: 20.0),
                    Mainbutton(
                      onTap: () {},
                      text: 'Sign in with google',
                      image: 'assets/images/google.png',
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
                            style: headline1.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    )
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
