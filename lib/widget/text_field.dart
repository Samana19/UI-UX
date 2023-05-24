import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_daily_digest/core/colors.dart';
import 'package:the_daily_digest/core/text_style.dart';

Widget textField({
  required String hintTxt,
  String? image,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
}) {
  return Container(
    height: 60.0,
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    margin: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    decoration: BoxDecoration(
      color: white,
      border: Border.all(
        color: black,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 270.0,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: hintStyle,
            ),
            style: CustomTextStyles.headline1,
          ),
        ),
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.grey, // Replace 'Colors.red' with the desired color
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset(
            'assets/icons/$image',
            height: 20.0,
          ),
        )
      ],
    ),
  );
}
