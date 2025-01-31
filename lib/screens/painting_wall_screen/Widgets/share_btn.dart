import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';

Widget shareBtn(BuildContext context, void Function()? onTap) {
  return Center(
      child: CustomContainer(
          onTap: onTap,
          height: 50.px,
          width: double.infinity,
          color: AppColors.transparentColor,
          borderColor: AppColors.grey300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appText('Share', fontSize: 18.px, color: AppColors.lowPurple),
              SizedBox(width: 12.px),
              Icon(Icons.share, size: 20.px, color: AppColors.lowPurple)
            ],
          )));
}
