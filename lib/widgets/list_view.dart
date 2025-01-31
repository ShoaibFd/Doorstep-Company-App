import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import 'custom_text.dart';

class DescriptionWidget extends StatefulWidget {
  final String discount;
  final String serviceName;
  final String rating;
  final String review;
  final String itemPrice;
  final String itemDiscount;
  final String duration;
  final String offText;
  const DescriptionWidget({
    super.key,
    required this.discount,
    required this.serviceName,
    required this.rating,
    required this.review,
    required this.itemPrice,
    required this.itemDiscount,
    required this.duration,
    required this.offText,
  });

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(widget.discount, color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                const SizedBox(height: 6),
                appText(widget.serviceName, fontSize: 18.px, fontWeight: FontWeight.bold),
                SizedBox(height: 6.px),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                        SizedBox(width: 4.px),
                        appText(widget.rating, color: AppColors.hintGrey),
                        SizedBox(width: 4.px),
                        appText(widget.review, color: AppColors.hintGrey),
                      ],
                    ),
                    SizedBox(width: width * 0.3, child: const DottedLine(dashColor: AppColors.greyColor)),
                  ],
                ),
                SizedBox(height: 22.px),
                Row(
                  spacing: 10.px,
                  children: [
                    appText(widget.itemPrice, fontWeight: FontWeight.bold),
                    appText(widget.itemDiscount, color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                    Icon(Icons.circle, size: 4.px, color: AppColors.hintGrey),
                    appText(widget.duration, color: AppColors.hintGrey),
                  ],
                ),
                SizedBox(height: 6.px),
                Row(
                  children: [
                    Icon(Icons.local_offer, color: AppColors.darkGreen, size: 16.px),
                    const SizedBox(width: 4),
                    appText(widget.offText, color: AppColors.darkGreen),
                  ],
                ),
                const Divider(),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
