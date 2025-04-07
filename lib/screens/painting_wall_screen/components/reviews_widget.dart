import 'package:doorstep_company_app/components/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/app_text.dart';
import '../../../components/custom_container.dart';
import '../../../components/divider.dart';
import '../../../theme/colors.dart';

class ReviewsWidget extends StatefulWidget {
  const ReviewsWidget({super.key});

  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  final List<bool> selectedFilters = List.generate(4, (index) => false);
  final List<String> categories = [
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
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star, size: 18.sp),
              appText('4.81', fontSize: 24.sp, fontWeight: FontWeight.bold),
            ],
          ),
          SizedBox(height: 6.h),
          appText('846 reviews', fontSize: 16.sp),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: List.generate(
                    5,
                    (index) {
                      int count = [1000, 29000, 13000, 10000, 34000][index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Row(
                          children: [
                            Icon(Icons.star, size: 18.sp),
                            appText('${5 - index}'),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: LinearProgressIndicator(
                                value: count / 34000,
                                backgroundColor: Colors.grey[300],
                                color: AppColors.blackColor,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: appText('${(count / 1000).toStringAsFixed(0)}k'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          div(),
          SizedBox(height: 10.h),
          appText('Customer photos & videos', fontSize: 20.sp, fontWeight: FontWeight.bold),
          SizedBox(height: 20.h),
          SizedBox(
              height: 100.h,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(left: 6.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          image: const DecorationImage(
                              image: AssetImage('assets/images/fullroom.jpeg'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(6.r)));
                },
              )),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText('All Reviews', fontSize: 20.sp, fontWeight: FontWeight.bold),
              InkWell(
                onTap: () {
                  showFilterRatingBottomSheet(context);
                },
                child: appText("Filter", fontSize: 16.sp, color: AppColors.lowPurple, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                (index) {
                  final isSelected = selectedFilters[index];
                  return CustomContainer(
                      onTap: () => toggleFilter(index),
                      width: 120.w,
                      height: 34.h,
                      borderRadius: 8.r,
                      margin: EdgeInsets.only(right: 8.w),
                      color: isSelected ? AppColors.blueColor : AppColors.transparentColor,
                      borderColor: isSelected ? AppColors.blueColor : AppColors.hintGrey,
                      child: Center(
                        child: appText(categories[index], color: isSelected ? AppColors.whiteTheme : Colors.black),
                      ));
                },
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText('Dishant Sharma', fontSize: 16.sp, fontWeight: FontWeight.bold),
                        Container(
                          height: 24.h,
                          width: 40.w,
                          decoration:
                              BoxDecoration(color: AppColors.darkGreen, borderRadius: BorderRadius.circular(4.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.star, size: 14.sp, color: AppColors.whiteTheme),
                              appText('5', color: AppColors.whiteTheme),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        appText('Aug 2, 2024', color: AppColors.hintGrey),
                        Icon(Icons.circle, size: 6.sp, color: AppColors.hintGrey),
                        appText('For split AC, header', color: AppColors.hintGrey)
                      ],
                    ),
                    SizedBox(height: 10.h),
                    appText('Gloss wood repaint, Apex exterior emulsion Fresh paint', fontSize: 15.sp),
                    SizedBox(height: 20.h),
                    const Divider(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
