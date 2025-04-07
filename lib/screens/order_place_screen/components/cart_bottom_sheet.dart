import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/app_text.dart';
import '../../../components/custom_btn.dart';
import '../../../theme/colors.dart';

class CartBottomSheet extends StatelessWidget {
 final void Function()? onTap;
 final String? price;
  const CartBottomSheet({super.key, this.onTap, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 100.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(0, -2),
                ),
              ],
              color: AppColors.whiteTheme,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  spacing: 4.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appText('Total', fontSize: 15.sp, fontWeight: FontWeight.bold),
                    appText('(incl.tax):', fontSize: 13.sp, color: AppColors.greyColor),
                    appText(price??"",
                        fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomBtn(
                  onTap:onTap,
                  title: 'Continue',
                ),
              ],
            ),
          );
  }
}