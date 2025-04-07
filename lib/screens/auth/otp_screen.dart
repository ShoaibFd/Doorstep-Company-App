import 'dart:async';
import 'dart:developer';

import 'package:doorstep_company_app/api/controllers/auth/auth_controller.dart';
import 'package:doorstep_company_app/components/custom_snackbar.dart';
import 'package:doorstep_company_app/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/app_text.dart';
import '../../components/round_button.dart';
import '../../theme/colors.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final formKey = GlobalKey<FormState>();
  final otpController = OTPTextEditController(length: 4);
  final AuthController authController = Get.find<AuthController>();
  final SharedPrefs prefs = SharedPrefs();
  int start = 60;
  bool timerRunning = false;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    start = 60;
    timerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (start < 1) {
          _timer?.cancel();
          timerRunning = false;
        } else {
          start--;
        }
      });
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/authlogo.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.04),
                appText('Enter Code', fontSize: 24, fontWeight: FontWeight.bold),
                appText(
                  'We have sent you a SMS with the code \nto phone number',
                  fontSize: 12,
                  color: AppColors.hintGrey,
                  textAlign: TextAlign.center,
                ),
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
                    otpController.setText(pin);
                  },
                ),
                SizedBox(height: height * 0.06),
                timerRunning
                    ? appText('OTP will expires in ${start.toString()}', fontSize: 16.sp, color: AppColors.blueColor)
                    : Center(
                        child: InkWell(
                          splashColor: AppColors.lightGreen,
                          onTap: () async {
                            final phone = await prefs.getPhone();
                            final countryCode = await prefs.getCountryCode();
                            log('Phone: $phone , countryCode: $countryCode');
                            if (phone != null && countryCode != null) {
                              await authController.sendOTP(context, phone, countryCode);
                              startTimer();
                            } else {
                              showErrorSnackbar(context, 'Phone number or country code not found');
                            }
                          },
                          child: appText('Resend Code', color: AppColors.blueShade, fontSize: 16.sp),
                        ),
                      ),
                SizedBox(height: 30.px),
                Obx(() => roundButton(
                      onTap: () {
                        if (otpController.text.isNotEmpty && otpController.text.length == 4) {
                          authController.verifyOTP(otpController.text.trim(), context);
                        } else {
                          showErrorSnackbar(context, 'Please enter 4-digit OTP');
                        }
                      },
                      title: 'Proceed',
                      isLoading: authController.isLoading.value,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom controller to handle OTP text field values
class OTPTextEditController extends TextEditingController {
  final int length;
  String _text = '';

  OTPTextEditController({required this.length});

  void setText(String pin) {
    _text = pin;
    notifyListeners();
  }

  @override
  String get text => _text;
}
