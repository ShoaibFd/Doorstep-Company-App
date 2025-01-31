import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constants/colors.dart';
import '../carousel+widget.dart';

class TopBarwidget extends StatelessWidget {
  const TopBarwidget({
    super.key,
    required this.carouselImages,
  });

  final List<String> carouselImages;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    const String urlToShare = 'https://flutter.dev';
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 30.px),
            child: CustomCarousel(height: height * .80, width: width, carouselImages: carouselImages)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: width * 0.080),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 30.px,
                  width: 30.px,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.grey300, width: 2)),
                  child: Center(
                      child: Image.asset(
                    'assets/images/arrow_back.png',
                    height: 18.px,
                    color: AppColors.lightBlack,
                  )),
                ),
              ),
              const Spacer(),
              Container(
                height: height * 0.04,
                width: width * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.grey300),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    iconSize: 20.0,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
              ),
              SizedBox(width: 10.px),
              Container(
                height: height * 0.040,
                width: width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle, border: Border.all(color: AppColors.grey300)),
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
                        size: 18,
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
