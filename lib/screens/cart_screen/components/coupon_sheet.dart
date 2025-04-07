import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import 'terms_and_conditions_sheet.dart';

void couponBottomSheet(BuildContext context) {
  final voucherController = TextEditingController();
  bool isApplied = false;

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isScrollControlled: true,
    isDismissible: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 14.px,
              right: 14.px,
              top: 10.px,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10.px,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.px),
                      appText('Coupons and offers', fontSize: 18.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 20.px),
                      TextFormField(
                          textCapitalization: TextCapitalization.characters,
                          controller: voucherController,
                          onChanged: (value) => setState(() {}),
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: voucherController.text.isNotEmpty
                                    ? () {
                                        setState(() {
                                          isApplied = true;
                                          Navigator.pop(context);
                                          voucherController.clear();
                                        });
                                      }
                                    : null,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 13, right: 10),
                                  child: appText(
                                    'Apply',
                                    color: voucherController.text.isEmpty ? AppColors.hintGrey : AppColors.lowPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.px,
                                  ),
                                ),
                              ),
                              hintText: 'Enter voucher code',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: AppColors.grey300)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: AppColors.grey300)))),
                      SizedBox(height: 30.px),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomContainer(
                            height: 70.px,
                            width: 70.px,
                            borderRadius: 6.px,
                            color: AppColors.grey300,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/service.png'),
                              fit: BoxFit.cover,
                            ),
                            child: const SizedBox(),
                          ),
                          SizedBox(width: 20.px),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText('100% cashback on 1st booking', fontSize: 16, fontWeight: FontWeight.bold),
                              const SizedBox(height: 10),
                              appText('Use Code: DC100', color: AppColors.hintGrey),
                              const SizedBox(height: 10),
                              appText('SAVE RS 100 ON THIS ORDER',
                                  color: AppColors.darkGreen, fontSize: 12, fontWeight: FontWeight.bold),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => showTermsAndConditionsBottomSheet(context),
                                child: appText('View T&C', color: AppColors.lowPurple, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
                Positioned(
                  top: -60.px,
                  right: 16.px,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: AppColors.whiteTheme,
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
