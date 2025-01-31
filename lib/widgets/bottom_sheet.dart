import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import 'bottom_sheet/rating_screen.dart';
import 'custom_text.dart';

void showFilterRatingBottomSheet(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isDismissible: true,
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(8.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.px),
                      Row(
                        children: [
                          const Icon(Icons.star),
                          SizedBox(width: 8.px),
                          appText('Filters', fontSize: 22.px, fontWeight: FontWeight.bold)
                        ],
                      ),
                      SizedBox(height: 10.px),
                      DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              const TabBar(
                                indicatorColor: AppColors.lowPurple,
                                labelColor: AppColors.lowPurple,
                                indicatorSize: TabBarIndicatorSize.tab,
                                dividerColor: AppColors.transparentColor,
                                tabs: [
                                  Tab(text: 'Rating'),
                                  Tab(text: 'Sort By'),
                                  Tab(text: 'Others'),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.7,
                                child: const TabBarView(
                                  children: [
                                    RatingScreen(),
                                    Center(child: Text('Sort By Content')),
                                    Center(child: Text('Others Content')),
                                  ],
                                ),
                              )
                            ],
                          )),
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
      );
    },
  );
}
