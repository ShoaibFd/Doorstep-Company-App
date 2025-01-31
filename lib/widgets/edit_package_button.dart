import 'package:doorstep_company_app/constants/colors.dart';
import 'package:doorstep_company_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditPackageButton extends StatelessWidget {
  final VoidCallback onTap;
  const EditPackageButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.px,
        width: 140.px,
        decoration: BoxDecoration(border: Border.all(color: AppColors.grey300), borderRadius: BorderRadius.circular(6)),
        child: Center(child: appText('Edit your package', fontWeight: FontWeight.bold)),
      ),
    );
  }
}
