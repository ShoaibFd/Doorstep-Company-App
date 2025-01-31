import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';

class CustomRow extends StatelessWidget {
  final String title;
  const CustomRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(8.px),
      child: Row(
        children: [
          Icon(Icons.circle, size: 5.px, color: AppColors.lightBlack),
          SizedBox(width: width * 0.02),
          appText(title, fontSize: 16.px)
        ],
      ),
    );
  }
}
