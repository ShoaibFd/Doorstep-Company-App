import 'package:doorstep_company_app/api/controllers/categories/subscription_package_controller.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/app_text.dart';
import '../../../theme/colors.dart';
import 'packages_detail_screen.dart';
import 'projects_detail_screen.dart';

Widget packagesAndProjects(BuildContext context) {
  final SubscriptionPackageController subscriptionController = Get.put(SubscriptionPackageController());
  return Obx(() {
    if (subscriptionController.isLoading.value) {
      return Center(child: showLoading());
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          appText('Subscription Packages', fontSize: 18.sp, fontWeight: FontWeight.bold),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: GridView.builder(
              itemCount:
                  subscriptionController.subscriptionPackagesModel.value?.data?.subscriptionPackages?.length ?? 0,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 3.h,
                mainAxisExtent: 130.h,
              ),
              itemBuilder: (context, index) {
                final subscription =
                    subscriptionController.subscriptionPackagesModel.value?.data?.subscriptionPackages?[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(const PackagesDetailScreen());
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 73.h,
                        width: 102.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.grey300.withOpacity(0.4),
                        ),
                        child: Center(child: Image.network(subscription?.image ?? '', height: 50.h)),
                      ),
                      SizedBox(height: 4.h),
                      appText(
                        subscription?.categoryName ?? "",
                        textAlign: TextAlign.center,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 4.h),
          Divider(color: AppColors.grey300),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText('New Home Projects', fontSize: 18.sp, fontWeight: FontWeight.bold),
                SizedBox(height: 10.h),
                GridView.builder(
                  itemCount: subscriptionController.projects.value?.data?.newHomeProjects?.length ?? 0,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 3.h,
                    mainAxisExtent: 120.h,
                  ),
                  itemBuilder: (context, index) {
                    final project = subscriptionController.projects.value?.data?.newHomeProjects?[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(const ProjectsDetailScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 73.h,
                            width: 102.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.grey300.withOpacity(0.4),
                            ),
                            child: Center(child: Image.network(project?.image ?? '', height: 55.h)),
                          ),
                          SizedBox(height: 4.h),
                          appText(
                            project?.title ?? "",
                            textAlign: TextAlign.center,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  });
}
