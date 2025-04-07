import 'package:doorstep_company_app/api/controllers/social_platforms/social_platforms_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/app_text.dart';
import '../../../components/show_loading.dart';

Widget socialPlatformsWidgets() {
  final platformsController = Get.put(SocialPlatformsController());
  // platformsController.fetchSocialPlatforms();
  return Padding(
    padding: EdgeInsets.all(14.w),
    child: Obx(() {
      if (platformsController.isLoading.value) {
        return Center(child: showLoading());
      }
      if (platformsController.platforms.value == null) {
        return Center(child: appText("No platforms available"));
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText("Our Social Platforms", fontSize: 18.sp, fontWeight: FontWeight.bold),
          SizedBox(height: 10.h),
          SizedBox(
              height: 40.h,
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: platformsController.platforms.value?.data?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final platform = platformsController.platforms.value?.data?[index];
                  final imageUrl = platform?.icon ?? "https://example.com/default-icon.png";
                  final decodedImageUrl = imageUrl.replaceAll(r'\/', '/');
                  return GestureDetector(
                      onTap: () async {
                        if (platform?.url != null) {
                          final uri = Uri.parse(platform!.url.trim());
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, image: DecorationImage(image: NetworkImage(decodedImageUrl)))));
                },
              ))
        ],
      );
    }),
  );
}
