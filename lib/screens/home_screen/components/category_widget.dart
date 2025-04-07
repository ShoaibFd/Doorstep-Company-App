import 'dart:developer';

import 'package:doorstep_company_app/api/controllers/categories/sub_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../api/controllers/categories/category_controller.dart';
import '../../../components/app_text.dart';
import '../../../components/show_loading.dart';
import '../../../theme/colors.dart';
import '../../mens salon & massage/mens_salon/men_saloon_bottom_sheet.dart';
import '../../painting_wall_screen/painting_wall_screen.dart';
import '../../wall_panel_screen/wall_panel_screen.dart';
import '../women_salon_and_spa_bottom_sheet.dart.dart';

Widget categoryWidget(BuildContext context) {
  final subcategoryController = Get.put(SubCategoryController());
  final categoryController = Get.put(CategoryController());

  void navigateToScreen(int id, int tempId) {
    switch (tempId) {
      case 1:
        womenSalonAndSpaBottomSheet();
        break;
      case 2:
        showMenSaloonBottomSheet();
        break;
      case 3:
        Get.to(() => const PaintingWaterproofingScreen());
        break;
      case 4:
        Get.to(() => const WallPanelScreen());
        break;
      default:
        null;
    }
  }

  return Obx(() {
    if (categoryController.isLoading.value) {
      return Center(child: showLoading());
    }
    if (categoryController.categories.value == null) {
      return const SizedBox();
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 3.h),
        child: GridView.builder(
          itemCount: categoryController.categories.value?.data?.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10.w, mainAxisSpacing: 3.h, mainAxisExtent: 130.h),
          itemBuilder: (context, index) {
            final category = categoryController.categories.value?.data?[index];
            final tempId = category?.templateSettingId;
            return GestureDetector(
              onTap: () {
                navigateToScreen(category?.id ?? 0, int.parse(tempId.toString()));
                subcategoryController.fetchSubcategories(category?.id,
                    tempId: tempId, tempName: category?.templateName);
                log('Category id: ${category?.id}, template id: $tempId');
              },
              child: Column(
                children: [
                  Container(
                    height: 73.h,
                    width: 102.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r), color: AppColors.grey300.withOpacity(0.4)),
                    child: Center(child: Image.network(category?.image ?? "", height: 50.h)),
                  ),
                  SizedBox(height: 4.h),
                  appText(category?.name ?? "",
                      textAlign: TextAlign.center, fontSize: 13.sp, fontWeight: FontWeight.w500),
                ],
              ),
            );
          },
        ),
      );
    }
  });
}
