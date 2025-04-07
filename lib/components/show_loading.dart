import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/colors.dart';

Widget showLoading({Color? color}) {
  return LoadingAnimationWidget.flickr(
      leftDotColor: color ?? AppColors.pinkColor, rightDotColor: color ?? AppColors.blueColor, size: 24.px);
}
