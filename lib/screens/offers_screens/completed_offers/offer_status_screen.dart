import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/app_text.dart';

class OfferStatusScreen extends StatefulWidget {
  const OfferStatusScreen({super.key});

  @override
  State<OfferStatusScreen> createState() => _OfferStatusScreenState();
}

class _OfferStatusScreenState extends State<OfferStatusScreen> {
  int _currentStep = 0;

  List<Step> _stepList() {
    return [
      Step(
        stepStyle: const StepStyle(color: AppColors.greenColor),
        title: appText('Order Placed'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText('14 Feb', color: AppColors.hintGrey),
            appText('10:40 PM', color: AppColors.hintGrey),
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        stepStyle: const StepStyle(color: AppColors.greenColor),
        title: appText('Order Confirmed'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText('14 Feb', color: AppColors.hintGrey),
            appText('10:40 PM', color: AppColors.hintGrey),
          ],
        ),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        stepStyle: const StepStyle(color: AppColors.greenColor),
        title: appText('Processed and ready to ship'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText('14 Feb', color: AppColors.hintGrey),
            appText('10:40 PM', color: AppColors.hintGrey),
          ],
        ),
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
      ),
      Step(
        stepStyle: const StepStyle(color: AppColors.greenColor),
        title: appText('On the way'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText('14 Feb', color: AppColors.hintGrey),
            appText('10:40 PM', color: AppColors.hintGrey),
          ],
        ),
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
      ),
      Step(
        stepStyle: const StepStyle(color: AppColors.greenColor),
        title: appText('Delivered'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText('14 Feb', color: AppColors.hintGrey),
            appText('10:40 PM', color: AppColors.hintGrey),
          ],
        ),
        isActive: _currentStep >= 4,
        state: _currentStep > 4 ? StepState.complete : StepState.indexed,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Delivery Status', fontSize: 20.px, fontWeight: FontWeight.bold),
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
                      TextButton(onPressed: details.onStepContinue, child: appText('Next')),
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
