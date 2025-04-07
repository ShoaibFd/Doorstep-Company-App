import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<String> images;
  final double? height;

  const CarouselSliderWidget({
    super.key,
    required this.images,
    this.height,
  });

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  final _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _carouselController.timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_carouselController.currentSlide < widget.images.length - 1) {
        _carouselController.currentSlide++;
      } else {
        _carouselController.currentSlide = 0;
      }
      _pageController.animateToPage(
        _carouselController.currentSlide,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _carouselController.timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(height: 20.px),
        // PageView for Carousel
        SizedBox(
          height: widget.height ?? height * 0.25,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              _carouselController.currentSlide = index;
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Container(
                width: width,
                height: height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.images[index]),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 4.px),

        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _pageController.animateToPage(
                entry.key,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: Obx(() => Container(
                    width: 8.px,
                    height: 8.px,
                    margin: EdgeInsets.symmetric(vertical: 8.px, horizontal: 4.px),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (_carouselController.currentSlide == entry.key ? AppColors.blueColor : AppColors.greyColor)
                          .withOpacity(_carouselController.currentSlide == entry.key ? 0.9 : 0.5),
                    ),
                  )),
            );
          }).toList(),
        ),
        SizedBox(height: 10.px),
      ],
    );
  }
}

class CarouselController extends GetxController {
  final _currentSlide = 0.obs;
  Timer? timer;

  int get currentSlide => _currentSlide.value;
  set currentSlide(int value) => _currentSlide.value = value;
}
