import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../theme/colors.dart';
import '../app_text.dart';

void showReviewsBottomSheet(BuildContext context) {
  double height = MediaQuery.sizeOf(context).height;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.px))),
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
                  Row(
                    spacing: 6.px,
                    children: [
                      Icon(Icons.star, size: 18.px),
                      appText('4.81', fontSize: 24.px, fontWeight: FontWeight.bold),
                    ],
                  ),
                  SizedBox(height: 6.px),
                  appText('846 reviews', fontSize: 16.px),
                  SizedBox(height: 12.px),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: List.generate(
                            5,
                            (index) {
                              int count = [1000, 29000, 13000, 10000, 34000][index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.px),
                                child: Row(
                                  children: [
                                    Icon(Icons.star, size: 18.px),
                                    appText('${5 - index}'),
                                    SizedBox(width: 8.px),
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: count / 34000,
                                        backgroundColor: Colors.grey[300],
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    SizedBox(width: 8.px),
                                    appText('${(count / 1000).toStringAsFixed(0)}k'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.px),
                  ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.px),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                appText('Swati Kanoria', fontSize: 20.px, fontWeight: FontWeight.bold),
                                Container(
                                  height: 24.px,
                                  width: 40.px,
                                  decoration: BoxDecoration(
                                      color: AppColors.darkGreen, borderRadius: BorderRadius.circular(4.px)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.star, size: 14.px, color: AppColors.whiteTheme),
                                      appText('5', color: AppColors.whiteTheme),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            appText('Aug 2, 2024 - For 1 day,\nGloss wood repaint, Apex exterior emulsion Fresh paint',
                                color: AppColors.hintGrey),
                            SizedBox(height: 20.px),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
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

Widget reviewRow(int stars, int count, double value, double height, double width) {
  return Row(
    children: [
      const Expanded(child: Icon(Icons.star)),
      Expanded(child: Text(stars.toString())),
      Expanded(
        flex: 7,
        child: LinearProgressIndicator(
          backgroundColor: AppColors.grey300,
          value: value,
          minHeight: 6.px,
          color: AppColors.blackColor,
        ),
      ),
      SizedBox(width: 8.px),
      Expanded(flex: 2, child: appText("$count k")),
    ],
  );
}

Widget reviewCard({
  required String reviewer,
  required String date,
  required String comment,
  required double height,
  required double width,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appText(reviewer, fontSize: 20.px, fontWeight: FontWeight.bold),
          Container(
            height: height * 0.043,
            width: width * 0.16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.px),
              color: AppColors.lightGreen,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.white, size: 18.px),
                  appText('5', color: Colors.white, fontWeight: FontWeight.bold),
                ],
              ),
            ),
          ),
        ],
      ),
      appText(date, color: AppColors.greyColor),
      SizedBox(height: 8.px),
      appText(comment, fontSize: 16.px),
      SizedBox(height: 20.px),
    ],
  );
}
