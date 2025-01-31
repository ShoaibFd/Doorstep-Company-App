import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_text.dart';
import '../widgets/reschedule_button.dart';
import 'cancel_button.dart';

class CancelBookingReasonScreen extends StatefulWidget {
  const CancelBookingReasonScreen({super.key});

  @override
  State<CancelBookingReasonScreen> createState() => _CancelBookingReasonScreenState();
}

class _CancelBookingReasonScreenState extends State<CancelBookingReasonScreen> {
  int isRadio = 0;
  final reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 10.px,
            children: [
              Center(child: appText('Select a reason', fontSize: 20, fontWeight: FontWeight.bold)),
              appText('Please select the reason for cancellation:', fontSize: 18, fontWeight: FontWeight.w400),
              SizedBox(height: 10.px),
              // Reason radios
              reasonRadio(
                reasonText: "Don't need the service anymore",
                groupValue: isRadio,
                value: 1,
                onChanged: (value) {
                  setState(() {
                    isRadio = value!;
                  });
                },
              ),
              reasonRadio(
                reasonText: "Not available at this time",
                groupValue: isRadio,
                value: 2,
                onChanged: (value) {
                  setState(() {
                    isRadio = value!;
                  });
                },
              ),
              reasonRadio(
                reasonText: "Found a better rate elsewhere",
                groupValue: isRadio,
                value: 3,
                onChanged: (value) {
                  setState(() {
                    isRadio = value!;
                  });
                },
              ),
              reasonRadio(
                reasonText: "Placed the request by mistake",
                groupValue: isRadio,
                value: 4,
                onChanged: (value) {
                  setState(() {
                    isRadio = value!;
                  });
                },
              ),
              reasonRadio(
                reasonText: 'Travelling',
                groupValue: isRadio,
                value: 5,
                onChanged: (value) {
                  setState(() {
                    isRadio = value!;
                  });
                },
              ),
              reasonRadio(
                reasonText: 'Others',
                groupValue: isRadio,
                value: 6,
                onChanged: (value) {
                  setState(() {
                    isRadio = value!;
                  });
                },
              ),
              // Conditionally show the TextFormField
              if (isRadio == 6)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: reasonController,
                    decoration: InputDecoration(
                      hintText: 'Enter reason',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton(textColor: AppColors.whiteTheme, color: AppColors.redColor, context, onTap: () {
                    if (isRadio == 6 && reasonController.text.isEmpty) {
                      showErrorSnackbar(context, 'Please enter a reason!');
                      return;
                    }

                    showSuccessSnackbar(context, 'Booking cancelled successfully!');
                  }),
                  rescheduleButton(
                    text: "Don't cancel",
                    context,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    color: AppColors.greenColor,
                    textColor: AppColors.whiteTheme,
                  ),
                ],
              ),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      ),
    );
  }
}

// Radio widget
Widget reasonRadio<T>({
  required String reasonText,
  required T groupValue,
  required T value,
  required ValueChanged<T?> onChanged,
}) {
  return CustomContainer(
    height: 60.px,
    width: double.infinity,
    color: AppColors.transparentColor,
    borderColor: AppColors.lowPurple,
    borderRadius: 8.px,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appText(reasonText, fontWeight: FontWeight.bold),
          Radio<T>(
            activeColor: AppColors.lowPurple,
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ],
      ),
    ),
  );
}
