import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../theme/colors.dart';
import '../../components/custom_container.dart';
import '../../components/app_text.dart';
import 'cancel_booking/cancel_booking_reason_screen.dart';

class AcceptedBookingDetailScreen extends StatelessWidget {
  const AcceptedBookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText('Cockroach, ant & General Pest Control', fontSize: 18.px, fontWeight: FontWeight.bold),
              appText('Wed, 12th May 2021 at 10:00 AM', color: AppColors.hintGrey)
            ],
          ),
          actions: [
            CustomContainer(
                height: 34.px,
                width: 50.px,
                borderRadius: 8.px,
                color: AppColors.whiteTheme,
                borderColor: AppColors.grey300,
                child: Center(child: appText('Help', color: AppColors.lowPurple))),
            CustomContainer(
                margin: EdgeInsets.symmetric(horizontal: 8.px),
                height: 34.px,
                width: 50.px,
                borderRadius: 8.px,
                color: AppColors.whiteTheme,
                borderColor: AppColors.grey300,
                child: Center(child: appText('SOS', color: AppColors.redColor)))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(spacing: 10.px, crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              spacing: 10.px,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8.px,
                  children: [
                    Icon(Icons.battery_full_rounded, color: AppColors.greenColor, size: 16.px),
                    appText('Booking accepted', color: AppColors.greenColor),
                  ],
                ),
                SizedBox(height: 14.px),
                appText('Finding a Plus professional', fontSize: 20.px, fontWeight: FontWeight.bold),
                appText('A pest controller will be assigned 3 hours 30 minutes before the booking time',
                    color: AppColors.hintGrey, fontWeight: FontWeight.w400),
                SizedBox(height: 10.px),
                const Divider(),
                Row(
                  spacing: 5.px,
                  children: [
                    appText('Next:'),
                    appText('Assigning professional', fontSize: 18.px),
                    const Spacer(),
                    const Icon(Icons.chevron_right)
                  ],
                ),
              ],
            ),
          ),
          CustomContainer(
              height: 60.px,
              width: double.infinity,
              borderRadius: 0,
              color: AppColors.blueColor.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.favorite, color: AppColors.darkBlueShade),
                  appText('Simple things to make your professional smile', color: AppColors.darkBlueShade),
                ],
              )),
          SizedBox(height: 10.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              spacing: 10.px,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText('Booking details', fontSize: 20.px, fontWeight: FontWeight.bold),
                Row(
                  spacing: 12.px,
                  children: [
                    const Icon(Icons.mobile_friendly_outlined),
                    appText('Amount to be paid: Rs 1,000', fontSize: 16.px),
                    const Spacer(),
                    const Icon(Icons.chevron_right)
                  ],
                ),
                SizedBox(height: 10.px),
                CustomContainer(
                    height: 45.px,
                    width: 100.px,
                    color: AppColors.whiteTheme,
                    borderColor: AppColors.grey300,
                    borderRadius: 8.px,
                    child: Center(
                      child: appText('Pay Now', color: AppColors.lowPurple, fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 10.px),
                const Divider(),
                Row(
                  spacing: 8.px,
                  children: [
                    const Icon(Icons.place_outlined),
                    appText(
                      'Alpha 706, Jayabheri Sitcoin Country, kothaguda\nHyderabad, Ranga Reddy, Telangana 500084, India',
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  spacing: 8.px,
                  children: [
                    const Icon(Icons.timer_outlined),
                    appText(
                      'Wed, 12th May 2021 at 10:00 AM',
                    ),
                  ],
                ),
                SizedBox(height: 10.px),
                Row(
                  spacing: 8.px,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                        height: 40.px,
                        width: 150.px,
                        color: AppColors.whiteTheme,
                        borderColor: AppColors.grey300,
                        borderRadius: 8.px,
                        child: Center(
                          child: appText('Reschedule', fontWeight: FontWeight.bold, fontSize: 16.px),
                        )),
                    CustomContainer(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const CancelBookingReasonScreen()));
                        },
                        height: 40.px,
                        width: 150.px,
                        color: AppColors.whiteTheme,
                        borderColor: AppColors.grey300,
                        borderRadius: 8.px,
                        child: Center(
                          child: appText('Cancel Booking',
                              color: AppColors.redColor, fontWeight: FontWeight.bold, fontSize: 16.px),
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 4.px),
          Container(
            width: double.infinity,
            color: AppColors.grey300.withOpacity(0.3),
            child: Padding(
              padding: EdgeInsets.all(8.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.px),
                  appText('Cancellation and rescheduling policy', fontSize: 20.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 10.px),
                  Row(
                    spacing: 8.px,
                    children: [
                      const Icon(Icons.timer),
                      appText('No charge if you reschedule or cancel\nuntil 2 hours before the service'),
                    ],
                  ),
                  SizedBox(height: 10.px),
                  Row(
                    spacing: 8.px,
                    children: [
                      const Icon(Icons.timer),
                      appText(
                          'Within 2hr, a cancellation fee of Rs 200 applies and\nrescheduling is not allowed, This fee helps\ncompensate professionals for the loss of business'),
                    ],
                  ),
                  SizedBox(height: 10.px),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.px),
        ])));
  }
}
