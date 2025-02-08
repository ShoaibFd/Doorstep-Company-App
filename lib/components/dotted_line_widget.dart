import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

Widget dottedLine({
  BuildContext? context,
  double? width,
  Color? color,
}) {
  return SizedBox(
    width: width,
    child: DottedLine(dashColor: color ?? AppColors.greyColor),
  );
}
