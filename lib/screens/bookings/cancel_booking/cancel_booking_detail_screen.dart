import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import '../../../components/divider.dart';
import '../../chat/chat_screen.dart';
import '../user_detail_screen.dart';
import 'refund/refund_screeen.dart';

class CancelBookingDetailScreen extends StatefulWidget {
  const CancelBookingDetailScreen({super.key});

  @override
  State<CancelBookingDetailScreen> createState() => _CancelBookingDetailScreenState();
}

class _CancelBookingDetailScreenState extends State<CancelBookingDetailScreen> {
  int activeStep = 0;
  double progress = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: appText('Booking Details', fontSize: 18.px, fontWeight: FontWeight.w400)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: SingleChildScrollView(
          child: Column(
            // spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText('Booking # 1000283', fontSize: 18.px, fontWeight: FontWeight.w400, color: AppColors.blueColor),
              SizedBox(height: 10.px),
              Row(
                children: [
                  appText("You've", color: AppColors.hintGrey, fontSize: 15.px),
                  appText(" earned 50 coin ", fontWeight: FontWeight.bold, fontSize: 15.px),
                  appText("on this order", color: AppColors.hintGrey, fontSize: 15.px),
                  const Spacer(),
                  Image.asset('assets/images/coin.png', height: 36.px)
                ],
              ),
              SizedBox(height: 6.px),

              const Divider(),
              SizedBox(height: 10.px),
              Row(
                spacing: 20.px,
                children: [
                  Container(
                      height: 80.px,
                      width: 80.px,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/mixergrinder.jpeg'), fit: BoxFit.cover))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText('Bathroom & kitchen\ncleaning', fontSize: 18.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 6.px),
                      appText('2x services', color: AppColors.greyColor, fontSize: 16.px),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.px),
              const Divider(),
              SizedBox(height: 10.px),
              Row(
                children: [
                  appText('Customer : ', fontSize: 16.px, color: AppColors.hintGrey),
                  SizedBox(width: 85.px),
                  appText(' Ali Ahmad', fontSize: 15.px, fontWeight: FontWeight.bold),
                  const Spacer(),
                  appText('REPEAT ', color: AppColors.greenColor, fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(height: 30.px),
              bookingRow(text1: 'Booking Date', text2: '12 Feb 2045'),
              SizedBox(height: 30.px),
              bookingRow(text1: 'Service Date', text2: '12 Feb 2045'),
              SizedBox(height: 30.px),
              bookingRow(text1: 'Address', text2: 'Bosan Road, Near\nIdeal Mall, Sabzazar\ncolonyMultan, Punjab'),

              SizedBox(height: 20.px),
              div(),
              SizedBox(height: 20.px),
              appText('Status', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 20.px),
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
              SizedBox(height: 20.px),
              const Divider(),
              SizedBox(height: 20.px),
              appText('Payment Method', fontWeight: FontWeight.bold, fontSize: 20.px),
              SizedBox(height: 20.px),
              Row(
                spacing: 4,
                children: [
                  appText('Cash after service',
                      color: AppColors.blueColor, fontSize: 16.px, fontWeight: FontWeight.bold),
                  const Spacer(),
                  appText('Status:', color: AppColors.hintGrey, fontSize: 16.px),
                  SizedBox(height: 10.px),
                  CustomContainer(
                      height: 24.px,
                      width: 76.px,
                      borderRadius: 6.px,
                      color: AppColors.redColor,
                      child: Center(child: appText('Unpaid', color: AppColors.whiteTheme, fontWeight: FontWeight.w400)))
                ],
              ),
              SizedBox(height: 10.px),
              Row(
                children: [
                  appText('Amount : ', fontWeight: FontWeight.bold, fontSize: 16.px, color: AppColors.hintGrey),
                  appText(' Rs. 47627', fontWeight: FontWeight.bold, fontSize: 16.px),
                ],
              ),
              SizedBox(height: 20.px),
              div(),
              SizedBox(height: 20.px),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText('Professional', fontSize: 20.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 20.px),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UserDetailScreen()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.px,
                      children: [
                        CircleAvatar(
                            radius: 40.px,
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
                                    child: appText('Muzammil Amjad', fontSize: 16.px, fontWeight: FontWeight.bold)),
                                CustomContainer(
                                    color: AppColors.blueColor,
                                    borderRadius: 8.px,
                                    child: Padding(
                                        padding: EdgeInsets.all(6.px),
                                        child: Center(
                                            child: appText('Assigned',
                                                color: AppColors.whiteTheme,
                                                fontSize: 16.px,
                                                fontWeight: FontWeight.w400)))),
                              ],
                            ),
                            Row(
                              spacing: 6.px,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18.px,
                                  color: AppColors.hintGrey,
                                ),
                                appText('4.86',
                                    fontSize: 16.px, fontWeight: FontWeight.w400, color: AppColors.hintGrey),
                              ],
                            ),
                            SizedBox(height: 4.px),
                            Row(
                              children: [appText('Completed jobs: 15', fontSize: 16.px, fontWeight: FontWeight.w400)],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: 20.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                          width: 100.px,
                          borderRadius: 6.px,
                          color: AppColors.transparentColor,
                          borderColor: AppColors.hintGrey,
                          child: Padding(
                            padding: EdgeInsets.all(2.px),
                            child: Row(
                              spacing: 4.px,
                              children: [
                                Image.asset('assets/images/checkmark.png', height: 22.px, color: AppColors.greenColor),
                                appText('Verified', color: AppColors.greenColor, fontWeight: FontWeight.w400)
                              ],
                            ),
                          )),
                      Row(
                        spacing: 20.px,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
                              },
                              child: CircleAvatar(
                                  backgroundColor: AppColors.grey300.withOpacity(0.5),
                                  child: Image.asset('assets/images/chat.png',
                                      height: 22.px, color: AppColors.blueColor))),
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
              SizedBox(height: 20.px),
              div(),
              SizedBox(height: 20.px),
              appText('Booking Summary', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 30.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Service Info', fontSize: 18.px, fontWeight: FontWeight.bold),
                  appText('Service Cost', fontSize: 18.px, fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 20.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Bridal Makeover', fontSize: 16.px, fontWeight: FontWeight.bold),
                  appText('Rs. 40,000', fontSize: 16.px, fontWeight: FontWeight.bold)
                ],
              ),
              SizedBox(height: 8.px),
              row(text: 'Bridal Makeover x 1'),
              SizedBox(height: 6.px),
              row(text: 'Unit price: Rs.30,000'),

              SizedBox(height: 40.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Party Makeup', fontSize: 16.px, fontWeight: FontWeight.bold),
                  appText('Rs. 40,000', fontSize: 16.px, fontWeight: FontWeight.bold)
                ],
              ),
              SizedBox(height: 8.px),
              row(text: 'Bridal Makeover x 1'),
              SizedBox(height: 6.px),
              row(text: 'Unit price: Rs.30,000'),

              SizedBox(height: 10.px),
              const Divider(),
              SizedBox(height: 10.px),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('SubTotal', fontSize: 16.px, fontWeight: FontWeight.bold),
                  appText('Rs. 1900', fontSize: 16.px, fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 40.px),
              subTotalRow(text1: 'Service discount', text2: '(-) Rs. 0.00'),
              SizedBox(height: 10.px),
              subTotalRow(text1: 'Coupon discount', text2: '(-) Rs. 499.00'),
              SizedBox(height: 10.px),
              subTotalRow(text1: 'Campaign discount', text2: '(-) Rs. 499.00'),
              SizedBox(height: 10.px),
              subTotalRow(text1: 'Taxes', text2: '(+) Rs. 499.00'),
              SizedBox(height: 10.px),
              const Divider(),
              SizedBox(height: 10.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Grand Total', color: AppColors.blueShade, fontWeight: FontWeight.bold, fontSize: 18.px),
                  appText('Rs. 49,000', color: AppColors.blueShade, fontWeight: FontWeight.bold, fontSize: 18.px),
                ],
              ),
              SizedBox(height: 40.px),
              Row(
                children: [
                  const Icon(Icons.info_outline, color: AppColors.blackColor),
                  SizedBox(width: 8.px),
                  Expanded(
                      child: appText(
                    "Free cancellation till 2 hrs before the booked slot, post that Rs.50 chargeable",
                  )),
                ],
              ),
              SizedBox(height: 20.px),
// Reschedule and cancel booking buttons
              Center(
                child: CustomContainer(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RefundScreen()));
                    },
                    height: 40.px,
                    width: 150.px,
                    color: AppColors.lowPurple.withOpacity(0.2),
                    borderColor: AppColors.lowPurple,
                    child: Center(
                        child: appText('Refund',
                            fontSize: 16.px, color: AppColors.lowPurple, fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 30.px),
            ],
          ),
        ),
      ),
    );
  }
}

