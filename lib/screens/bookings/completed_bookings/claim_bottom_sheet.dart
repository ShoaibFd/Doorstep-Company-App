import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/round_button.dart';
import '../claim_screens/claim_completed_screen.dart';

void showClaimBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the bottom sheet to resize with the keyboar
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    isDismissible: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Describe your issue',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.px),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: roundButton(
                        onTap: () {
                          showSuccessSnackbar(context, '');
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const ClaimCompletedScreen()));
                        },
                        height: 40.px,
                        width: 100.px,
                        title: 'Claim',
                        color: AppColors.greenColor,
                      ),
                    ),
                    SizedBox(height: 10.px),
                  ],
                ),
              ),
            ),
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
        ),
      );
    },
  );
}
