import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors.dart';

Widget showLoading({Color? color}) {
  return SpinKitThreeBounce(
    color: color ?? AppColors.lowPurple,
    size: 40.0,
  );
}
