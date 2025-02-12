import 'package:flutter/material.dart';

import '../../../components/app_text.dart';
import '../../../components/dotted_line_widget.dart';
import '../../../constants/colors.dart';

class ProductDescriptionDetailWidget extends StatelessWidget {
  const ProductDescriptionDetailWidget(
      {super.key,
      this.discountPrice,
      this.duration,
      this.offText,
      this.offer,
      this.price,
      this.rating,
      this.review,
      this.serviceName});
  final String? offer;
  final String? serviceName;
  final String? rating;
  final String? review;
  final String? price;
  final String? discountPrice;
  final String? duration;
  final String? offText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(
          '$offer',
          color: AppColors.darkGreen,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        const SizedBox(height: 6),
        appText('$serviceName', fontWeight: FontWeight.bold, fontSize: 16),
        const SizedBox(height: 6),
        Column(
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.grey, size: 16),
                const SizedBox(width: 6),
                appText('$rating', color: Colors.grey),
                const SizedBox(width: 6),
                appText('$review', color: Colors.grey),
              ],
            ),
            dottedLine(width: 140)
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            appText('$price', fontWeight: FontWeight.bold),
            const SizedBox(width: 6),
            appText('$discountPrice', color: Colors.grey, decoration: TextDecoration.lineThrough),
            const SizedBox(width: 6),
            const Icon(Icons.circle, size: 6, color: Colors.grey),
            const SizedBox(width: 6),
            appText('$duration', color: Colors.grey)
          ],
        ),
        const SizedBox(height: 10),
        Row(
          spacing: 5,
          children: [
            Icon(Icons.local_offer, color: AppColors.darkGreen, size: 14),
            appText('$offText', color: AppColors.darkGreen, fontWeight: FontWeight.bold)
          ],
        ),
      ],
    );
  }
}
