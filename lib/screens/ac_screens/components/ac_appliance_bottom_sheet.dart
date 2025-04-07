import 'package:doorstep_company_app/api/controllers/categories/sub_category_controller.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/app_text.dart';
import '../../../theme/colors.dart';
import '../ac_repair.dart';

void acAppliancesBottomSheet(BuildContext context, {int? id}) {
  final subCategoryController = Get.put(SubCategoryController());

  void navigateToScreen(int index) {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AcRepairScreen()));
    }
  }

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    constraints: const BoxConstraints(),
    builder: (BuildContext context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 0.5.sh,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteTheme,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(18.r), topRight: Radius.circular(18.r)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Obx(() {
                if (subCategoryController.isLoading.value) {
                  return Center(child: showLoading());
                }

                final subCategories = subCategoryController.subCategories.value?.data?.subcategories ?? [];

                if (subCategories.isEmpty) {
                  return Center(child: appText('No subcategories found!'));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    appText(
                      subCategoryController.subCategories.value?.data?.categoryname ?? '',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                    SizedBox(height: 5.h),

                    /// Appliance Services Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: subCategories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 3.h,
                        mainAxisExtent: 140.h,
                      ),
                      itemBuilder: (context, index) {
                        final subcategory = subCategoryController.subCategories.value?.data?.subcategories?[index];

                        return Column(
                          children: [
                            appText(
                              subCategories[index].categorySubtitle?.subTitle ?? '',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                            SizedBox(height: 10.h),
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
                                    subcategory?.subCategoryImage ?? "",
                                    height: 55.h,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            appText(
                              subcategory?.subCategoryName ?? '',
                              textAlign: TextAlign.center,
                              fontSize: 14.sp,
                            ),
                          ],
                        );
                      },
                    ),

                    SizedBox(height: 10.h),
                  ],
                );
              }),
            ),
          ),

          /// Close Button
          Positioned(
            top: -40.h,
            right: 16.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                radius: 22.r,
                backgroundColor: Colors.white,
                child: Icon(Icons.close, color: Colors.black, size: 24.sp),
              ),
            ),
          ),
        ],
      );
    },
  );
}
