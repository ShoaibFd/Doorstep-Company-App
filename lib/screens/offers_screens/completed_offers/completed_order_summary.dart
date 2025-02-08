import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_text.dart';
import '../../../components/divider.dart';
import '../../home_screen/professional_rating_bottom_sheet.dart';
import 'offer_status_screen.dart';
import 'warranty_screen.dart';

class CompletedOrderSummary extends StatelessWidget {
  const CompletedOrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Order Details', fontSize: 20.px, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 10.px,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('DC Store', fontWeight: FontWeight.bold),
                  appText('Cancelled', fontWeight: FontWeight.bold, color: AppColors.blueColor, fontSize: 16.px),
                ],
              ),
              SizedBox(height: 12.px),
              CustomContainer(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OfferStatusScreen()));
                  },
                  color: AppColors.transparentColor,
                  borderColor: AppColors.lowPurple,
                  borderRadius: 6,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/delivery.png',
                      height: 40,
                    ),
                    title: appText(
                        '06 Jan-Yay! Your order has been delivered,we hope you like it! Tap here to share a..',
                        fontSize: 12),
                    trailing: const Icon(Icons.chevron_right),
                  )),
              SizedBox(height: 12.px),
              div(),
              Row(
                children: [
                  Icon(Icons.place_outlined, color: AppColors.darkGreen, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText('Saqlain Sarfraz', fontSize: 18, fontWeight: FontWeight.bold),
                            appText('03026545728', color: AppColors.hintGrey),
                          ],
                        ),
                        const SizedBox(height: 6),
                        appText('Bosan Road Multan, Sabzazar, Colony Bosan Road Multan, Sabzazar, Colony',
                            color: AppColors.hintGrey)
                      ],
                    ),
                  ),
                ],
              ),
              div(),
              Row(
                children: [
                  CustomContainer(
                    height: 80.px,
                    width: 80.px,
                    borderRadius: 6.px,
                    color: AppColors.grey300,
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/primary/ProductShowcasesampleimages/JPEG/Product+Showcase-1.jpg'),
                    ),
                    child: const SizedBox(),
                  ),
                  SizedBox(width: 10.px),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText(
                          'Origional Beanie shoes Warmer For\nMen/Women Beanie Full Set-2 piece,...',
                          color: AppColors.hintGrey,
                        ),
                        SizedBox(height: 6.px),
                        CustomContainer(
                          color: AppColors.grey300.withOpacity(0.5),
                          borderRadius: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Center(
                              child: appText(
                                'Color Family: Wine Red, Size: Int: One Size',
                                fontSize: 12.px,
                                color: AppColors.hintGrey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.px), // Added spacing
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
              // SizedBox(height: 10.px),
              Row(
                spacing: 10.px,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  appText('Total(1 item):', color: AppColors.lightBlack),
                  appText('Rs.799', fontSize: 16.px, fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 10.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomContainer(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WarrantyScreen()));
                      },
                      borderRadius: 4,
                      color: AppColors.transparentColor,
                      width: 110.px,
                      borderColor: AppColors.grey300,
                      child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(child: appText('Warranty', fontWeight: FontWeight.bold)))),
                  const SizedBox(width: 10),
                  CustomContainer(
                      onTap: () {
                        showProfessionalRatingBottomSheet(context);
                      },
                      borderRadius: 4,
                      color: AppColors.deepOrangeColor,
                      width: 110.px,
                      child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                              child: appText('Write a review',
                                  color: AppColors.whiteTheme, fontWeight: FontWeight.bold)))),
                ],
              ),
              SizedBox(height: 10.px),
              div(),
              SizedBox(height: 10.px),

              // Summary Rows
              summaryRow(text1: 'Subtotal (1 item)', text2: 'Rs. 799'),
              summaryRow(text1: 'Shipping Fee', text2: 'Rs. 799'),
              summaryRow(text1: 'Total', text2: 'Rs. 799', fontWeight: FontWeight.bold),
              const Divider(),
              appText('Payment method', fontWeight: FontWeight.bold),
              summaryRow(text1: 'Jazzcash', text2: 'Rs.900'),
              const Divider(),
              Row(
                children: [
                  appText('Order No.', fontWeight: FontWeight.bold),
                  const Spacer(),
                  appText('32174675752153721', fontWeight: FontWeight.bold),
                  SizedBox(width: 4.px),
                  InkWell(
                    onTap: () {
                      // Add copy functionality here
                    },
                    child: appText('Copy', color: AppColors.blueColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6.px),
              summaryRow(text1: 'Placed on', text2: '03 Jan 2025  15:09:15'),
              summaryRow(text1: 'Paid on', text2: '03 Jan 2025  15:09:15'),
              summaryRow(text1: 'Delivered on', text2: '03 Jan 2025  15:09:15'),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

// Summary Row
Widget summaryRow({
  required String text1,
  required String text2,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      appText(text1, fontSize: fontSize ?? 14, fontWeight: fontWeight ?? FontWeight.normal),
      appText(text2),
    ],
  );
}
