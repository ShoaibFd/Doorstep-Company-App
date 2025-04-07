import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../api/controllers/auth/auth_controller.dart';
import '../../components/app_text.dart';
import '../../components/custom_snackbar.dart';
import '../../components/round_button.dart';
import '../../theme/colors.dart';
import '../account_screen/personal_detail_screen.dart';
import '../google_map/google_map_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final authenticationController = Get.put(AuthenticationController());
  final _formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());

  RxBool isPhoneValid = false.obs;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      isPhoneValid.value = phoneController.text.length == 10;
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  // Verify OTP Function
  void verifyOTP() {
    if (_formKey.currentState!.validate()) {
      authController.sendOTP(
        context,
        phoneController.text.trim(),
        authenticationController.countryCode.value,
      );
      phoneController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.floatingButtonColor,
        onPressed: () {
          Get.to(() => GoogleMapScreen());
        },
        child: appText('Skip'),
      ),
      body: Stack(
        children: [
          Container(
            height: height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/authlogo.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.1),
                    appText('Doorstep', fontSize: 20.sp, fontWeight: FontWeight.bold),
                    appText('Company'),
                    SizedBox(height: 10.h),
                    appText("Your Home Service Expert", fontSize: 18.sp, fontWeight: FontWeight.bold),
                    appText("Quick . Affordable . Service", color: AppColors.greyColor),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColors.grey300),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: CountryCodePicker(
                                onChanged: (code) {
                                  authenticationController.setCountryCode(code.dialCode!);
                                  authenticationController.setInitialSelection(code.code!);
                                },
                                initialSelection: authenticationController.initialSelection.value,
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                showFlag: true,
                                hideMainText: true,
                                favorite: const ['+92', '+1'],
                                flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                                builder: (countryCode) {
                                  return Row(
                                    children: <Widget>[
                                      Image.asset(
                                        countryCode!.flagUri!,
                                        package: 'country_code_picker',
                                        width: 32.w,
                                      ),
                                      SizedBox(width: 8.w),
                                      appText(countryCode.dialCode!, fontSize: 16.sp),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            cursorColor: AppColors.darkBlueShade,
                            decoration: InputDecoration(
                              hintText: 'Enter phone number',
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: AppColors.grey300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: AppColors.grey300),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length < 10) {
                                return 'Please enter a valid 10-digit phone number!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.05),
                    Obx(() => roundButton(
                          onTap: isPhoneValid.value
                              ? verifyOTP
                              : () => showErrorSnackbar(context, 'Enter a valid phone number!'),
                          isLoading: authController.isLoading.value,
                          textColor: isPhoneValid.value ? AppColors.whiteTheme : AppColors.greyColor,
                          color: isPhoneValid.value ? AppColors.blackColor : AppColors.grey300,
                          title: 'Get Verification code',
                        )),
                    SizedBox(height: 10.h),
                    Center(child: appText('Or Continue with', color: AppColors.hintGrey, fontSize: 18)),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => const PersonalDetailScreen());
                          },
                          icon: Image.asset('assets/images/google.png', height: 30.h),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.facebook,
                            size: 40.sp,
                            color: AppColors.blueColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthenticationController extends GetxController {
  var countryCode = '+92'.obs;
  var initialSelection = 'PK'.obs;

  void setCountryCode(String value) {
    countryCode.value = value;
  }

  void setInitialSelection(String value) {
    initialSelection.value = value;
  }
}
