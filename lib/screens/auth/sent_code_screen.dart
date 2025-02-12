import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/app_text.dart';
import '../../components/round_button.dart';
import '../../constants/colors.dart';
import 'create_account_screen.dart';

class CodeSentScreen extends StatelessWidget {
  CodeSentScreen({super.key});

  final formKey = GlobalKey<FormState>();

  TextEditingController otpController = TextEditingController();

  late var textStyle = const TextStyle(color: AppColors.transparentColor);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/authlogo.jpeg'))),
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.04),
                appText('Enter Code', fontSize: 24, fontWeight: FontWeight.bold),
                appText('We have sent you an SMS with the code \n to phone number',
                    fontSize: 12, color: AppColors.hintGrey, textAlign: TextAlign.center),
                SizedBox(height: height * 0.030),
                OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40.px,
                  style: TextStyle(fontSize: 17.px),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    log("Entered Pin: $pin");
                  },
                ),
                SizedBox(height: height * 0.06),
                Center(
                    child: InkWell(
                        splashColor: AppColors.lightGreen,
                        onTap: () {},
                        child: appText('Resend Code', color: AppColors.blueShade))),
                SizedBox(height: 30.px),
                roundButton(
                    onTap: () {
                      Get.to(const CreateAccountScreen());
                    },
                    title: 'Proceed'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
