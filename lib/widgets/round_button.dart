import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'custom_text.dart';

Widget roundButton({
  VoidCallback? onTap,
  required String title,
  double? height = 55,
  Color? borderColor,
  double? width = double.infinity,
  FontWeight? fontWeight,
  Color color = Colors.deepPurpleAccent,
  Color textColor = Colors.white,
}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? Colors.transparent),
              color: color,
              borderRadius: BorderRadius.circular(6.px)),
          child: Center(
              child: appText(title, fontSize: 16.px, fontWeight: fontWeight ?? FontWeight.w400, color: textColor))));
}
