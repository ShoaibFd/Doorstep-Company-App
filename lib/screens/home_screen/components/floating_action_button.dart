import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';

class HomeFloatingButtons extends StatelessWidget {
  const HomeFloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40.px),
      height: 100.px,
      width: 45.px,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 45.px,
              width: 45.px,
              decoration: const BoxDecoration(
                color: AppColors.greenColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.call, color: AppColors.whiteTheme),
            ),
            SizedBox(height: 10.px),
            Container(
              height: 45.px,
              width: 45.px,
              decoration: const BoxDecoration(
                color: AppColors.greenColor,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/WhatsApp.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
