import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/app_text.dart';
import '../../components/round_button.dart';
import '../cart_screen/summary_screen.dart';

class GuidelinesBottomSheet extends StatefulWidget {
  const GuidelinesBottomSheet({super.key});

  @override
  _GuidelinesBottomSheetState createState() => _GuidelinesBottomSheetState();
}

class _GuidelinesBottomSheetState extends State<GuidelinesBottomSheet> {
  // Variables

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.8,
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
                    children: [
                      Icon(Icons.health_and_safety_outlined, color: AppColors.blueColor, size: 40.px),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Pest Control Safety Guidelines', fontSize: 20.px, fontWeight: FontWeight.bold),
                          SizedBox(height: 6.px),
                          appText('3 Steps to ensure your safety', color: AppColors.hintGrey)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  appText('Keep the fan on for 2 hours after the spray treatment is concluded',
                      fontSize: 18, fontWeight: FontWeight.bold),
                  const SizedBox(height: 20),
                  appText('This will help chemical dry quickly', color: AppColors.hintGrey),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  appText(
                      'Keep pregnant women, children and pets away for at least 3 hours after the treatent is completed.',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  appText(
                      'The chemical used for the service is harmless on touch, but can raise a serious hazaed if ingested in any way',
                      color: AppColors.hintGrey),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  appText('Used only dry towel/cloth to wipe the corners where the sppraying is done.',
                      fontSize: 18, fontWeight: FontWeight.bold),
                  appText('Wiping the spryed areas with mops affects the efficiency of the service.',
                      color: AppColors.hintGrey),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 106),
                  roundButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SummaryScreen(
                                      onChecked: false,
                                    )));
                      },
                      title: 'Yes, I will follow the guidelines')
                ],
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

void showGuidelinesBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    constraints: const BoxConstraints(),
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isDismissible: true,
    builder: (context) {
      return const GuidelinesBottomSheet();
    },
  );
}
