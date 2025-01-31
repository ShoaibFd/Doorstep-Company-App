import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import 'active_orders_screen.dart';
import 'completed_offers.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isAll = true;
  bool isActive = false;
  bool isCompleted = false;
  bool isCancelled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.px),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 8.px),
                    CustomContainer(
                      onTap: () {
                        setState(() {
                          isAll = true;
                          isActive = false;
                          isCompleted = false;
                          isCancelled = false;
                        });
                      },
                      color: isAll ? AppColors.blueColor : AppColors.transparentColor,
                      borderRadius: 30.px,
                      borderColor: isAll ? AppColors.transparentColor : AppColors.grey300,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 8.px),
                        child: Center(
                          child: appText(
                            'All Orders',
                            color: isAll ? AppColors.whiteTheme : AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.px),
                    CustomContainer(
                      onTap: () {
                        setState(() {
                          isAll = false;
                          isActive = true;
                          isCompleted = false;
                          isCancelled = false;
                        });
                      },
                      color: isActive ? AppColors.blueColor : AppColors.transparentColor,
                      borderRadius: 30.px,
                      borderColor: isActive ? AppColors.transparentColor : AppColors.grey300,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 8.px),
                        child: Center(
                          child: appText(
                            'Active',
                            color: isActive ? AppColors.whiteTheme : AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.px),
                    CustomContainer(
                      onTap: () {
                        setState(() {
                          isAll = false;
                          isActive = false;
                          isCompleted = true;
                          isCancelled = false;
                        });
                      },
                      color: isCompleted ? AppColors.blueColor : AppColors.transparentColor,
                      borderRadius: 30.px,
                      borderColor: isCompleted ? AppColors.transparentColor : AppColors.grey300,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 8.px),
                        child: Center(
                          child: appText(
                            'Completed',
                            color: isCompleted ? AppColors.whiteTheme : AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.px),
                    CustomContainer(
                      onTap: () {
                        setState(() {
                          isAll = false;
                          isActive = false;
                          isCompleted = false;
                          isCancelled = true;
                        });
                      },
                      color: isCancelled ? AppColors.blueColor : AppColors.transparentColor,
                      borderRadius: 30.px,
                      borderColor: isCancelled ? AppColors.transparentColor : AppColors.grey300,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 8.px),
                        child: Center(
                          child: appText(
                            'Cancelled',
                            color: isCancelled ? AppColors.whiteTheme : AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.px),
                  ],
                ),
              ),
            ),
            Expanded(
              child: isActive ? const ActiveOrdersScreen() : const CompletedOffers(),
            ),
          ],
        ),
      ),
    );
  }
}
