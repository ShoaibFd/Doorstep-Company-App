import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import '../../../components/divider.dart';

void policyBottomSheet(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isDismissible: true,
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: height * .65,
            width: double.maxFinite,
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3.h),
                        appText('Cancellation Policy', fontSize: 18.sp, fontWeight: FontWeight.bold),
                        SizedBox(height: 2.h),
                        const Divider(),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText('Time', fontWeight: FontWeight.bold, fontSize: 16),
                            appText('Free', fontWeight: FontWeight.bold, fontSize: 16),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText('More than 4 hrs before\nthe service', fontSize: 16),
                            appText('Free', color: AppColors.darkGreen, fontSize: 16),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: DottedLine(dashColor: AppColors.grey300),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText('Within 4 hrs of the\n service', fontSize: 15),
                            appText('Upto PKR 40', fontSize: 15),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: DottedLine(dashColor: AppColors.grey300),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          spacing: 16.px,
                          children: [
                            Icon(Icons.info_outline, color: AppColors.darkGreen, size: 18),
                            appText('No fee if a professional is not assigned',
                                color: AppColors.darkGreen, fontSize: 15)
                          ],
                        ),
                        SizedBox(height: 2.h),
                        div(),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText('This fee goes to the professional', fontSize: 16, fontWeight: FontWeight.bold),
                                SizedBox(height: 10.px),
                                appText(
                                    'Their time is reserved for the service\n& they cannot get another job for the\nreserved  time.',
                                    color: AppColors.hintGrey,
                                    fontSize: 16),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child:
                                  Image.asset('assets/images/heart.png', height: 50.px, color: AppColors.orangeColor),
                            )
                          ],
                        ),
                        SizedBox(height: 20.px),
                        const Divider(),
                        SizedBox(height: 4.px),
                        CustomContainer(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            height: 50.px,
                            width: double.maxFinite,
                            color: AppColors.transparentColor,
                            borderColor: AppColors.grey300,
                            child: Center(
                              child: appText('Okay',
                                  color: AppColors.lowPurple, fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ))),
          ),
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
