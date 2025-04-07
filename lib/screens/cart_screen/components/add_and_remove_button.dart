import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/app_text.dart';
import '../../../theme/colors.dart';

class AddAndRemoveButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  const AddAndRemoveButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32.px,
        width: 76.px,
        decoration: BoxDecoration(
          color: AppColors.whiteTheme,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(6.px),
        ),
        child: Center(
          child: appText(
            title,
            fontWeight: FontWeight.bold,
            color: AppColors.lowPurple,
          ),
        ),
      ),
    );
  }
}
