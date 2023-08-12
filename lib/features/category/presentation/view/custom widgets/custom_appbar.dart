import 'package:flutter/material.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    required Widget title,
    VoidCallback? onBackButtonPressed,
  }) : super(
          key: key,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leadingWidth: 60,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: darkBlueButton,
            onPressed: onBackButtonPressed,
          ),
          title: title,
        );
}
