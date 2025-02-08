import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_text.dart';

Widget addressWidget({
  required String fieldName,
  required String hint,
  required TextInputType keyboardType,
  TextEditingController? controller,
  required IconData icon,
  Widget? suffixIcon,
  IconData? verifyIcon,
}) {
  return Column(
    children: [
      Row(
        children: [
          CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.grey300.withOpacity(0.4),
              child: Icon(icon, color: AppColors.hintGrey, size: 16)),
          const SizedBox(width: 10),
          appText(fieldName, fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.blueColor),
          const SizedBox(width: 10),
          Icon(verifyIcon, color: AppColors.blueColor, size: 14)
        ],
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(color: AppColors.hintGrey),
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      )
    ],
  );
}
