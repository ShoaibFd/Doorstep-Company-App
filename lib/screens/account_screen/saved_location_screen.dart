import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_text.dart';
import '../../theme/colors.dart';

class SavedLocationScreen extends StatelessWidget {
  const SavedLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Saved location', fontSize: 18.sp, fontWeight: FontWeight.w400)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.whiteTheme,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(color: AppColors.grey300, offset: const Offset(1, 1), blurRadius: 1, spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Home', fontWeight: FontWeight.bold),
                        appText('Sabzazar, Near Ideal Mall, Maxcore House , Multan', color: AppColors.hintGrey),
                        SizedBox(height: 8.h),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.edit_location_alt_sharp, color: AppColors.greenColor),
                                SizedBox(width: 8.w),
                                appText('Edit', fontWeight: FontWeight.bold, color: AppColors.hintGrey)
                              ],
                            ),
                            Container(
                              height: 24.h,
                              width: 2.w,
                              color: AppColors.hintGrey,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.delete_forever_rounded, color: AppColors.redColor),
                                SizedBox(width: 8.w),
                                appText('Delete', fontWeight: FontWeight.bold, color: AppColors.hintGrey)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            Container(
              height: 60.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.whiteTheme,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(color: AppColors.grey300, blurRadius: 1, offset: const Offset(1, 1), spreadRadius: 1)
                  ]),
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText('Add New Address',
                        fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.darkGreen),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.darkGreen,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