// SubTotal Section common row
Widget subTotalRow({
  required String text1,
  required String text2,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      appText(text1, color: AppColors.hintGrey, fontSize: 16.px),
      appText(text2, color: AppColors.hintGrey, fontSize: 16.px),
    ],
  );
}

//
Widget stepWidget(String title, bool isActive) {
  return Column(
    children: [
      Container(
          width: 26.px,
          height: 26.px,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isActive ? AppColors.greenColor : AppColors.greyColor, width: 2.px),
              color: isActive ? AppColors.greenColor : AppColors.whiteTheme),
          child: Center(child: isActive ? Icon(Icons.check, color: AppColors.whiteTheme, size: 16.px) : Container())),
      SizedBox(height: 8.px),
      appText(title,
          color: isActive ? AppColors.greenColor : AppColors.greyColor, fontWeight: FontWeight.bold, fontSize: 11.px),
    ],
  );
}

Widget stepConnector(bool isActive) {
  return Row(
    spacing: 2.px,
    children: [
      Container(
          margin: EdgeInsets.only(bottom: 20.px),
          height: 2.px,
          width: 20.px,
          color: isActive ? Colors.green : AppColors.greyColor),
      Container(
          margin: EdgeInsets.only(bottom: 20.px),
          height: 2.px,
          width: 20.px,
          color: isActive ? Colors.green : Colors.grey),
    ],
  );
}

// Widget
Widget bookingRow({
  required String text1,
  required String text2,
}) {
  return Row(
    children: [
      SizedBox(width: 140.px, child: appText('$text1:', fontSize: 15.px, color: AppColors.hintGrey)),
      SizedBox(width: 40.px),
      appText(text2, fontSize: 15.px, fontWeight: FontWeight.bold),
    ],
  );
}

// row
Widget row({required String text}) {
  return Row(
    children: [
      Icon(Icons.circle, size: 6.px),
      SizedBox(width: 8.px),
      appText(text, color: AppColors.hintGrey, fontSize: 16.px),
    ],
  );
}
