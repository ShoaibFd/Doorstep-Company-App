import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/custom_container.dart';
import '../../components/custom_snackbar.dart';
import '../../components/custom_text.dart';
import '../../components/round_button.dart';
import '../../constants/colors.dart';

class ProfessionalRatingBottomSheet extends StatefulWidget {
  const ProfessionalRatingBottomSheet({super.key});

  @override
  _ProfessionalRatingBottomSheetState createState() => _ProfessionalRatingBottomSheetState();
}

class _ProfessionalRatingBottomSheetState extends State<ProfessionalRatingBottomSheet> {
  // Variables
  String? _selectedServiceQuality;
  String? _selectedSkillQuality;
  String? _selectedStatusQuality;
  String? _selectedDamageQuality;
  String? _selectedBehaviour;
  String? _selectedCurious;
  String? _selectedSuitable;
  String? _selectedCleanliness;
  String? _selectedJobQuality;
  double userRating = 0;
  bool isGood = false;
  bool isBad = false;
  bool isSkilled = false;
  bool isUnskilled = false;
  bool isComplete = false;
  bool isUnComplete = false;
  bool isDamage = false;
  bool isNotDamage = false;
  bool isFriendly = false;
  bool isNotFriendly = false;
  bool isSuitable = false;
  bool isNotSuitable = false;
  bool isCurious = false;
  bool isNotCurious = false;
  bool isClean = false;
  bool isNotClean = false;
  final TextEditingController reviewController = TextEditingController();

