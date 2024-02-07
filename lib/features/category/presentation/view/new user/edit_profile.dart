import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/core/common/widget/main_button.dart';
import 'package:the_daily_digest/features/dashboard/presentation/widgets/downmenu.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    usernameController.text = "user";
    emailController.text = "user@gmail.com";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "Username"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email Address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Mainbutton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the profile here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile saved successfully')),
                    );
                  }
                },
                text: ' Save',
                btnColor: darkBlueButton,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
