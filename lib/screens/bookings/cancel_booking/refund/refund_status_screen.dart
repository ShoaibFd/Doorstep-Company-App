import 'package:doorstep_company_app/screens/bookings/cancel_booking/refund/refund_initiated_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/app_text.dart';
import '../../../../components/custom_container.dart';
import '../../../../theme/colors.dart';
import 'refund_history_screen.dart';
import 'refund_status_summary_screen.dart';

class RefundStatusScreen extends StatelessWidget {
  const RefundStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RefundStatusController());

    return Scaffold(
      appBar: AppBar(title: appText('Refund', fontSize: 18.sp, fontWeight: FontWeight.bold)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() => CustomContainer(
                    onTap: () => controller.updateStatus(refund: true, status: false, history: false),
                    height: 36.h,
                    width: 93.w,
                    borderColor: controller.isRefund.value ? AppColors.transparentColor : AppColors.grey300,
                    color: controller.isRefund.value ? AppColors.blueColor : AppColors.transparentColor,
                    borderRadius: 10.r,
                    child: Center(
                        child: appText('Refund',
                            color: controller.isRefund.value ? AppColors.whiteTheme : AppColors.blackColor,
                            fontWeight: FontWeight.bold)),
                  )),
              Obx(() => CustomContainer(
                    onTap: () => controller.updateStatus(refund: false, status: true, history: false),
                    height: 36.h,
                    width: 93.w,
                    borderColor: controller.isStatus.value ? AppColors.transparentColor : AppColors.grey300,
                    color: controller.isStatus.value ? AppColors.blueColor : AppColors.transparentColor,
                    borderRadius: 10.r,
                    child: Center(
                        child: appText('Status',
                            color: controller.isStatus.value ? AppColors.whiteTheme : AppColors.blackColor,
                            fontWeight: FontWeight.bold)),
                  )),
              Obx(() => CustomContainer(
                    onTap: () => controller.updateStatus(refund: false, status: false, history: true),
                    height: 36.h,
                    width: 93.w,
                    borderColor: controller.isHistory.value ? AppColors.transparentColor : AppColors.grey300,
                    color: controller.isHistory.value ? AppColors.blueColor : AppColors.transparentColor,
                    borderRadius: 10.r,
                    child: Center(
                        child: appText('Transaction\nDetails',
                            color: controller.isHistory.value ? AppColors.whiteTheme : AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center)),
                  )),
            ],
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Obx(() => controller.isRefund.value
                ? const RefundInitiatedScreen()
                : controller.isStatus.value
                    ? const RefundStatusSummaryScreen()
                    : const RefundHistoryScreen()),
          )
        ],
      ),
    );
  }
}

// Refund Status controller
class RefundStatusController extends GetxController {
  var isRefund = true.obs;
  var isStatus = false.obs;
  var isHistory = false.obs;

  void updateStatus({required bool refund, required bool status, required bool history}) {
    isRefund.value = refund;
    isStatus.value = status;
    isHistory.value = history;
  }
}
