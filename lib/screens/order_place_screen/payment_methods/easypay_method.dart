import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/app_text.dart';
import '../../../components/round_button.dart';

class EasyPayMethod extends StatefulWidget {
  const EasyPayMethod({super.key});

  @override
  State<EasyPayMethod> createState() => _EasyPayMethodState();
}

class _EasyPayMethodState extends State<EasyPayMethod> {
  // Variables
  bool isChecked = true;
  final mobileController = TextEditingController();
  final cnicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/easypesa.png', height: 100.px)),
            ),
            SizedBox(height: 10.px),
            appText('Enter your EasyPaisa mobile account details',
                fontSize: 24, fontWeight: FontWeight.w400, textAlign: TextAlign.center),
            SizedBox(height: 10.px),
            TextFormField(
                controller: mobileController,
                decoration: InputDecoration(hintText: '03XXXXXXXXXX', label: appText('Mobile Number'))),
            SizedBox(height: 10.px),
            TextFormField(
                controller: cnicController,
                decoration: InputDecoration(hintText: '00000 000000 0', label: appText('CNIC'))),
            SizedBox(height: 10.px),
            Row(
              children: [
                Checkbox(
                    activeColor: AppColors.blueColor,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                SizedBox(width: 10.px),
                appText('Save payment method for future use', fontSize: 16, fontWeight: FontWeight.w400)
              ],
            ),
            SizedBox(height: 20.px),
            roundButton(color: AppColors.hintGrey, title: 'Continue')
          ],
        ),
      ),
    );
  }
}
