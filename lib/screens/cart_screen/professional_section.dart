import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';

Widget professionalSection({
  required BuildContext context,
  required String? selectedProfessional,
  required void Function(String) onProfessionalSelected,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appText("Select Your Professional", fontWeight: FontWeight.bold, fontSize: 18),
      SizedBox(height: 20.px),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          professionalTile(
            context,
            name: "Best available\nprofessional",
            imagePath: "assets/images/ac.jpeg",
            isSelected: selectedProfessional == "Best available\nprofessional",
            onTap: () {
              onProfessionalSelected("Best available\nprofessional");
            },
          ),
          professionalTile(
            context,
            name: "Chandanee",
            imagePath: "assets/images/ac.jpeg",
            rating: 4.84,
            isSelected: selectedProfessional == "Chandanee",
            onTap: () {
              onProfessionalSelected("Chandanee");
            },
          ),
          professionalTile(
            context,
            name: "Sheetal Kum...",
            imagePath: "assets/images/ac.jpeg",
            isAvailable: false,
            isSelected: selectedProfessional == "Sheetal Kum...",
            onTap: () {
              onProfessionalSelected("Sheetal Kum...");
            },
          ),
        ],
      ),
    ],
  );
}

/// Professional Tile Widget
Widget professionalTile(
  BuildContext context, {
  required String name,
  required String imagePath,
  bool isAvailable = true,
  bool isSelected = false,
  double? rating,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: isAvailable ? onTap : null,
    child: Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 80.px,
              height: 80.px,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.lowPurple : AppColors.grey300,
                  width: isSelected ? 3.px : 1.px,
                ),
              ),
              child: !isAvailable
                  ? Container(
                      decoration: const BoxDecoration(
                        color: AppColors.lightBlack,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.close, color: AppColors.whiteTheme),
                      ),
                    )
                  : null,
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.darkGreen,
                size: 24.px,
              ),
          ],
        ),
        SizedBox(height: 8.px),
        appText(
          name,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
          color: isAvailable ? AppColors.blackColor : AppColors.greyColor,
        ),
        if (rating != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 16.px, color: Colors.amber),
              SizedBox(width: 4.px),
              appText("$rating", fontWeight: FontWeight.bold, fontSize: 12.px),
            ],
          ),
      ],
    ),
  );
}
