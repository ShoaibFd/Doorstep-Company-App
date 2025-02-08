import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/custom_text.dart';

class AllReviews extends StatelessWidget {
  final int itemCount; // Add itemCount parameter
  final Widget Function(BuildContext, int) itemBuilder; // Add itemBuilder parameter

  const AllReviews({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.px),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText("All reviews", fontSize: 20.px, fontWeight: FontWeight.bold),
              InkWell(
                onTap: () {
                  // TermsAndConditionBottomSheet(context);
                },
                child: appText(
                  "Filter",
                  fontSize: 20.px,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lowPurple,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.060,
          width: width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
