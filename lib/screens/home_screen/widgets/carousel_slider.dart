// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// import '../../../constants/colors.dart';

// class CarouselSliderWidget extends StatefulWidget {
//   final List<String> images;
//   final double? height;

//   const CarouselSliderWidget({
//     super.key,
//     required this.images,
//     this.height,
//   });

//   @override
//   State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
// }

// class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
//   final CarouselController _carouselController = CarouselController();
//   int _currentSlide = 0;

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.sizeOf(context).height;
//     double width = MediaQuery.sizeOf(context).width;
//     return Column(
//       children: [
//         CarouselSlider(
//           options: CarouselOptions(
//             height: widget.height ?? height * 0.25,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             autoPlayAnimationDuration: const Duration(milliseconds: 700),
//             autoPlayCurve: Curves.linear,
//             viewportFraction: 1.2,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _currentSlide = index;
//               });
//             },
//           ),
//           items: widget.images.map((item) {
//             return Container(
//               width: width * 1,
//               height: height * 0.3,
//               decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage(item), fit: BoxFit.fill),
//                 // borderRadius: BorderRadius.circular(4),
//               ),
//             );
//           }).toList(),
//         ),
//         const SizedBox(height: 4),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: widget.images.asMap().entries.map((entry) {
//             return GestureDetector(
//               onTap: () => _carouselController.animateTo,
//               child: Container(
//                 width: 8.0,
//                 height: 8.0,
//                 margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: (Theme.of(context).brightness == Brightness.dark ? AppColors.whiteTheme : AppColors.blueColor)
//                       .withOpacity(_currentSlide == entry.key ? 0.9 : 0.5),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';

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
  int _currentSlide = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentSlide < widget.images.length - 1) {
        _currentSlide++;
      } else {
        // Keep the current slide on the last image and stop the loop
        _currentSlide = 0; // Reset to the first image but without going back
      }
      _pageController.animateToPage(
        _currentSlide,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        // PageView for Carousel
        SizedBox(
          height: widget.height ?? height * 0.25,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentSlide = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Container(
                width: width,
                height: height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.images[index]),
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
              child: Container(
                width: 8.px,
                height: 8.px,
                margin: EdgeInsets.symmetric(vertical: 8.px, horizontal: 4.px),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (_currentSlide == entry.key ? AppColors.blueColor : AppColors.greyColor)
                      .withOpacity(_currentSlide == entry.key ? 0.9 : 0.5),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
