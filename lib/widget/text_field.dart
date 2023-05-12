import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_daily_digest/core/colors.dart';
import 'package:the_daily_digest/core/text_style.dart';

Widget textField({
  required String hintTxt,
  required String image,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
}) {
  return Container(
    height: 70.0,
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    margin: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    decoration: BoxDecoration(
      color: blackTextFild,
      borderRadius: BorderRadius.circular(20.0),
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
            style: headline1,
          ),
        ),
        SvgPicture.asset(
          'assets/icon/$image',
          height: 20.0,
          // ignore: deprecated_member_use
          color: grayText,
        )
      ],
    ),
  );
}
