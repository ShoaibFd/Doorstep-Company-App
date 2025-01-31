import 'dart:ui';

import 'package:flutter/material.dart';

class DottedBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color color;
  final double strokeWidth;
  final double dashWidth;

  const DottedBorderContainer({
    super.key,
    required this.child,
    this.borderRadius = 10.0,
    this.color = Colors.black,
    this.strokeWidth = 2.0,
    this.dashWidth = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(
        borderRadius: borderRadius,
        color: color,
        strokeWidth: strokeWidth,
        dashWidth: dashWidth,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final double borderRadius;
  final Color color;
  final double strokeWidth;
  final double dashWidth;

  DottedBorderPainter({
    required this.borderRadius,
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final RRect rRect =
        RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(borderRadius));

    // Create a dashed path
    final Path path = Path()..addRRect(rRect);
    final Path dashedPath = Path();

    const double dashSpacing = 6.0; // Space between dashes
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double dashEnd = distance + dashWidth;
        dashedPath.addPath(pathMetric.extractPath(distance, dashEnd.clamp(0.0, pathMetric.length)), Offset.zero);
        distance += dashWidth + dashSpacing;
      }
    }

    // Draw the dashed border
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Dotted Vertical Line
class DottedVerticalDivider extends StatelessWidget {
  final double height;
  final double dashHeight;
  final double dashWidth;
  final double spacing;
  final Color color;

  const DottedVerticalDivider({
    super.key,
    required this.height,
    this.dashHeight = 5.0,
    this.dashWidth = 2.0,
    this.spacing = 3.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          (height / (dashHeight + spacing)).floor(),
          (_) => Container(
            width: dashWidth,
            height: dashHeight,
            color: color,
          ),
        ),
      ),
    );
  }
}
