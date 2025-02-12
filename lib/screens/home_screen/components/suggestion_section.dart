import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/app_text.dart';

Widget suggestionSection(BuildContext context) {
  final suggestionController = TextEditingController();
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
        Center(
          child: CustomContainer(
              onTap: () {
                if (suggestionController.text.isEmpty) {
                  return showErrorSnackbar(context, 'Please enter some suggestion first');
                } else {
                  suggestionController.clear();
                  return showSuccessSnackbar(context, 'Suggestion submitted successfully!');
                }
              },
              height: 34.px,
              width: 90.px,
              borderColor: AppColors.lowPurple,
              color: AppColors.lowPurple.withOpacity(0.03),
              child: Center(
                child: appText('Submit', color: AppColors.lowPurple, fontSize: 16.px, fontWeight: FontWeight.bold),
              )),
        )
      ],
    ),
  );
}
