import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/app_text.dart';
import '../../../constants/colors.dart';
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

class ProcessStep {
  final String title;
  final String subtitle;
  final List<String> images;

  ProcessStep({
    required this.title,
    required this.subtitle,
    this.images = const [],
  });
}

class ProcessTimeline extends StatelessWidget {
  final List<ProcessStep> steps;
  final String title;
  final bool showTitle;

  const ProcessTimeline({
    super.key,
    required this.steps,
    this.title = 'How it works',
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showTitle) ...[
              appText(title, fontSize: 24.px, fontWeight: FontWeight.bold),
              const SizedBox(height: 24),
            ],
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return TimelineStep(
                  step: steps[index],
                  number: index + 1,
                  isLast: index == steps.length - 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TimelineStep extends StatelessWidget {
  final ProcessStep step;
  final int number;
  final bool isLast;

  const TimelineStep({
    super.key,
    required this.step,
    required this.number,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.px,
            child: Column(
              children: [
                Container(
                  width: 30.px,
                  height: 30.px,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: appText(
                      number.toString(),
                      color: AppColors.hintGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.grey[300],
                      margin: const EdgeInsets.symmetric(vertical: 2),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 10.px),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(step.title, fontSize: 17.sp, fontWeight: FontWeight.bold),
                SizedBox(height: 8.px),
                appText(step.subtitle, color: AppColors.hintGrey, fontSize: 16.px),
                if (step.images.isNotEmpty) ...[
                  SizedBox(height: 16.px),
                  SizedBox(
                    height: 170.px,
                    child: Row(
                      children: step.images
                          .map(
                            (image) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 6.px),
                                child: SizedBox(
                                  height: 200.px,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.px),
                                    child: Image.network(
                                      image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
                SizedBox(height: 24.px),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
