import 'dart:async';

import 'package:doorstep_company_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../language/language_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      Get.off( LanguageScreen(onChecked: false));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashPurple,
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    height: 90.px,
                    width: 200.px,
                    decoration: BoxDecoration(color: AppColors.blackColor, borderRadius: BorderRadius.circular(40.px)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          appText('DOORSTEP',
                              fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.whiteTheme),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: appText('Company',
                                  fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.lowPurple)),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
