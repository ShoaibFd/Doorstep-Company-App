import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

Widget roundButton({
  VoidCallback? onTap,
  required String title,
  bool isLoading = false, // Default to false
  double height = 55,
  Color? borderColor,
  double width = double.infinity,
  FontWeight? fontWeight,
  Color color = Colors.deepPurpleAccent,
  Color textColor = Colors.white,
}) {
  return GestureDetector(
    onTap: isLoading ? null : onTap,
    child: Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.transparent),
        color: color,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Center(
        child: isLoading
            ? showLoading()
            : appText(
                title,
                fontSize: 16.sp,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: textColor,
              ),
      ),
    ),
  );
}
