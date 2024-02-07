import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/core/common/spacing/space.dart';
import 'package:the_daily_digest/core/common/text%20style/text_style.dart';
import 'package:the_daily_digest/core/common/widget/main_button.dart';
import 'package:the_daily_digest/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/dashboard/presentation/widgets/downmenu.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        //title in the middle
        title: const Text(''),
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reset Password',
                    style: CustomTextStyles.headlinebold,
                  ),
                  SpaceVH(height: 10.0),
                ],
              ),
            ),
            const SpaceVH(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _newPasswordController,
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureNewPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureNewPassword = !_obscureNewPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: _obscureNewPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter new password';
                        }
                        return null;
                      },
                    ),
                    SpaceVH(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: _obscureConfirmPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter confirm password';
                        } else if (value != _newPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SpaceVH(height: 300.0),
            //add main button
            Mainbutton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, perform your action here
                  // Navigating to top
                  //navigate to otp page
                  Navigator.of(context).pushNamed('/congrats');
                }
              },
              text: 'Submit',
              btnColor: darkBlueButton,
            ),
          ],
        ),
      ),
    );
  }
}
