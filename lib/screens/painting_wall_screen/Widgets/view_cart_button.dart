import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../cart_screen/cart_screen.dart';

Widget viewCartButton(BuildContext context) {
  return CustomContainer(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
      },
      color: AppColors.lowPurple,
      borderRadius: 8.px,
      height: 45.px,
      width: 150.px,
      child: Center(child: appText('View Cart', fontWeight: FontWeight.w400, color: AppColors.whiteTheme)));
}

// custom widget
Widget priceSheet(BuildContext context) {
  return Container(
      height: 70.px,
      width: double.infinity,
      color: AppColors.whiteTheme,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.px),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appText('Rs. 1200', fontWeight: FontWeight.bold),
              SizedBox(width: 10.px),
              appText('Rs. 200',
                  fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough, color: AppColors.hintGrey),
              const Spacer(),
              viewCartButton(context)
            ],
          )));
}

//
Widget congratulationMessage({required String message}) {
  return CustomContainer(
      borderRadius: 0.px,
      color: AppColors.darkGreen,
      child: Padding(
        padding: EdgeInsets.all(4.0.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_offer, color: AppColors.whiteTheme, size: 16.px),
            SizedBox(width: 6.px),
            appText(message, color: AppColors.whiteTheme)
          ],
        ),
      ));
}
