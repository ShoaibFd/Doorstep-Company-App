import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../theme/colors.dart';
import '../../../../components/app_text.dart';

class CustomRow extends StatelessWidget {
  final String title;
  const CustomRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(8.px),
      child: Row(
        children: [
          Icon(Icons.circle, size: 5.px, color: AppColors.lightBlack),
          SizedBox(width: width * 0.02),
          appText(title, fontSize: 16.px)
        ],
      ),
    );
  }
}


//
// row widget
Widget rowWidget({
  required String text1,
  required String text2,
  String? text3,
  Color? color,
  FontWeight? fontWeight,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      appText(text1, fontSize: 15.sp, fontWeight: fontWeight ?? FontWeight.w400, color: color ?? AppColors.blackColor),
      Column(
        children: [
          appText(text2, fontSize: 15.sp, color: AppColors.darkBlueShade, fontWeight: FontWeight.w400),
          appText(text3 ?? '',
              color: AppColors.hintGrey, fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough),
        ],
      ),
    ],
  );
}