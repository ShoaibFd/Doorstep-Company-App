import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/app_text.dart';
import '../../components/custom_container.dart';
import '../../components/divider.dart';
import '../../theme/colors.dart';
import '../chat/chat_screen.dart';
import 'approve_disapprove_screen.dart';
import 'user_detail_screen.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  int activeStep = 0;
  double progress = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: appText('Booking Details', fontSize: 18.sp, fontWeight: FontWeight.w400)),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 6.h),
              appText('Booking # 1000283', fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.blueColor),
              const Divider(),
              // div(),
              Row(
                spacing: 20.w,
                children: [
                  Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/mixergrinder.jpeg'), fit: BoxFit.cover))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText('Bathroom & kitchen\ncleaning', fontSize: 15.sp, fontWeight: FontWeight.w400),
                      SizedBox(height: 6.h),
                      appText('2x services', color: AppColors.greyColor, fontWeight: FontWeight.w400),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              SizedBox(height: 10.h),
              Row(
                spacing: 4.w,
                children: [
                  appText('Customer : ', fontSize: 15.sp, fontWeight: FontWeight.w400),
                  appText(' Ali Ahmad', fontSize: 16.sp, fontWeight: FontWeight.w400),
                  const Spacer(),
                  appText('REPEAT ', color: AppColors.greenColor, fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(height: 10.h),
              bookingRow(text1: 'Booking Date', text2: '12 Feb 2045'),
              SizedBox(height: 6.h),
              bookingRow(text1: 'Service Date', text2: '12 Feb 2045'),
              SizedBox(height: 6.h),
              appText('Bosan Road, Near Ideal Mall, Sabzazar\ncolony, Multan, Punjab',
                  fontSize: 15.sp, color: AppColors.hintGrey),
              SizedBox(height: 20.h),
              div(),
              SizedBox(height: 10.h),
              appText('Status', fontSize: 18.sp, fontWeight: FontWeight.bold),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  stepWidget('Accepted', activeStep >= 0),
                  stepConnector(activeStep >= 0),
                  stepWidget('Assigned', activeStep >= 1),
                  stepConnector(activeStep >= 1),
                  stepWidget('Working', activeStep >= 2),
                  stepConnector(activeStep >= 2),
                  stepWidget('Completed', activeStep >= 3),
                ],
              ),
              const Divider(),
              SizedBox(height: 10.h),
              appText('Payment Method', fontWeight: FontWeight.bold, fontSize: 18.sp),
              SizedBox(height: 10.h),
              Row(
                spacing: 4.w,
                children: [
                  appText('Cash after service', color: AppColors.hintGrey),
                  const Spacer(),
                  appText('Payment Status:', color: AppColors.hintGrey),
                  CustomContainer(
                      height: 30.h,
                      width: 76.w,
                      borderRadius: 6.r,
                      color: AppColors.redColor,
                      child: Center(child: appText('Unpaid', color: AppColors.whiteTheme, fontWeight: FontWeight.w400)))
                ],
              ),
              appText('Amount : Rs. 47627', fontWeight: FontWeight.bold, fontSize: 15.sp),
              SizedBox(height: 10.h),
              div(),
              SizedBox(height: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText('Professional', fontSize: 18.sp, fontWeight: FontWeight.bold),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const UserDetailScreen());
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.w,
                      children: [
                        CircleAvatar(
                            radius: 40.r,
                            backgroundImage: const NetworkImage(
                                'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?cs=srgb&dl=pexels-andrewperformance1-697509.jpg&fm=jpg')),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: appText('Muzammil Amjad', fontSize: 15.sp, fontWeight: FontWeight.bold)),
                                CustomContainer(
                                    color: AppColors.blueColor,
                                    borderRadius: 8.r,
                                    child: Padding(
                                        padding: EdgeInsets.all(6.r),
                                        child: Center(
                                            child: appText('Assigned',
                                                color: AppColors.whiteTheme,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400)))),
                              ],
                            ),
                            Row(
                              spacing: 6.w,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: AppColors.hintGrey,
                                ),
                                appText('4.86',
                                    fontSize: 15.sp, fontWeight: FontWeight.w400, color: AppColors.hintGrey),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [appText('Completed jobs: 15', fontSize: 15.sp, fontWeight: FontWeight.w400)],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                          width: 100.w,
                          borderRadius: 8.r,
                          color: AppColors.transparentColor,
                          borderColor: AppColors.blackColor,
                          child: Padding(
                            padding: EdgeInsets.all(4.r),
                            child: Row(
                              spacing: 4.w,
                              children: [
                                Image.asset('assets/images/checkmark.png', height: 20.sp, color: AppColors.greenColor),
                                appText('Verified',
                                    color: AppColors.greenColor, fontSize: 15.sp, fontWeight: FontWeight.w400)
                              ],
                            ),
                          )),
                      Row(
                        spacing: 20.w,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => const ChatScreen());
                              },
                              child: CircleAvatar(
                                  backgroundColor: AppColors.grey300.withOpacity(0.5),
                                  child:
                                      Image.asset('assets/images/chat.png', height: 22.h, color: AppColors.blueColor))),
                          GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                  backgroundColor: AppColors.grey300.withOpacity(0.5),
                                  child: const Icon(Icons.call, color: AppColors.blueColor))),
                          GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                  backgroundColor: AppColors.grey300.withOpacity(0.5),
                                  child: const Icon(Icons.place_outlined, color: AppColors.blueColor))),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              div(),
              SizedBox(height: 10.h),
              appText('Booking Summary', fontSize: 18.sp, fontWeight: FontWeight.bold),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Service Info', fontSize: 16.sp),
                  appText('Service Cost', fontSize: 16.sp),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Bridal Makeover', fontSize: 15.sp, fontWeight: FontWeight.w400),
                  appText('Rs. 40,000', fontSize: 15.sp, fontWeight: FontWeight.w400),
                ],
              ),
              SizedBox(height: 6.h),
              appText('Wedding Receptionist makeover', color: AppColors.hintGrey, fontSize: 15.sp),
              SizedBox(height: 6.h),
              appText('Unit price: Rs.30,000', color: AppColors.hintGrey, fontSize: 15.sp), SizedBox(height: 6.h),
              appText('Quantity: 1', color: AppColors.hintGrey, fontSize: 15.sp),
              SizedBox(height: 6.h),
              appText('Campaign: Rs. 746743', color: AppColors.hintGrey, fontSize: 15.sp),
              SizedBox(height: 6.h),
              appText('Coupons: Rs. 746743', color: AppColors.hintGrey, fontSize: 15.sp),
              SizedBox(height: 10.h),
              const Divider(),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('SubTotal', fontSize: 18.sp),
                  appText('Rs. 1900', fontSize: 18.sp),
                ],
              ),
              SizedBox(height: 6.h),
              subTotalRow(text1: 'Service discount', text2: '(-) Rs. 0.00'),
              SizedBox(height: 6.h),
              subTotalRow(text1: 'Coupon discount', text2: '(-) Rs. 499.00'),
              SizedBox(height: 6.h),
              subTotalRow(text1: 'Campaign discount', text2: '(-) Rs. 499.00'),
              SizedBox(height: 6.h),
              subTotalRow(text1: 'Service VAT', text2: '(+) Rs. 499.00'),
              SizedBox(height: 6.h),
              subTotalRow(text1: 'Platform charge', text2: '(+) Rs. 499.00'),
              SizedBox(height: 10.h),
              const Divider(),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Grand Total', color: AppColors.blueShade, fontWeight: FontWeight.bold, fontSize: 16.sp),
                  appText('Rs. 49,000', color: AppColors.blueShade, fontWeight: FontWeight.bold, fontSize: 16.sp),
                ],
              ),
              SizedBox(height: 20.h),
              CustomContainer(
                  height: 34.h,
                  width: 140.w,
                  borderColor: AppColors.lowPurple,
                  color: AppColors.transparentColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      appText('Verified By DC'),
                      Icon(Icons.check_circle, color: AppColors.greenColor, size: 16.sp)
                    ],
                  )),
              SizedBox(height: 20.h)
            ]))));
  }
}
