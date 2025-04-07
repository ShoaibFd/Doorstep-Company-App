import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/app_text.dart';
import '../../../components/custom_container.dart';
import '../../../theme/colors.dart';
import 'active_orders_screen.dart';
import 'completed_offers.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 8.w),
                    categoryButton(controller, 'All Orders'),
                    categoryButton(controller, 'Active'),
                    categoryButton(controller, 'Completed'),
                    categoryButton(controller, 'Cancelled'),
                    SizedBox(width: 8.w),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                return controller.selectedCategory.value == 'Active'
                    ? const ActiveOrdersScreen()
                    : const CompletedOffers();
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryButton(CategoriesController controller, String category) {
    return Obx(() {
      bool isSelected = controller.selectedCategory.value == category;

      return CustomContainer(
        margin: EdgeInsets.only(right: 2.w),
        onTap: () => controller.selectCategory(category),
        color: isSelected ? AppColors.blueColor : AppColors.transparentColor,
        borderRadius: 30.r,
        borderColor: isSelected ? AppColors.transparentColor : AppColors.grey300,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Center(
            child: appText(
              category,
              color: isSelected ? AppColors.whiteTheme : AppColors.blackColor,
            ),
          ),
        ),
      );
    });
  }
}

class CategoriesController extends GetxController {
  var selectedCategory = 'All Orders'.obs; 

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}
