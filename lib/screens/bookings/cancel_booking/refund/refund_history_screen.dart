import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../components/custom_container.dart';
import '../../../../components/app_text.dart';

class RefundHistoryScreen extends StatelessWidget {
  const RefundHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: appText('25 Jan 2023', fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    CustomContainer(
                        margin: const EdgeInsets.only(bottom: 10),
                        color: AppColors.transparentColor,
                        borderColor: AppColors.lowPurple,
                        child: Column(
                          children: [
                            CustomContainer(
                              borderRadius: 0,
                              borderColor: AppColors.grey300,
                              color: AppColors.lowPurple.withOpacity(0.2),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    appText('Account Details', fontWeight: FontWeight.bold),
                                    appText('Transaction ID', fontWeight: FontWeight.bold),
                                    appText('Refunded Amount', fontWeight: FontWeight.bold),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      appText('UBL Bosan Road\nBranch Multan\n'),
                                      SizedBox(width: 14.px),
                                      appText('#68576678'),
                                      SizedBox(width: 80.px),
                                      appText('Rs.450', fontWeight: FontWeight.bold, color: AppColors.darkGreen),
                                    ],
                                  ),
                                  SizedBox(height: 20.px),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      appText('Account title:', fontWeight: FontWeight.bold),
                                      appText(
                                        'Talha Ashraf:',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      appText('Account No#:', fontWeight: FontWeight.bold),
                                      appText(
                                        '568736482826:',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
