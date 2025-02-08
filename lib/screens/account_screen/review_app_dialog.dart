import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/custom_container.dart';
import '../../components/custom_snackbar.dart';
import '../../components/custom_text.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double userRating = 0;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Center(child: appText('Rate this App', fontSize: 20.px, fontWeight: FontWeight.w400)),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              appText('How would you rate our app?', fontSize: 16.px, color: AppColors.greyColor),
              SizedBox(height: 15.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                      onPressed: () {
                        setState(() {
                          userRating = index + 1;
                        });
                      },
                      icon: Icon(Icons.star,
                          size: 30.px,
                          color: index < userRating ? AppColors.orangeColor : AppColors.hintGrey.withOpacity(0.3)));
                }),
              ),
              SizedBox(height: 10.px),
            ],
          );
        },
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomContainer(
            onTap: () {
              if (userRating > 0) {
                log("User rating: $userRating");
                Navigator.pop(context);
                showSuccessSnackbar(context, 'Review submitted successfully, thanks for your time!');
              } else {
                showErrorSnackbar(context, 'Please select a rating.');
              }
            },
            height: 34.px,
            width: 80.px,
            color: AppColors.blueColor,
            borderRadius: 40.px,
            child: Center(
                child: appText('Submit', fontSize: 16.px, fontWeight: FontWeight.w400, color: AppColors.whiteTheme)))
      ],
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const CustomAlertDialog({
    super.key,
    this.title,
    this.content,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: appText(title ?? '', fontSize: 20, fontWeight: FontWeight.w400),
      content: appText(content ?? '', fontWeight: FontWeight.w400),
      actions: [
        TextButton(onPressed: onCancel, child: appText(cancelText ?? '')),
        TextButton(
            onPressed: onConfirm,
            child: appText(
              confirmText ?? '',
            )),
      ],
    );
  }
}
