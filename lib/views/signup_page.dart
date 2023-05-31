import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/space.dart';
import '../theme/text_style.dart';
import '../widget/main_button.dart';
import '../widget/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPh = TextEditingController();
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
                padding: EdgeInsets.only(right: 100.0),
                child: Text(
                  'Come Join Us!',
                  style: CustomTextStyles.headlinebold,
                ),
              ),
              const SpaceVH(height: 10.0),
              const Padding(
                padding: EdgeInsets.only(right: 70.0),
                child: Text(
                  'Join us to stay updated with the latest news',
                  style: CustomTextStyles.headline3,
                ),
              ),
              const SpaceVH(height: 40.0),
              textField(
                controller: userName,
                image: 'user.svg',
                keyBordType: TextInputType.name,
                hintTxt: 'Full Name',
              ),
              textField(
                controller: userEmail,
                keyBordType: TextInputType.emailAddress,
                image: 'user.svg',
                hintTxt: 'Email Address',
              ),
              textField(
                controller: userPass,
                isObs: true,
                image: 'hide.svg',
                hintTxt: 'Password',
              ),
              const SpaceVH(height: 50.0),
              Mainbutton(
                onPressed: () {},
                text: 'Sign Up',
                btnColor: darkBlueButton,
              ),
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
                  Navigator.pop(context);
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: CustomTextStyles.headline.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Sign In',
                      style: CustomTextStyles.headline3.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
