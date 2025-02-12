import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/app_text.dart';

Widget packageRow({required String heading, required String desc}) {
  return Row(
    spacing: 5,
    children: [
      const Icon(Icons.circle, size: 4),
      appText(heading, fontSize: 15.px, fontWeight: FontWeight.bold),
      appText(desc)
    ],
  );
}
