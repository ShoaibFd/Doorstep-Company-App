import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarSearchButton extends StatelessWidget {
  const AppBarSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.px,
      width: 40.px,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Center(
        child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              // Share.share('Check out the Flutter website: $urlToShare');
            },
            icon: const Icon(
              Icons.search,
              size: 26,
            )),
      ),
    );
  }
}
