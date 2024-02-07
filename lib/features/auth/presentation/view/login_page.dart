import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/core/common/spacing/space.dart';
import 'package:the_daily_digest/core/common/text%20style/text_style.dart';
import 'package:the_daily_digest/core/common/widget/main_button.dart';
import 'package:the_daily_digest/features/auth/presentation/viewmodel/auth_viewmodel.dart';

import 'signup_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  //controller for the text field
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final fkey = GlobalKey<FormState>();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fkey,
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          // padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SpaceVH(height: 80.0),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Hello Again!',
                        style: CustomTextStyles.headlinebold,
                      ),
                    ),
                    SpaceVH(height: 10.0),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Please sign in to your account',
                        style: CustomTextStyles.headline3,
                      ),
                    ),
                  ]),
                ),
                const SpaceVH(height: 50.0),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    children: [
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
                            Text(
                              'Remember Me',
                              style: CustomTextStyles.headline3,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          //navigate to the forgot password page
                          Navigator.pushNamed(context, '/forgotpassword');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: CustomTextStyles.headline3.copyWith(
                            color: grayText, // Change color as needed
                            decoration:
                                TextDecoration.underline, // Add underline
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SpaceVH(height: 50.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Mainbutton(
                        onPressed: () async {
                          if (fkey.currentState!.validate()) {
                            await ref
                                .read(authViewModelProvider.notifier)
                                .loginUser(
                                  context,
                                  _usernameController.text,
                                  _passwordController.text,
                                );

                            // Navigate to the home page after successful login
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                        text: 'Sign in',
                        btnColor: darkBlueButton,
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
                              text: 'Don\'t have an account? ',
                              style: CustomTextStyles.headline.copyWith(
                                fontSize: 14.0,
                              ),
                            ),
                            TextSpan(
                              text: ' Sign Up',
                              style: CustomTextStyles.headline3.copyWith(
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
      ),
    );
  }
}
