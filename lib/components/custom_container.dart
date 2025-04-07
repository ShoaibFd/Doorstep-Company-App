import 'package:flutter/material.dart';

import '../components/show_loading.dart'; // Ensure this imports the correct showLoading function
import '../theme/colors.dart';

class CustomContainer extends StatelessWidget {
  final Color color;
  final bool isLoading;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double borderRadius;
  final double elevation;
  final Widget child;
  final DecorationImage? image;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;

  const CustomContainer({
    super.key,
    this.isLoading = false,
    this.color = Colors.grey,
    this.borderRadius = 8.0,
    this.elevation = 0.0,
    this.height,
    this.image,
    this.borderColor,
    this.width,
    required this.child,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!isLoading) container(child),
          if (isLoading)
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(child: showLoading()),
            ),
        ],
      ),
    );
  }

  Widget container(Widget content) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: image,
        border: Border.all(color: borderColor ?? AppColors.transparentColor),
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding,
      child: content,
    );
  }
}
