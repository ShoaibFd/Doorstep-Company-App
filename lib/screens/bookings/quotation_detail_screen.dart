import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/custom_text.dart';
import 'bookings_detail_screen.dart';

class QuotationDetailScreen extends StatelessWidget {
  const QuotationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Quotation Details', fontSize: 20.px, fontWeight: FontWeight.bold)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.px),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText('Service Info', fontSize: 18.px, fontWeight: FontWeight.bold, color: AppColors.blueColor),
                appText('Service Cost', fontSize: 18.px, fontWeight: FontWeight.bold, color: AppColors.blueColor),
              ],
            ),
            SizedBox(height: 20.px),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText('Bridal Makeover', fontSize: 16.px, fontWeight: FontWeight.bold),
                appText('Rs. 40,000', fontSize: 16.px)
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
                appText('Rs. 40,000', fontSize: 16.px)
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
                appText('Sub-Total', fontSize: 16.px, fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    );
  }
}

//
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
