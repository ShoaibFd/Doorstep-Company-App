import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../api/controllers/categories/sub_category_controller.dart';
import '../../../components/app_text.dart';
import '../../../theme/colors.dart';
import '../components/mens_massage_category_screen.dart';
import 'salon_category_screen.dart';

void showMenSaloonBottomSheet() {
  final subcategoryController = Get.find<SubCategoryController>();

  Get.bottomSheet(
    Obx(() {
      if (subcategoryController.isLoading.value) {
        return Center(child: showLoading());
      }
      return AnimatedPadding(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
        child: Container(
          height: 0.24.sh,
          width: 1.sw,
          decoration: BoxDecoration(
            color: AppColors.whiteTheme,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(18.r), topRight: Radius.circular(18.r)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: appText(
                    subcategoryController.subCategories.value?.data?.categoryname ?? '',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 120.h,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: subcategoryController.subCategories.value?.data?.subcategories?.length ?? 0,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final subcategory = subcategoryController.subCategories.value?.data?.subcategories?[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(index == 0 ? const SalonCategoryScreen() : const MensMassageCategoryScreen());
                        },
                        child: Container(
                          height: 60.h,
                          width: 170.w,
                          margin: EdgeInsets.only(top: 60.h, right: 6.h),
                          decoration: BoxDecoration(
                            color: AppColors.grey300.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 100.h, child: appText(subcategory?.subCategoryName ?? '')),
                                SizedBox(width: 0.5.w),
                                Image.network(subcategory?.subCategoryImage ?? '', height: 40.h),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: -60.h,
                  right: 10.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.whiteTheme,
                      child: Icon(Icons.close, color: AppColors.blackColor, size: 18.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
    ),
  );
}
