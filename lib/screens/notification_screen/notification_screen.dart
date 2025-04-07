import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/app_text.dart';
import '../../components/custom_container.dart';
import '../../theme/colors.dart';
import '../bookings/quote_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appText('Notifications', fontSize: 18.sp, fontWeight: FontWeight.w400),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.whiteTheme,
                        borderRadius: BorderRadius.circular(6.r),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey300, offset: const Offset(1, 1), blurRadius: 1, spreadRadius: 1)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const QuoteScreen());
                        },
                        leading: CustomContainer(
                            height: 60.h,
                            width: 60.w,
                            borderRadius: 6.r,
                            color: AppColors.blackColor,
                            child: const SizedBox()),
                        title: appText('Notification Title', fontSize: 15.sp, fontWeight: FontWeight.w400),
                        subtitle: appText('Partner just completed your job', color: AppColors.hintGrey),
                        trailing: appText('03:40', color: AppColors.hintGrey, fontSize: 12.sp),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
