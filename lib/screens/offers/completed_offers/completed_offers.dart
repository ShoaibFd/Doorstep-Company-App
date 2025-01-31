import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/divider.dart';
import 'completed_order_summary.dart';
import 'offer_status_screen.dart';

class CompletedOffers extends StatefulWidget {
  const CompletedOffers({super.key});

  @override
  State<CompletedOffers> createState() => _CompletedOffersState();
}

class _CompletedOffersState extends State<CompletedOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.px),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CompletedOrderSummary()));
                    },
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 10.px),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                appText('DC Store', fontWeight: FontWeight.bold),
                                appText('Cancelled',
                                    fontWeight: FontWeight.bold, color: AppColors.blueColor, fontSize: 16.px),
                              ],
                            ),
                            SizedBox(height: 12.px),
                            CustomContainer(
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const OfferStatusScreen()));
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
                            SizedBox(height: 40.px),
                            Row(
                              spacing: 10.px,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                appText('Total(1 item):', color: AppColors.lightBlack),
                                appText('Rs.799', fontSize: 16.px, fontWeight: FontWeight.bold),
                              ],
                            ),
                            SizedBox(height: 30.px),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomContainer(
                                    onTap: () {},
                                    borderRadius: 4,
                                    color: AppColors.transparentColor,
                                    width: 110.px,
                                    borderColor: AppColors.grey300,
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Center(
                                            child: appText('Return/Refund',
                                                color: AppColors.grey300, fontWeight: FontWeight.bold)))),
                                const SizedBox(width: 10),
                                CustomContainer(
                                    onTap: () {},
                                    borderRadius: 4,
                                    color: AppColors.deepOrangeColor,
                                    width: 90.px,
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Center(
                                            child: appText('Buy again',
                                                color: AppColors.whiteTheme, fontWeight: FontWeight.bold)))),
                              ],
                            ),
                            SizedBox(height: 10.px),
                            div(),
                            SizedBox(height: 10.px),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
