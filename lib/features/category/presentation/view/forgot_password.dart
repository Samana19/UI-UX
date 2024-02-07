import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/core/common/spacing/space.dart';
import 'package:the_daily_digest/core/common/text%20style/text_style.dart';
import 'package:the_daily_digest/core/common/widget/main_button.dart';
import 'package:the_daily_digest/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/dashboard/presentation/widgets/downmenu.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

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
                    'Forgot Password?',
                    style: CustomTextStyles.headlinebold,
                  ),
                  SpaceVH(height: 10.0),
                  Text(
                    'Don’t worry! it happens. Please enter the address associated with your account.',
                    style: CustomTextStyles.headline3,
                  ),
                ],
              ),
            ),
            const SpaceVH(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill out this field';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SpaceVH(height: 380.0),
            //add main button
            Mainbutton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, perform your action here
                  // Navigating to top
                  //navigate to otp page
                  Navigator.of(context).pushNamed('/otp');
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