  // Image Picker Function
  List<XFile>? _pickedImages = [];

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    try {
      final List<XFile> images = await picker.pickMultiImage();
      if (images.isNotEmpty) {
        setState(() {
          _pickedImages = images;
        });
      }
    } catch (e) {
      showErrorSnackbar(context, 'Failed to pick image');
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.9,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      appText('Rate Professional:', fontSize: 20.px, fontWeight: FontWeight.bold),
                      appText('Mr. Blah', fontSize: 20.px, fontWeight: FontWeight.bold, color: AppColors.blueColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return SizedBox(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              userRating = index + 1;
                            });
                          },
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.star_rounded,
                            weight: 30,
                            grade: 30,
                            size: 40.px,
                            color: index < userRating ? AppColors.darkGreen : AppColors.hintGrey.withOpacity(0.3),
                          ),
                        ),
                      );
                    }),
                  ),
                  TextFormField(
                    controller: reviewController,
                    decoration: InputDecoration(
                      hintText: 'Write something about partner',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                        height: 70,
                        child: _pickedImages != null && _pickedImages!.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(10),
                                itemCount: _pickedImages!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 50.px,
                                    width: 50.px,
                                    margin: EdgeInsets.symmetric(horizontal: 5.px),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.px),
                                      image: DecorationImage(
                                        image: FileImage(File(_pickedImages![index].path)),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Column(
                                children: [
                                  Icon(Icons.camera_alt_outlined, color: AppColors.hintGrey),
                                  GestureDetector(
                                      onTap: () => _pickImages(),
                                      child: appText("Optional", color: AppColors.hintGrey)),
                                ],
                              )),
                  ),

                  const SizedBox(height: 6),
                  appText('Rate Service Quality', fontSize: 18.px, fontWeight: FontWeight.bold),
                  CustomContainer(
                      color: AppColors.lowPurple.withOpacity(0.2),
                      borderColor: AppColors.blackColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ToggleableButtonRow(
                              label: 'Service Quality',
                              options: const ['Good', 'Bad'],
                              selectedOption: _selectedServiceQuality,
                              onOptionSelected: (option) {
                                setState(() {
                                  _selectedServiceQuality = option;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            ToggleableButtonRow(
                              label: 'Person',
                              options: const ['Skilled', 'Unskilled'],
                              selectedOption: _selectedSkillQuality,
                              onOptionSelected: (option) {
                                setState(() {
                                  _selectedSkillQuality = option;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            ToggleableButtonRow(
                              label: 'Service ',
                              options: const ['Complete', 'Incomplete'],
                              selectedOption: _selectedStatusQuality,
                              onOptionSelected: (option) {
                                setState(() {
                                  _selectedStatusQuality = option;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            ToggleableButtonRow(
                              label: 'Damaged Something',
                              options: const ['Yes', 'No'],
                              selectedOption: _selectedDamageQuality,
                              onOptionSelected: (option) {
                                setState(() {
                                  _selectedDamageQuality = option;
                                });
                              },
                            ),
                          ],
                        ),
                      )),

                  const SizedBox(height: 16),
                  appText('Rate Security Questions', fontSize: 18, fontWeight: FontWeight.bold),
                  // const SizedBox(height: 10),
                  CustomContainer(
                      color: AppColors.lowPurple.withOpacity(0.2),
                      borderColor: AppColors.blackColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ToggleableButtonRow(
                              label: 'Behaviour',
                              options: const ['Friendly', 'Neutral', 'Aggressive'],
                              selectedOption: _selectedBehaviour,
                              onOptionSelected: (option) {
                                setState(() {
                                  _selectedBehaviour = option;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            ToggleableButtonRow(
                              label: 'Suitable for Home Entry',
                              options: const ['Yes', 'No'],
                              selectedOption: _selectedSuitable,
                              onOptionSelected: (option) {
                                setState(() {
                                  _selectedSuitable = option;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            ToggleableButtonRow(
                              label: 'Curious about Personal Info',
                              options: const ['Yes', 'No'],
                              selectedOption: _selectedCurious,
                              onOptionSelected: (option) {
                                setState(() {
                                  _selectedCurious = option;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 16),
                  appText('Rate Cleanliness', fontSize: 18, fontWeight: FontWeight.bold),
                  // const SizedBox(height: 10),
                  CustomContainer(
                      color: AppColors.lowPurple.withOpacity(0.2),
                      borderColor: AppColors.blackColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ToggleableButtonRow(
                              label: 'Good personal hygiene',
                              options: const ['Yes', 'No'],
                              selectedOption: _selectedCleanliness,
                              onOptionSelected: (option) {
                                setState(() {
                                  _selectedCleanliness = option;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            ToggleableButtonRow(
                              label: 'Good cleaning after job',
                              options: const ['Yes', 'No'],
                              selectedOption: _selectedJobQuality,
                              onOptionSelected: (option) {
                                setState(() {
                                  _selectedJobQuality = option;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: roundButton(
                onTap: () {
                  if (userRating > 0) {
                    Navigator.pop(context);
                    showSuccessSnackbar(context, 'Review submitted successfully, thanks for your time!');
                  } else {
                    showErrorSnackbar(context, 'Please select a rating.');
                  }
                },
                title: 'Submit',
              ),
            ),
          ),
          Positioned(
            top: -50.px,
            right: 16.px,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                backgroundColor: AppColors.whiteTheme,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showProfessionalRatingBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    constraints: const BoxConstraints(),
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isDismissible: true,
    builder: (context) {
      return const ProfessionalRatingBottomSheet();
    },
  );
}

//
class ToggleableButtonRow extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String> onOptionSelected;

  const ToggleableButtonRow({
    super.key,
    required this.label,
    required this.options,
    this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appText(label, fontSize: 15, fontWeight: FontWeight.bold),
        Row(
          children: options.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _ToggleableButton(
                label: option,
                isSelected: selectedOption == option,
                onTap: () => onOptionSelected(option),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _ToggleableButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToggleableButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          height: 26,
          constraints: const BoxConstraints(minWidth: 60),
          decoration: BoxDecoration(
              color: isSelected ? AppColors.darkGreen : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: isSelected ? AppColors.darkGreen : AppColors.blackColor)),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.center,
          child: appText(
            label,
            fontSize: 13,
            color: isSelected ? AppColors.whiteTheme : AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
