import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Constants/colors.dart';

Widget appText(
  String text, {
  int? maxLines,
  TextDecoration? decoration,
  TextOverflow textOverflow = TextOverflow.clip,
  Color color = AppColors.blackColor,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(text,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        decoration: decoration,
        color: color,
        height: 1.2.px,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ));
}
