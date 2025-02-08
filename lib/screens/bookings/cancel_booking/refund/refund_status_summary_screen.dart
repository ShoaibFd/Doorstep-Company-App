import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../components/custom_container.dart';
import '../../../../components/custom_text.dart';

class RefundStatusSummaryScreen extends StatefulWidget {
  const RefundStatusSummaryScreen({super.key});

  @override
  _RefundStatusSummaryScreenState createState() => _RefundStatusSummaryScreenState();
}

class _RefundStatusSummaryScreenState extends State<RefundStatusSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 80,
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return CustomContainer(
                            color: AppColors.transparentColor,
                            borderColor: AppColors.lowPurple,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  appText('Your refund is', fontWeight: FontWeight.bold),
                                  CustomContainer(
                                      height: 30.px,
                                      width: 100.px,
                                      borderColor: AppColors.lowPurple,
                                      borderRadius: 40.px,
                                      color: AppColors.lowPurple.withOpacity(0.1),
                                      child: Center(
                                          child: appText('In Progress',
                                              color: AppColors.lowPurple, fontWeight: FontWeight.bold)))
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                appText('History', fontSize: 18.px, fontWeight: FontWeight.bold),
                Expanded(
                    child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: appText('25 Feb, 2025'),
                        ),
                        const SizedBox(height: 6),
                        Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.lowPurple)),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Refund ID#'),
                                        appText(' 5646756473'),
                                        CustomContainer(
                                            height: 30.px,
                                            width: 100.px,
                                            borderColor: AppColors.darkGreen,
                                            borderRadius: 40.px,
                                            color: AppColors.darkGreen,
                                            child: Center(
                                                child: appText('Completed',
                                                    color: AppColors.whiteTheme, fontWeight: FontWeight.bold))),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Amount claimed for refund', fontSize: 15, fontWeight: FontWeight.bold),
                                        appText('Rs. 500', fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Deductions', fontSize: 15, fontWeight: FontWeight.bold),
                                        appText('Rs. 100', fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                    const Divider(),
                                    const SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Amount Refunded', fontSize: 15, fontWeight: FontWeight.bold),
                                        appText('Rs. 450', fontWeight: FontWeight.bold)
                                      ],
                                    )
                                  ],
                                ))),
                      ],
                    );
                  },
                )),
              ],
            )));
  }
}
