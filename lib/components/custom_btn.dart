import 'package:doorstep_company_app/components/app_text.dart';
import 'package:doorstep_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onTap;

  const CustomBtn({
    super.key,
    required this.title,
    this.isLoading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 50.h,
        width: 0.9.sw,
        decoration: BoxDecoration(
          color: isLoading ? AppColors.greyColor : AppColors.blueColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const CircularProgressIndicator(
                    color: AppColors.whiteTheme,
                    strokeWidth: 2,
                  ),
                )
              : appText(title, color: AppColors.whiteTheme, fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
