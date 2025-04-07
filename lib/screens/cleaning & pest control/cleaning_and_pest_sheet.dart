import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../api/controllers/categories/sub_category_controller.dart';
import '../../components/app_text.dart';
import '../../theme/colors.dart';
import 'bathroom_cleaning/bathroom_cleaning_screen.dart';
import 'full_home_cleaning/home_cleaning_screen.dart';

void showCleaningAndPestSheet(BuildContext context, {int? id}) {
  final subCategoryController = Get.put(SubCategoryController());
  List<String> services = [
    'Bathroom Cleaning',
    'Kitchen Cleaning',
    'Full Home Cleaning',
    'Sofa & Carpet Cleaning',
  ];

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 0.4.sh,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteTheme,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                child: Obx(() {
                  if (subCategoryController.isLoading.value) {
                    return Center(child: showLoading());
                  }
                  if (subCategoryController.subCategories.value == null) {
                    return Center(child: appText('No subcategory found!'));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      appText('Cleaning & Pest Control', fontSize: 20.sp, fontWeight: FontWeight.bold),
                      SizedBox(height: 20.h),
                      appText('Cleaning', fontSize: 18.sp, fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 140.h,
                        child: ListView.builder(
                          itemCount: services.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final subcategory = subCategoryController.subCategories.value?.data?.subcategories?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const BathroomCleaningScreen()),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const HomeCleaningScreen()),
                                      );
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10.r),
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey300.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: Image.network(subcategory?.subCategoryImage ?? '', height: 45.h),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                  width: 70.w,
                                  child: appText(
                                    subcategory?.subCategoryName ?? '',
                                    textAlign: TextAlign.center,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      appText('Pest Control', fontSize: 18.sp, fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 140.h,
                        child: ListView.builder(
                          itemCount: services.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final subcategory = subCategoryController.subCategories.value?.data?.subcategories?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const BathroomCleaningScreen()),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const HomeCleaningScreen()),
                                      );
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10.r),
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey300.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: Image.network(subcategory?.subCategoryImage ?? '', height: 45.h),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                  width: 70.w,
                                  child: appText(
                                    subcategory?.subCategoryName ?? '',
                                    textAlign: TextAlign.center,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                })),
          ),
          Positioned(
            top: -50.h,
            right: 16.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      );
    },
  );
}
