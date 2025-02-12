import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/app_text.dart';

void explorePaintingSheet(BuildContext context) {
  double height = MediaQuery.of(context).size.height; // Fixed the MediaQuery method

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isScrollControlled: true,
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: height * .9,
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 10.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.px),
                        appText('Wall Painting', fontSize: 22.px, fontWeight: FontWeight.bold),
                        SizedBox(height: 20.px),
                        appText('Warm tones', fontSize: 20.px, fontWeight: FontWeight.bold),
                        SizedBox(height: 12.px),
                        ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.px),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset('assets/images/water.jpg'),
                              ),
                            );
                          },
                        )
                      ],
                    ))),
          ),
          Positioned(
            top: -50.px,
            right: 16.px,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                backgroundColor: AppColors.whiteTheme,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      );
    },
  );
}
