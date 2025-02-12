import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/app_text.dart';

class ClaimDetailScreen extends StatefulWidget {
  const ClaimDetailScreen({super.key});

  @override
  State<ClaimDetailScreen> createState() => _ClaimDetailScreenState();
}

class _ClaimDetailScreenState extends State<ClaimDetailScreen> {
  int _currentStep = 0;

  List<Step> _stepList() {
    return [
      Step(
          stepStyle: const StepStyle(color: AppColors.greenColor),
          title: appText('Claim Initiated'),
          content: appText('Your claim has been successfully initiated. We are reviewing your details.'),
          isActive: _currentStep >= 0,
          state: _currentStep > 0 ? StepState.complete : StepState.indexed),
      Step(
          stepStyle: const StepStyle(color: AppColors.greenColor),
          title: appText('Claim Accepted'),
          content: appText('Your claim has been successfully accepted. We are reviewing your details'),
          isActive: _currentStep >= 0,
          state: _currentStep > 0 ? StepState.complete : StepState.indexed),
      Step(
          stepStyle: const StepStyle(color: AppColors.greenColor),
          title: appText('Finding a professional'),
          content: Row(
            children: [
              Icon(Icons.person_search, color: AppColors.greenColor, size: 35.px),
              appText('Searching for professional..')
            ],
          ),
          isActive: _currentStep >= 1,
          state: _currentStep > 1 ? StepState.complete : StepState.indexed),
      Step(
          stepStyle: const StepStyle(color: AppColors.greenColor),
          title: appText('Work in Progress'),
          content: appText('The assigned professional is working on resolving your issue.'),
          isActive: _currentStep >= 2,
          state: _currentStep > 2 ? StepState.complete : StepState.indexed),
      Step(
          stepStyle: const StepStyle(color: AppColors.greenColor),
          title: appText('Issue Resolved'),
          content: appText('Your claim has been resolved. Thank you for your patience.'),
          isActive: _currentStep >= 3,
          state: _currentStep > 3 ? StepState.complete : StepState.indexed),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Warranty Status', fontSize: 20.px, fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stepper(
              currentStep: _currentStep,
              onStepTapped: (step) {
                setState(() {
                  _currentStep = step;
                });
              },
              onStepContinue: _currentStep < _stepList().length - 1
                  ? () {
                      setState(() {
                        _currentStep++;
                      });
                    }
                  : null,
              onStepCancel: _currentStep > 0
                  ? () {
                      setState(() {
                        _currentStep--;
                      });
                    }
                  : null,
              steps: _stepList(),
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_currentStep > 0) TextButton(onPressed: details.onStepCancel, child: appText('Back')),
                    if (_currentStep < _stepList().length - 1)
                      TextButton(onPressed: details.onStepContinue, child: appText('Next'))
                  ],
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
