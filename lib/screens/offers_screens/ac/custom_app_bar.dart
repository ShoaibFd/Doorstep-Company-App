import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../components/app_text.dart';

PreferredSizeWidget myAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.whiteTheme,
      title: appText('Product Details', fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
