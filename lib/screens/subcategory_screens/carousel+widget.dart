import 'dart:async';

import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final double height;
  final double width;
  final List<String> carouselImages;

  const CustomCarousel({
    super.key,
    required this.height,
    required this.width,
    required this.carouselImages,
  });

  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentSlide = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentSlide < widget.carouselImages.length - 1) {
        _currentSlide++;
      } else {
        _currentSlide = 0;
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
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView for Carousel
        SizedBox(
          height: widget.height * 0.29,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.carouselImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentSlide = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                width: widget.width,
                height: widget.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.carouselImages[index]),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.carouselImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _pageController.animateToPage(
                entry.key,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: Container(
                width: widget.width * 0.28,
                height: 4.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  color: (_currentSlide == entry.key ? Colors.blueAccent : Colors.grey)
                      .withOpacity(_currentSlide == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
