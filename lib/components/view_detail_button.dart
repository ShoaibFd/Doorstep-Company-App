import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'app_text.dart';

class ViewDetailButton extends StatelessWidget {
  final VoidCallback onTap;
  const ViewDetailButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: appText('View details', color: AppColors.lowPurple, fontWeight: FontWeight.bold, fontSize: 15));
  }
}
