import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';

class DeliveryBottomSheet extends StatefulWidget {
  final double height;
  final double width;
  const DeliveryBottomSheet({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<DeliveryBottomSheet> createState() => _DeliveryBottomSheetState();
}

class _DeliveryBottomSheetState extends State<DeliveryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: const BoxDecoration(color: AppColors.whiteTheme),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            appText("Delivery", fontWeight: FontWeight.bold, fontSize: 21),
            appText("and Address", fontWeight: FontWeight.bold, fontSize: 18.px, color: AppColors.redColor),
            Divider(color: AppColors.lightGrey),
            Row(
              children: [
                Icon(Icons.circle, size: 7.px),
                SizedBox(width: width * 0.015),
                appText("Standard Delivery, Guranteed by 10-12 Nov", fontSize: 12),
                const Spacer(),
                appText("FREE", fontWeight: FontWeight.w600),
                Transform.rotate(
                  angle: 1.57,
                  child: Icon(Icons.arrow_forward_ios, size: 17.px),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            const Divider(),
            SizedBox(height: height * 0.02),
            appText("Delivery Service", color: AppColors.hintGrey),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Icon(Icons.circle, size: 7.px),
                SizedBox(width: width * 0.015),
                appText(
                  "Cash on Delivery Available",
                  fontSize: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
