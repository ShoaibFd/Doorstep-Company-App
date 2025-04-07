// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/app_text.dart';
import '../../../../components/custom_container.dart';
import '../../../../theme/colors.dart';

class RefundStatusSummaryScreen extends StatefulWidget {
  const RefundStatusSummaryScreen({super.key});

  @override
  _RefundStatusSummaryScreenState createState() => _RefundStatusSummaryScreenState();
}

class _RefundStatusSummaryScreenState extends State<RefundStatusSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return CustomContainer(
                          color: AppColors.transparentColor,
                          borderColor: AppColors.lowPurple,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                appText('Your refund is', fontWeight: FontWeight.bold),
                                CustomContainer(
                                    height: 30.h,
                                    width: 100.w,
                                    borderColor: AppColors.lowPurple,
                                    borderRadius: 40.r,
                                    color: AppColors.lowPurple.withOpacity(0.1),
                                    child: Center(
                                        child: appText('In Progress',
                                            color: AppColors.lowPurple, fontWeight: FontWeight.bold)))
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                appText('History', fontSize: 16.sp, fontWeight: FontWeight.bold),
                Expanded(
                    child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: appText('25 Feb, 2025'),
                        ),
                        SizedBox(height: 6.h),
                        Container(
                            margin: EdgeInsets.only(bottom: 8.h),
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(color: AppColors.lowPurple)),
                            child: Padding(
                                padding: EdgeInsets.all(10.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Refund ID#'),
                                        appText(' 5646756473'),
                                        CustomContainer(
                                            height: 30.h,
                                            width: 100.w,
                                            borderColor: AppColors.darkGreen,
                                            borderRadius: 40.r,
                                            color: AppColors.darkGreen,
                                            child: Center(
                                                child: appText('Completed',
                                                    color: AppColors.whiteTheme, fontWeight: FontWeight.bold))),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Amount claimed for refund',
                                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                                        appText('Rs. 500', fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                    SizedBox(height: 6.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Deductions', fontSize: 14.sp, fontWeight: FontWeight.bold),
                                        appText('Rs. 100', fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                    const Divider(),
                                    SizedBox(height: 6.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Amount Refunded', fontSize: 14.sp, fontWeight: FontWeight.bold),
                                        appText('Rs. 450', fontWeight: FontWeight.bold)
                                      ],
                                    )
                                  ],
                                ))),
                      ],
                    );
                  },
                )),
              ],
            )));
  }
}
