import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/app_text.dart';
import '../../../components/custom_container.dart';
import '../../../components/divider.dart';
import '../../../theme/colors.dart';
import '../../account_screen/address_screen.dart';
import 'completed_order_summary.dart';

class ActiveOrdersScreen extends StatelessWidget {
  const ActiveOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => const CompletedOrderSummary());
                },
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText('DC Store', fontWeight: FontWeight.bold),
                            appText('In Progress',
                                fontWeight: FontWeight.bold, color: AppColors.darkGreen, fontSize: 15.sp),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            CustomContainer(
                              height: 80.h,
                              width: 80.w,
                              borderRadius: 6.r,
                              color: AppColors.grey300,
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/primary/ProductShowcasesampleimages/JPEG/Product+Showcase-1.jpg'),
                              ),
                              child: const SizedBox(),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appText(
                                    'Origional Beanie shoes Warmer For\nMen/Women Beanie Full Set-2 piece,...',
                                    color: AppColors.hintGrey,
                                  ),
                                  SizedBox(height: 6.h),
                                  CustomContainer(
                                    color: AppColors.grey300.withOpacity(0.5),
                                    borderRadius: 4.r,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Center(
                                        child: appText(
                                          'Color Family: Wine Red, Size: Int: One Size',
                                          fontSize: 12.sp,
                                          color: AppColors.hintGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6.h), // Added spacing
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Rs.600', fontWeight: FontWeight.bold),
                                        appText('Qty: 1', fontWeight: FontWeight.bold),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          spacing: 10.w,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            appText('Total(1 item):', color: AppColors.lightBlack),
                            appText('Rs.799', fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomContainer(
                                onTap: () {},
                                borderRadius: 4.r,
                                color: AppColors.transparentColor,
                                width: 110.w,
                                borderColor: AppColors.grey300,
                                child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Center(
                                        child:
                                            appText('Cancel', color: AppColors.grey300, fontWeight: FontWeight.bold)))),
                            SizedBox(width: 10.w),
                            CustomContainer(
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const AddressScreen()));
                                },
                                borderRadius: 4.r,
                                color: AppColors.deepOrangeColor,
                                width: 120.w,
                                child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Center(
                                        child: appText('Chane Address',
                                            color: AppColors.whiteTheme, fontWeight: FontWeight.bold)))),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        div(),
                        SizedBox(height: 10.h),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
