import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import 'complete_booking_detail_screen.dart';

class CompletedBookingScreen extends StatefulWidget {
  const CompletedBookingScreen({super.key});

  @override
  _CompletedBookingScreenState createState() => _CompletedBookingScreenState();
}

class _CompletedBookingScreenState extends State<CompletedBookingScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const CompleteBookingDetailScreen()));
                        },
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColors.grey300)),
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('Home cleaning', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            appText('Booking # 56457573'),
                                            CustomContainer(
                                                height: 30.px,
                                                width: 100.px,
                                                borderRadius: 40.px,
                                                color: AppColors.darkGreen,
                                                child: Center(child: appText('Completed', color: AppColors.whiteTheme)))
                                          ],
                                        ),
                                        appText('10 Oct, 2023 20:02', color: AppColors.hintGrey),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            appText('Rs. 77,505',
                                                color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 15),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => const CompleteBookingDetailScreen()));
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
