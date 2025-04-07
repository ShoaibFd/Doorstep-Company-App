import 'package:doorstep_company_app/api/controllers/categories/sub_category_controller.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/app_text.dart';
import '../../theme/colors.dart';
import '../salon_for_women/hair_studio/hair_studio_for_women_screen.dart';
import '../salon_for_women/hair_studio/hair_studio_screen.dart';
import '../salon_for_women/hair_studio/salon_category_screen.dart';
import '../salon_for_women/spa_for_women/spa_for_women_category_screen.dart';

void womenSalonAndSpaBottomSheet() {
  final subCategoryController = Get.find<SubCategoryController>();

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Get.to(const SalonForWomenCategoryScreen());
        break;
      case 1:
        Get.to(const SpaForWomenCategoryScreen());
        break;
      case 2:
        Get.to(const HairStudioScreen());
        break;
      case 3:
        Get.to(const HairStudioForWomenScreen());
        break;
    }
  }

  Get.bottomSheet(
    Obx(() {
      if (subCategoryController.isLoading.value) {
        return Center(child: showLoading());
      }

      final subCategories = subCategoryController.subCategories.value?.data?.subcategories ?? [];

      if (subCategories.isEmpty) {
        return Center(child: appText('No services found!'));
      }

      // Group subcategories by subtitle
      Map<String, List<dynamic>> groupedSubcategories = {};
      for (var subcategory in subCategories) {
        final subtitle = subcategory.categorySubTitleName ?? '';
        if (!groupedSubcategories.containsKey(subtitle)) {
          groupedSubcategories[subtitle] = [];
        }
        groupedSubcategories[subtitle]?.add(subcategory);
      }

      // Calculate content height based on actual data
      final mediaQueryHeight = Get.height;
      const crossAxisCount = 4;

      // Calculate height for each group
      double totalContentHeight = 40.h; // Initial padding + title

      groupedSubcategories.forEach((key, value) {
        // Height for subtitle
        totalContentHeight += 26.h; // Subtitle + spacing

        // Height for grid
        final itemsInGroup = value.length;
        final rowsInGroup = (itemsInGroup / crossAxisCount).ceil();
        totalContentHeight += rowsInGroup * 120.h; 
      });

      // Add some padding
      totalContentHeight += 30.h;

      // Limit to max 90% of screen height
      final maxHeight = mediaQueryHeight * 0.9;
      final bottomSheetHeight = totalContentHeight > maxHeight ? maxHeight : totalContentHeight;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        curve: Curves.bounceIn,
        height: bottomSheetHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteTheme,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(18.r), topRight: Radius.circular(18.r)),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    appText(subCategoryController.subCategories.value?.data?.categoryname ?? '',
                        fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ...groupedSubcategories.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          appText(
                            entry.key,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                          SizedBox(height: 10.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: entry.value.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 3.h,
                              mainAxisExtent: 120.h,
                            ),
                            itemBuilder: (context, index) {
                              final subcategory = entry.value[index];
                              final imageUrl = (subcategory.subCategoryImage?.isNotEmpty == true)
                                  ? subcategory.subCategoryImage!
                                  : 'https://via.placeholder.com/65';

                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => navigateToScreen(index),
                                    child: Container(
                                      height: 65.h,
                                      width: 65.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        color: AppColors.grey300.withOpacity(0.4),
                                      ),
                                      child: Center(
                                        child: Image.network(
                                          imageUrl,
                                          height: 50.h,
                                          errorBuilder: (context, error, stackTrace) => Icon(
                                            Icons.image_not_supported,
                                            size: 50.h,
                                            color: AppColors.grey300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  appText(
                                    subcategory.subCategoryName ?? '',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -50.h,
              right: 16.w,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: AppColors.whiteTheme,
                  child: Icon(Icons.close, color: AppColors.blackColor, size: 18.sp),
                ),
              ),
            ),
          ],
        ),
      );
    }),
    backgroundColor: AppColors.whiteTheme,
  );
}
