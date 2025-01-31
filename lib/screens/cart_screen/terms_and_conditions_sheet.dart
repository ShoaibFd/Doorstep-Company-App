import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/round_button.dart';

void showTermsAndConditionsBottomSheet(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isDismissible: true,
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(8.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.px),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText('Terms And Conditions', fontWeight: FontWeight.bold, fontSize: 16),
                            SizedBox(height: 50.px),
                            termsRow(text: 'Valid for new user only'),
                            SizedBox(height: 10.px),
                            termsRow(text: 'Cashback will be transferred within 24 hours of\nservice being delivered.'),
                            SizedBox(height: 10.px),
                            termsRow(text: 'Cashback credits are valid for 60 days'),
                            SizedBox(height: 10.px),
                            termsRow(text: 'This code is not applicable on subscription/plan\nbookings'),
                            SizedBox(height: 10.px),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.px),
                        child: roundButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: 'Okay! got it'),
                      )
                    ],
                  ))),
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

Widget termsRow({required String text}) {
  return Row(
    spacing: 26.px,
    children: [const Icon(Icons.circle, size: 8), appText(text, color: AppColors.lightBlack)],
  );
}
