import 'package:doorstep_company_app/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import '../screens/mens salon & massage/components/learn_how_bottom_sheet.dart';

class LearnHowButton extends StatelessWidget {
  const LearnHowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        learnHowBottomSheet(context);
      },
      child: Container(
        height: 50.px,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.grey300.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8.px),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [appText('Learn how', fontSize: 16.px), Icon(Icons.keyboard_arrow_down_rounded)],
          ),
        ),
      ),
    );
  }
}
