import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';

class PriceBottomSheet extends StatelessWidget {
  final String price;
  final String? savingText;
  final String discount;
  final VoidCallback? onViewCartTap;
  const PriceBottomSheet({super.key, required this.price, required this.discount, this.onViewCartTap, this.savingText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          color: AppColors.darkGreen,
          child: Row(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_offer, color: AppColors.whiteTheme, size: 14.px),
              appText(savingText ?? '', color: AppColors.whiteTheme)
            ],
          ),
        ),
        Container(
          height: 70.px,
          decoration: BoxDecoration(
            color: AppColors.whiteTheme,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Row(
              children: [
                appText(price, fontSize: 18.px, fontWeight: FontWeight.bold),
                SizedBox(width: 10),
                appText(discount, color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                Spacer(),
                GestureDetector(
                  onTap: onViewCartTap,
                  child: Container(
                    height: 40.px,
                    width: 130.px,
                    decoration: BoxDecoration(color: AppColors.lowPurple, borderRadius: BorderRadius.circular(8)),
                    child: Center(child: appText('View Cart', color: AppColors.whiteTheme)),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
