import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/custom_text.dart';

class CustomerRatingDialog extends StatefulWidget {
  const CustomerRatingDialog({super.key});

  @override
  _CustomerRatingDialogState createState() => _CustomerRatingDialogState();
}

class _CustomerRatingDialogState extends State<CustomerRatingDialog> {
  double userRating = 0;
  final TextEditingController reviewController = TextEditingController();
  final List<File> selectedImages = [];

  // Mock method to pick images without using a package
  Future<void> pickImage() async {
    // Replace this with your custom logic for selecting images.
    // Example: Replace 'mockPath.jpg' with actual image paths fetched via system dialogs or input fields.
    const String imagePath = '/path/to/your/image/mockImage.jpg';
    final File imageFile = File(imagePath);

    setState(() {
      selectedImages.add(imageFile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.px)),
      title: Center(child: appText('Rate the partner', fontSize: 20.px, fontWeight: FontWeight.w400)),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              appText('How would you rate this partner?', fontSize: 16.px, color: Colors.grey),
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
                          color: index < userRating ? Colors.orange : AppColors.hintGrey.withOpacity(0.3)));
                }),
              ),
              SizedBox(height: 10.px),
              Align(
                  alignment: Alignment.centerLeft,
                  child: appText('Upload Photos (Optional)', color: AppColors.greyColor)),
              SizedBox(height: 8.px),
              TextButton(onPressed: pickImage, child: appText('Select Photos', fontSize: 14.px)),
              SizedBox(height: 10.px),
              if (selectedImages.isNotEmpty)
                Wrap(
                  spacing: 8.px,
                  runSpacing: 8.px,
                  children: selectedImages
                      .map((image) => Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.px),
                                child: Image.file(
                                  image,
                                  width: 60.px,
                                  height: 60.px,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedImages.remove(image);
                                    });
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                    size: 20.px,
                                  ),
                                ),
                              )
                            ],
                          ))
                      .toList(),
                ),
              SizedBox(height: 10.px),
              TextFormField(
                controller: reviewController,
                decoration: InputDecoration(
                    hintText: 'Write something about partner',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              )
            ],
          );
        },
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomContainer(
            onTap: () {
              if (userRating > 0) {
                Navigator.pop(context);
                showSuccessSnackbar(context, 'Review submitted successfully, thanks for your time!');
              } else {
                showErrorSnackbar(context, 'Please select a rating.');
              }
            },
            height: 34.px,
            width: 80.px,
            color: AppColors.lowPurple,
            borderRadius: 40.px,
            child: Center(
                child: appText('Submit', fontSize: 16.px, fontWeight: FontWeight.w400, color: AppColors.whiteTheme)))
      ],
    );
  }
}
