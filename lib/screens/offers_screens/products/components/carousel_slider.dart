import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductsCarouselSlider extends StatefulWidget {
  final List<String> images;
  final double? height;

  const ProductsCarouselSlider({super.key, required this.images, required this.height});

  @override
  _ProductsCarouselSliderState createState() => _ProductsCarouselSliderState();
}

class _ProductsCarouselSliderState extends State<ProductsCarouselSlider> {
  late PageController _pageController;
  final RxInt _currentIndex = 0.obs;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex.value < widget.images.length - 1) {
        _currentIndex.value++;
      } else {
        _currentIndex.value = 0; // Loop back to the first image
      }
      _pageController.animateToPage(
        _currentIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height ?? 200.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              _currentIndex.value = index;
            },
            itemBuilder: (context, index) {
              return Image.network(widget.images[index], fit: BoxFit.cover);
            },
          ),
        ),
        const SizedBox(height: 10),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex.value == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            )),
      ],
    );
  }
}
