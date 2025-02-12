import 'package:doorstep_company_app/screens/bookings/cancel_booking/refund/refund_initiated_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../components/custom_container.dart';
import '../../../../components/app_text.dart';
import 'refund_history_screen.dart';
import 'refund_status_summary_screen.dart';

class RefundStatusScreen extends StatefulWidget {
  const RefundStatusScreen({super.key});

  @override
  State<RefundStatusScreen> createState() => _RefundStatusScreenState();
}

class _RefundStatusScreenState extends State<RefundStatusScreen> {
  bool isRefund = true;
  bool isStatus = false;
  bool isHistory = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Refund', fontSize: 20.px, fontWeight: FontWeight.bold)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                  onTap: () {
                    setState(() {
                      isRefund = true;
                      isStatus = false;
                      isHistory = false;
                    });
                  },
                  height: 40.px,
                  width: 100.px,
                  borderColor: isRefund ? AppColors.transparentColor : AppColors.grey300,
                  color: isRefund ? AppColors.blueColor : AppColors.transparentColor,
                  borderRadius: 10.px,
                  child: Center(
                      child: appText('Refund',
                          color: isRefund ? AppColors.whiteTheme : AppColors.blackColor, fontWeight: FontWeight.bold))),
              CustomContainer(
                  onTap: () {
                    setState(() {
                      isRefund = false;
                      isStatus = true;
                      isHistory = false;
                    });
                  },
                  height: 40.px,
                  width: 100.px,
                  borderColor: isStatus ? AppColors.transparentColor : AppColors.grey300,
                  color: isStatus ? AppColors.blueColor : AppColors.transparentColor,
                  borderRadius: 10.px,
                  child: Center(
                      child: appText('Status',
                          color: isStatus ? AppColors.whiteTheme : AppColors.blackColor, fontWeight: FontWeight.bold))),
              CustomContainer(
                  onTap: () {
                    setState(() {
                      isRefund = false;
                      isStatus = false;
                      isHistory = true;
                    });
                  },
                  height: 40.px,
                  width: 100.px,
                  borderColor: isHistory ? AppColors.transparentColor : AppColors.grey300,
                  color: isHistory ? AppColors.blueColor : AppColors.transparentColor,
                  borderRadius: 10.px,
                  child: Center(
                      child: appText('Transaction\nDetails',
                          color: isHistory ? AppColors.whiteTheme : AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center))),
            ],
          ),
          SizedBox(height: 10.px),
          Expanded(
            child: isRefund
                ? const RefundInitiatedScreen()
                : isStatus
                    ? const RefundStatusSummaryScreen()
                    : const RefundHistoryScreen(),
          )
        ],
      ),
    );
  }
}
