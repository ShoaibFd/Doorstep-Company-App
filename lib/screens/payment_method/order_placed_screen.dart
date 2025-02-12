import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../utils/bottom_navigation_screen.dart';
import '../../components/custom_container.dart';
import '../../components/app_text.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

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
            appText('Booking Accepted', fontSize: 18, color: AppColors.darkGreen, fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            appText("For further updates or rescheduling, please see", textAlign: TextAlign.center, fontSize: 16),
            const SizedBox(height: 8),
            Center(
              child: appText("'Booking' section.", fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 30),
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
