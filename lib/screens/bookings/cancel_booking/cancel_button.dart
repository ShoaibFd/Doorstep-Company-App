import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_text.dart';

Widget cancelButton(
  BuildContext context, {
  required void Function()? onTap,
  Color? color,
  Color? borderColor,
  Color? textColor,
}) {
  return CustomContainer(
    onTap: onTap,
    height: 40.px,
    width: 150.px,
    color: color ?? AppColors.whiteTheme,
    borderColor: borderColor ?? AppColors.grey300,
    borderRadius: 8.px,
    child: Center(
      child: appText(
        'Cancel Booking',
        color: textColor ?? AppColors.redColor,
        fontWeight: FontWeight.bold,
        // fontSize: 16,
      ),
    ),
  );
}
