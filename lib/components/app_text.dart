import 'package:flutter/material.dart';

import '../theme/colors.dart';

Widget appText(
  String text, {
  int? maxLines,
  double? height,
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
        height: height ?? 1.2,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ));
}
