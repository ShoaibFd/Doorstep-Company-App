import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_text.dart';

void learnHowBottomSheet(BuildContext context) {
  List title = ['Thoroughly cleans', 'Improves cooling efficiency', 'Low energy consumption'];
  List subtitle = [
    '2X deep removal of dust & pollutants from vital cooling part like filters & coils',
    'Restore performance of condensors by cleaning dust on the air facing side.',
    'Enhance the capacity of condensors, boosting airflow for efficient cooling.'
  ];
  List images = ['assets/images/ac-clean.png', 'assets/images/winter.png', 'assets/images/bulb.png'];
  double height = MediaQuery.of(context).size.height;
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isDismissible: true,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        height: height * 0.9,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.px),
                        appText('Power Saver', fontSize: 30.px, fontWeight: FontWeight.bold),
                        SizedBox(height: 30.px),
                        appText("You'll save more on\nelectricity bill", fontSize: 22.px, fontWeight: FontWeight.bold),
                        SizedBox(height: 60.px),
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(images[index], height: 50.px),
                                SizedBox(height: 30.px),
                                appText(title[index], fontWeight: FontWeight.bold, fontSize: 18.px),
                                SizedBox(height: 6.px),
                                appText(subtitle[index], color: AppColors.hintGrey, fontSize: 18.px),
                                SizedBox(height: 30.px),
                              ],
                            );
                          },
                        )
                      ],
                    ))),
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
        ),
      );
    },
  );
}
