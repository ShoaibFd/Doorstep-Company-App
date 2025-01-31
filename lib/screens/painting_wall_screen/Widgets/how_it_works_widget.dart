import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';
import 'painting_view_detail_sheet.dart';

Widget howItWorks({required BuildContext context, String? title}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.px),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(title ?? 'How it works', fontSize: 20.px, fontWeight: FontWeight.bold),
        SizedBox(height: 20.px),
        serialNumberWidget('1', 'Pre-service check'),
        Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10.px),
                height: 300.px,
                width: 6.px,
                decoration: BoxDecoration(color: AppColors.grey300)),
            workDetailWidget('Detailed inspection including gas check to\nidentify repair',
                "assets/images/preservicecheck.jpg", "assets/images/finalclean.jpeg", context)
          ],
        ),
        serialNumberWidget('2', 'Jacket fir mess free services'),
        Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10.px),
                height: 300.px,
                width: 6.px,
                decoration: BoxDecoration(color: Colors.grey.shade300)),
            workDetailWidget('Ac jacket spill prevention during service\nand clean up of the work',
                "assets/images/jetfree.jpeg", "assets/images/finalclean.jpeg", context),
          ],
        ),
        serialNumberWidget('3', 'Indoor unit Foam-jet cleaning'),
        Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10.px),
                height: 300.px,
                width: 6.px,
                decoration: BoxDecoration(color: Colors.grey.shade300)),
            workDetailWidget(
                'Deep cleaning of filters,coils,fins,and\ndrain trays using perfectly safe Foam jet\ntechnology',
                "assets/images/finalclean.jpeg",
                "assets/images/finalclean.jpeg",
                context)
          ],
        ),
        serialNumberWidget('4', 'Outdoor unit power-jet cleaning'),
        Row(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 300.px,
                width: 6.px,
                decoration: BoxDecoration(color: Colors.grey.shade300)),
            workDetailWidget('opening and thorough  cleaning with a\npower jet (if easily accessable)',
                "assets/images/outdoor.jpeg", null, context),
          ],
        ),
        serialNumberWidget('5', 'Final check & cleanup'),
        workDetailWidget(
            'Technician ensures proper functionality by\nchecking for pipe blockages & drain tray\nleaking',
            "assets/images/finalclean.jpeg",
            null,
            context),
        SizedBox(height: 20.px),
      ],
    ),
  );
}

// Serial Number Widget
Widget serialNumberWidget(final String serialText, final String title) {
  return Row(
    children: [
      CircleAvatar(maxRadius: 14.px, backgroundColor: AppColors.grey300, child: appText(serialText)),
      SizedBox(width: 14.px),
      appText(title, fontWeight: FontWeight.w400, fontSize: 18.px)
    ],
  );
}
