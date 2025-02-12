import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/app_text.dart';

Widget socialPlateformsWidgets() {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText("Our Social Platforms", fontSize: 20, fontWeight: FontWeight.bold),
        SizedBox(height: 14.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.px,
          children: [
            Icon(Icons.facebook, color: AppColors.blueColor, size: 47.px),
            Image.asset("assets/images/WhatsApp.png", height: 40),
            Image.asset("assets/images/titoks.jpg", height: 55.px),
            Image.asset("assets/images/instagram.png", height: 44.px),
            Image.asset("assets/images/youtube.webp", height: 50)
          ],
        ),
      ],
    ),
  );
}
