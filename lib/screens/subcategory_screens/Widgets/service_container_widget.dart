import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';

class ServiceContainerWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? image;
  final String? title;
  const ServiceContainerWidget({super.key, this.image, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              height: 75.px,
              width: 75.px,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.px), color: AppColors.lightGrey),
              child: Image.asset(image ?? '')),
        ),
        const SizedBox(height: 6),
        appText(title ?? '', fontSize: 12.px)
      ],
    );
  }
}
