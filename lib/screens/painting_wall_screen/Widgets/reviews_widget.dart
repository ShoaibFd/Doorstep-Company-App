import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/divider.dart';

class ReviewsWidget extends StatefulWidget {
  const ReviewsWidget({super.key});

  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  final List<bool> selectedFilters = List.generate(4, (index) => false);
  final List<String> categories = [
    'With media',
    'Most detailed',
    'In my area',
    'Frequent user',
  ];

  void toggleFilter(int index) {
    setState(() {
      selectedFilters[index] = !selectedFilters[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SizedBox(height: 10.px),
          div(),
          SizedBox(height: 10.px),
          appText('Customer photos & videos', fontSize: 20.px, fontWeight: FontWeight.bold),
          SizedBox(height: 20.px),
          SizedBox(
              height: 100.px,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(left: 6.px),
                      width: 100.px,
                      decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          image: const DecorationImage(
                              image: AssetImage('assets/images/fullroom.jpeg'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(6)));
                },
              )),
          SizedBox(height: 20.px),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText('All Reviews', fontSize: 20.px, fontWeight: FontWeight.bold),
              InkWell(
                onTap: () {
                  // TermsAndConditionBottomSheet(context);
                },
                child: appText("Filter", fontSize: 18.px, color: AppColors.lowPurple),
              ),
            ],
          ),
          SizedBox(height: 10.px),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  height: 45.px,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final isSelected = selectedFilters[index];
                      return CustomContainer(
                          onTap: () => toggleFilter(index),
                          width: 160.px,
                          borderRadius: 8.px,
                          margin: EdgeInsets.only(right: 8.px),
                          color: AppColors.transparentColor,
                          borderColor: isSelected ? AppColors.blueColor : AppColors.hintGrey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 6.px,
                            children: [
                              appText(categories[index], color: isSelected ? AppColors.blueColor : Colors.black),
                              if (isSelected)
                                IconButton(
                                    onPressed: () => toggleFilter(index),
                                    icon: Icon(Icons.close, color: AppColors.blueColor, size: 20.px))
                            ],
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.px),
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
                        appText('Dishant Sharma', fontSize: 18.px),
                        SizedBox(height: 10.px),
                        Container(
                          height: 24.px,
                          width: 40.px,
                          decoration:
                              BoxDecoration(color: AppColors.darkGreen, borderRadius: BorderRadius.circular(4.px)),
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
                    SizedBox(height: 10.px),
                    const Divider(),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 20.px),
          CustomContainer(
              height: 50.px,
              color: AppColors.transparentColor,
              borderColor: AppColors.grey300,
              child: Padding(
                  padding: EdgeInsets.all(8.px),
                  child: Center(child: appText('Show more', color: AppColors.lowPurple, fontSize: 18.px)))),
          SizedBox(height: 20.px),
        ],
      ),
    );
  }
}
