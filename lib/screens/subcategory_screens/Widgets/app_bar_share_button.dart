import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

class AppBarShareButton extends StatelessWidget {
  AppBarShareButton({super.key});
  String urlToShare = 'https://flutter.dev';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.px,
      width: 40.px,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 1, blurRadius: 1, offset: Offset(1, 1)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              Share.share('Check out the Flutter website: $urlToShare');
            },
            icon: const Icon(
              Icons.share,
              size: 20,
            )),
      ),
    );
  }
}
