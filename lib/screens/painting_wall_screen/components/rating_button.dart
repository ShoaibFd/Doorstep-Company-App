import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/bottom_sheet/review_bottom_sheet.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';

Widget ratingButton(BuildContext context) {
  return CustomContainer(
      height: 26.px,
      width: 60.px,
      borderRadius: 4.px,
      onTap: () {
        showReviewsBottomSheet(context);
      },
      padding: EdgeInsets.symmetric(horizontal: 6.px),
      color: AppColors.greenColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.star, color: AppColors.whiteTheme, size: 16.px),
          appText('4.82', color: AppColors.whiteTheme)
        ],
      ));
}
