import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_text.dart';

class OffersContainers extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const OffersContainers({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(border: Border.all(color: AppColors.lightGrey), borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.local_offer, color: AppColors.darkGreen, size: 18),
                const SizedBox(width: 6),
                appText(title ?? '', fontWeight: FontWeight.bold)
              ],
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: appText(subtitle ?? '', color: AppColors.greyColor),
            )
          ],
        ),
      ),
    );
  }
}
