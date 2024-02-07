import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/core/common/spacing/space.dart';
import 'package:the_daily_digest/core/common/text%20style/text_style.dart';
import 'package:the_daily_digest/core/common/widget/main_button.dart';
import 'package:the_daily_digest/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:the_daily_digest/features/category/presentation/view/custom%20widgets/custom_appbar.dart';
import 'package:the_daily_digest/features/dashboard/presentation/widgets/downmenu.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());

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
                    'OTP Verification',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 50,
                      child: TextFormField(
                        controller: _otpControllers[index],
                        decoration: InputDecoration(
                          hintText: '',
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          counterText: '', // Remove the counter text
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(
                            fontWeight:
                                FontWeight.bold), // Make the text bolder
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter OTP';
                          }
                          return null;
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SpaceVH(height: 400.0),
            //add main button
            Mainbutton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, perform your action here
                  // Navigating to top
                  Navigator.of(context).pushNamed('/resetpassword');
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
