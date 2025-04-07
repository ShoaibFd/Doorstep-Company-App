import 'dart:async';
import 'dart:developer';

import 'package:doorstep_company_app/components/app_text.dart';
import 'package:doorstep_company_app/screens/language/language_screen.dart';
import 'package:doorstep_company_app/utils/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../api/controllers/auth/auth_controller.dart';
import '../../theme/colors.dart';
import '../../utils/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authController = Get.put(AuthController());
  SharedPrefs prefs = SharedPrefs();

  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _getCurrentLocation(); // Fetch location before navigation
    _navigateToNextScreen();
  }

  // Get current location function
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied.');
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      log('Error getting location: $e');
    }
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));

    String? authToken = await prefs.getToken();

    if (authToken != null) {
      Get.offAll(BottomNavigationScreen(
        latitude: currentLocation?.latitude ?? 0,
        longitude: currentLocation?.longitude ?? 0,
      ));
    } else {
      Get.offAll(const LanguageScreen(onChecked: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.splashPurple,
          body: Padding(
            padding: EdgeInsets.all(48.w),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 80.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            appText(
                              'DOORSTEP',
                              fontSize: 20.sp,
                              fontWeight   : FontWeight.bold,
                              color: AppColors.whiteTheme,
                            ),
                            SizedBox(height: 2.h),
                            appText(
                              'Company',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.lowPurple,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
