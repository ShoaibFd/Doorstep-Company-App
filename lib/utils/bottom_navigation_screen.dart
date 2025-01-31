import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_controllers/bottom_nav_bar_controller.dart';
import '../constants/colors.dart';
import '../screens/account_screen/account_screen.dart';
import '../screens/bookings/booking_summary_screen.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/offers/offers_tabbar_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  final double? latitude;
  final double? longitude;

  const BottomNavigationScreen({
    super.key,
    this.latitude,
    this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());

    final List<Widget> screens = [
      HomeScreen(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0),
      const BookingSummaryScreen(),
      const ChatScreen(),
      const OffersTabbarScreen(),
      const AccountScreen(),
    ];

    return Scaffold(
        body: Obx(() => screens[controller.selectedIndex.value]),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.whiteTheme,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
            ),
            BottomNavigationBar(
                items: [
                  const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'DC'),
                  const BottomNavigationBarItem(icon: Icon(Icons.fact_check_outlined), label: 'Booking'),
                  BottomNavigationBarItem(
                      icon: Image.asset('assets/images/chat.png',
                          height: 24,
                          color: controller.selectedIndex.value == 2 ? AppColors.blackColor : AppColors.hintGrey),
                      label: "Chat"),
                  const BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Offers'),
                  const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
                ],
                currentIndex: controller.selectedIndex.value,
                selectedItemColor: AppColors.blackColor,
                elevation: 0,
                unselectedItemColor: AppColors.hintGrey,
                backgroundColor: AppColors.whiteTheme,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                onTap: controller.changeIndex)
          ],
        ));
  }
}
