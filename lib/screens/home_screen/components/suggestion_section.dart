import 'package:doorstep_company_app/api/controllers/suggestion/suggestion_controller.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/app_text.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_snackbar.dart';
import '../../../theme/colors.dart';

Widget suggestionSection(BuildContext context) {
  final suggestionController = TextEditingController();
  final SuggestionController controller = Get.put(SuggestionController());
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.px),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.px),
        appText('Give Suggesstion', fontSize: 20, fontWeight: FontWeight.bold),
        SizedBox(height: 12.px),
        TextFormField(
          controller: suggestionController,
          maxLines: 3,
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.redColor)),
              hintText: 'Enter your Suggestions',
              hintStyle: TextStyle(color: AppColors.hintGrey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.grey300)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.grey300, width: 1.2))),
        ),
        SizedBox(height: 20.px),
        Obx(() {
          return Center(
            child: CustomContainer(
                onTap: () {
                  if (suggestionController.text.isEmpty) {
                    return showInfoSnackbar(context, 'Please enter some suggestion first');
                  } else {
                    controller.postSuggestion(suggestionController.text, context);
                    suggestionController.clear();
                  }
                },
                height: 34.px,
                width: 90.px,
                borderColor: AppColors.lowPurple,
                color: AppColors.lowPurple.withOpacity(0.03),
                child: Center(
                  child: controller.isLoading.value
                      ? showLoading()
                      : appText('Submit', color: AppColors.lowPurple, fontSize: 16.px, fontWeight: FontWeight.bold),
                )),
          );
        })
      ],
    ),
  );
}
