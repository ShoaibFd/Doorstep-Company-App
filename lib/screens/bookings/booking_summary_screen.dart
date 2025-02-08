import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app_controllers/booking_controller.dart';
import '../../components/custom_container.dart';
import '../../components/custom_text.dart';
import '../../constants/colors.dart';
import 'cancel_booking/cancel_booking_screen.dart';
import 'claim_screens/claim_screen.dart';
import 'completed_bookings/bookings_screen.dart';
import 'completed_bookings/completed_booking_screen.dart';
import 'components/quotation_bottom_sheet.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingController controller = Get.put(BookingController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showQuotationBottomSheet(context);
    });

    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: appText("Bookings Status", fontWeight: FontWeight.bold, fontSize: 20.px)),
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8.px,
                    children: [
                      bookings(
                        onTap: () => controller.selectStatus('Bookings'),
                        bookingText: 'Bookings',
                        textColor: controller.isBooking.value ? AppColors.whiteTheme : AppColors.blackColor,
                        icon: Icons.event,
                        color: controller.isBooking.value ? AppColors.blueColor : AppColors.transparentColor,
                        iconColor: controller.isBooking.value ? AppColors.whiteTheme : AppColors.blackColor,
                        borderColor: controller.isBooking.value ? AppColors.transparentColor : AppColors.grey300,
                      ),
                      bookings(
                        onTap: () => controller.selectStatus('Completed'),
                        bookingText: 'Completed',
                        icon: Icons.check_circle,
                        color: controller.isCompleted.value ? AppColors.blueColor : AppColors.transparentColor,
                        textColor: controller.isCompleted.value ? AppColors.whiteTheme : AppColors.blackColor,
                        iconColor: controller.isCompleted.value ? AppColors.whiteTheme : AppColors.blackColor,
                        borderColor: controller.isCompleted.value ? AppColors.transparentColor : AppColors.grey300,
                      ),
                      bookings(
                        onTap: () => controller.selectStatus('Cancel'),
                        bookingText: 'Cancel',
                        icon: Icons.cancel,
                        color: controller.isCancelled.value ? AppColors.blueColor : AppColors.transparentColor,
                        textColor: controller.isCancelled.value ? AppColors.whiteTheme : AppColors.blackColor,
                        iconColor: controller.isCancelled.value ? AppColors.whiteTheme : AppColors.blackColor,
                        borderColor: controller.isCancelled.value ? AppColors.transparentColor : AppColors.grey300,
                      ),
                      bookings(
                        onTap: () => controller.selectStatus('Warranty'),
                        bookingText: 'Warranty',
                        icon: Icons.receipt_long,
                        color: controller.isClaimed.value ? AppColors.blueColor : AppColors.transparentColor,
                        textColor: controller.isClaimed.value ? AppColors.whiteTheme : AppColors.blackColor,
                        iconColor: controller.isClaimed.value ? AppColors.whiteTheme : AppColors.blackColor,
                        borderColor: controller.isClaimed.value ? AppColors.transparentColor : AppColors.grey300,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.px),
                Expanded(
                  child: Obx(() {
                    if (controller.isBooking.value) {
                      return const BookingScreen();
                    } else if (controller.isCompleted.value) {
                      return const CompletedBookingScreen();
                    } else if (controller.isCancelled.value) {
                      return const CancelBookingScreen();
                    } else {
                      return const ClaimScreen();
                    }
                  }),
                ),
              ],
            ),
          );
        }));
  }
}

Widget bookings({
  void Function()? onTap,
  Color? color,
  Color? iconColor,
  Color? textColor,
  required String bookingText,
  Color? borderColor,
  IconData? icon,
}) {
  return CustomContainer(
    onTap: onTap,
    height: 36.px,
    width: 120.px,
    borderColor: borderColor ?? AppColors.grey300,
    color: color ?? AppColors.blueColor,
    borderRadius: 8.px,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          color: iconColor ?? AppColors.whiteTheme,
        ),
        appText(bookingText, color: textColor ?? AppColors.whiteTheme, fontWeight: FontWeight.bold),
      ],
    ),
  );
}
