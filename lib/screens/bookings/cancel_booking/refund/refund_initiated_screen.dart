import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/app_text.dart';
import '../../../../components/custom_container.dart';
import '../../../../theme/colors.dart';
import '../cancel_booking_detail_screen.dart';

class RefundInitiatedScreen extends StatefulWidget {
  const RefundInitiatedScreen({super.key});

  @override
  _RefundInitiatedScreenState createState() => _RefundInitiatedScreenState();
}

class _RefundInitiatedScreenState extends State<RefundInitiatedScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Get.to(() => const CancelBookingDetailScreen());
                        },
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.only(top: 8.h),
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(color: AppColors.grey300)),
                                child: Padding(
                                    padding: EdgeInsets.all(10.r),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('Home cleaning', fontSize: 17.sp, fontWeight: FontWeight.bold),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            appText('Booking # 56457573'),
                                            CustomContainer(
                                                height: 30.h,
                                                width: 100.w,
                                                borderRadius: 40.r,
                                                color: AppColors.orangeColor,
                                                child: Center(child: appText('Initiate', color: AppColors.whiteTheme)))
                                          ],
                                        ),
                                        appText('10 Oct, 2023 20:02', color: AppColors.hintGrey),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            appText('Rs. 77,505',
                                                color: AppColors.darkGreen,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp),
                                            TextButton(
                                                onPressed: () {
                                                  Get.to(() => const CancelBookingDetailScreen());
                                                },
                                                child: appText(
                                                  'View Details',
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.darkBlueShade,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            appText('Service date: ', fontWeight: FontWeight.bold),
                                            appText('12 Oct, 2023 02:15 PM',
                                                fontWeight: FontWeight.bold, color: AppColors.hintGrey),
                                          ],
                                        ),
                                      ],
                                    )));
                          },
                        ))),
              ],
            )));
  }
}
