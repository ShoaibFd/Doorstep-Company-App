import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  List<String> images = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
    'assets/images/pest-control.png',
    'assets/images/drill.png',
    'assets/images/water.jpg',
    'assets/images/smartphone.png',
    'assets/images/paintingwater.png',
    'assets/images/bricks.png',
    'assets/images/pest-control.png',
    'assets/images/drill.png',
    'assets/images/water.jpg',
    'assets/images/smartphone.png',
    'assets/images/paintingwater.png',
    'assets/images/bricks.png',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.px),
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                    height: height * 0.3,
                    width: width,
                    decoration:
                        BoxDecoration(image: DecorationImage(image: AssetImage(images[index]), fit: BoxFit.cover))),
                if (index < images.length - 1) const Divider(thickness: 4, color: AppColors.greyColor),
              ],
            );
          },
        ),
      ),
    );
  }
}
