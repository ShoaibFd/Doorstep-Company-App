import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/app_text.dart';
import '../../../../components/custom_container.dart';
import '../../../../theme/colors.dart';

class RefundHistoryScreen extends StatelessWidget {
  const RefundHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: appText('25 Jan 2023', fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    CustomContainer(
                        margin: EdgeInsets.only(bottom: 10.h),
                        color: AppColors.transparentColor,
                        borderColor: AppColors.lowPurple,
                        child: Column(
                          children: [
                            CustomContainer(
                              borderRadius: 0,
                              borderColor: AppColors.grey300,
                              color: AppColors.lowPurple.withOpacity(0.2),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    appText('Account Details', fontWeight: FontWeight.bold),
                                    appText('Transaction ID', fontWeight: FontWeight.bold),
                                    appText('Refunded Amount', fontWeight: FontWeight.bold),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      appText('UBL Bosan Road\nBranch Multan\n'),
                                      SizedBox(width: 14.w),
                                      appText('#68576678'),
                                      SizedBox(width: 80.w),
                                      appText('Rs.450', fontWeight: FontWeight.bold, color: AppColors.darkGreen),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      appText('Account title:', fontWeight: FontWeight.bold),
                                      appText(
                                        'Talha Ashraf',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      appText('Account No#:', fontWeight: FontWeight.bold),
                                      appText(
                                        '568736482826',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                ],
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
