import 'package:flutter/material.dart';
import '../text style/text_style.dart';

class Mainbutton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final String? imagePath;
  final String? image;
  final Color? txtColor;
  final Color btnColor;

  const Mainbutton({
    Key? key,
    required this.onPressed,
    this.imagePath,
    required this.text,
    this.image,
    this.txtColor,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.asset(
                '$imagePath$image',
                height: 24.0,
                width: 24.0,
              ),
            const SizedBox(width: 8.0),
            Text(
              text,
              style: txtColor != null
                  ? CustomTextStyles.headline1.copyWith(color: txtColor)
                  : CustomTextStyles.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
