import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_text.dart';

// ignore: must_be_immutable
class CoinsToRupeesScreen extends StatelessWidget {
  CoinsToRupeesScreen({super.key});

  List price = ['1000', '2,500', '5,000'];
  List coin = ['40', '1,00', '200'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Coin to Rupees', fontSize: 20, fontWeight: FontWeight.bold)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CustomContainer(
                height: 40.px,
                width: double.maxFinite,
                borderRadius: 6,
                color: AppColors.lowPurple.withOpacity(0.2),
                child: Center(child: appText('How it works', fontSize: 20, fontWeight: FontWeight.bold))),
            SizedBox(height: 10.px),
            workingRow(serialText: '1', descText: 'Place order to get coins'),
            workingRow(serialText: '2', descText: 'Redeem coins by converting them\ninto cash'),
            workingRow(serialText: '3', descText: 'Cash is in the wallet. Use it for getting\nservices.'),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: double.maxFinite,
                    decoration:
                        BoxDecoration(color: AppColors.whiteTheme, borderRadius: BorderRadius.circular(10), boxShadow: [
                      BoxShadow(offset: const Offset(1, 1), blurRadius: 1, color: AppColors.grey300, spreadRadius: 1)
                    ]),
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    appText('Earn ', fontSize: 16),
                                    appText("${price[index]} coins", fontWeight: FontWeight.bold, fontSize: 16),
                                  ],
                                ),
                                Row(
                                  children: [
                                    appText('to get', fontSize: 16),
                                    appText(' Rs.${coin[index]}',
                                        fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.darkGreen),
                                  ],
                                ),
                              ],
                            ),
                            leading: const Icon(Icons.emoji_events_outlined, color: AppColors.redColor, size: 40))));
              },
            )
          ],
        ),
      ),
    );
  }
}

// Working RowWidget
Widget workingRow({
  required String serialText,
  required String descText,
}) {
  return Row(
    children: [
      CircleAvatar(
          radius: 12, backgroundColor: AppColors.blackColor, child: appText(serialText, color: AppColors.whiteTheme)),
      SizedBox(width: 12.px),
      appText(descText, fontSize: 18)
    ],
  );
}
