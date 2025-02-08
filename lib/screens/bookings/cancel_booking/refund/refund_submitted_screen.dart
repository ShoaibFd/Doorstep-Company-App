import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/bottom_navigation_screen.dart';
import '../../../../components/custom_container.dart';
import '../../../../components/custom_text.dart';

class RefundSubmittedScreen extends StatelessWidget {
  const RefundSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: AppColors.darkGreen, size: 40),
            const SizedBox(height: 6),
            appText('Refund Initiated', fontSize: 18, color: AppColors.darkGreen, fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black), // Default text style
                children: <TextSpan>[
                  TextSpan(text: "For updates, kindly see '", style: TextStyle(fontWeight: FontWeight.normal)),
                  TextSpan(text: "Refund", style: TextStyle(fontWeight: FontWeight.bold)), // Bold text
                  TextSpan(text: "' sheet in the", style: TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: appText("'Account' section.", fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 50),
            Center(
                child: CustomContainer(
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => const BottomNavigationScreen()));
                    },
                    height: 40.px,
                    width: 150.px,
                    color: AppColors.lowPurple.withOpacity(0.2),
                    borderColor: AppColors.blackColor,
                    child: Center(
                        child: appText('Go to Home',
                            fontSize: 16.px, color: AppColors.lowPurple, fontWeight: FontWeight.bold)))),
          ],
        ),
      ),
    );
  }
}
