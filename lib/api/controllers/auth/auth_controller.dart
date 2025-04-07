// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:doorstep_company_app/api/api_endpoints.dart';
import 'package:doorstep_company_app/components/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../screens/auth/create_account_screen.dart';
import '../../../screens/auth/otp_screen.dart';
import '../../../utils/bottom_navigation_screen.dart';
import '../../../utils/shared_prefs.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final SharedPrefs sharedPrefs = SharedPrefs();
  RxBool isLoggedIn = false.obs;
  GoogleMapController? mapController;
  LatLng? selectedLocation;
  LatLng? currentLocation;

  // Get current location function
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      currentLocation = LatLng(position.latitude, position.longitude);
      selectedLocation = currentLocation;
      update();

      if (mapController != null) {
        mapController!.animateCamera(CameraUpdate.newLatLng(currentLocation!));
      }
    } catch (e) {
      log('Error getting location: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    _getCurrentLocation();
  }

// SendOTP Function
  Future<void> sendOTP(BuildContext context, String phone, String countryCode) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(ApiEndpoints.sendOtp),
        body: {'phone_number': phone, 'country_code': countryCode},
      );
      await sharedPrefs.saveCountryCode(countryCode);
      await sharedPrefs.savePhone(phone);
      log('StatusCode in sendOTP Function: ${response.statusCode}');
      log('Response: ${response.body}');
      if (response.statusCode == 200) {
        showSuccessSnackbar(context, 'OTP Sent successfully!');
        Get.to(() => const OTPScreen());
      } else {
        showErrorSnackbar(context, 'Failed to send OTP! something went wrong.');
      }
    } catch (e) {
      log('Error: $e');
    } finally {
      isLoading(false);
    }
  }

// verifyOTP function
  Future<void> verifyOTP(String otp, BuildContext context) async {
    isLoading(true);

    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.verifyOtp),
        body: {'otp': otp},
      );
      log('Status Code: ${response.statusCode}');
      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['token'] != null) {
        await sharedPrefs.saveToken(responseData['token']);
        await sharedPrefs.savePhone(responseData['user']['phone_number']);
        await sharedPrefs.saveUserId(responseData['user']['id']);
        showSuccessSnackbar(context, 'OTP verified successfully!');
        Get.offAll(const CreateAccountScreen());
        if (responseData['user']['is_profile_complete'] == "1") {
          Get.offAll(() => BottomNavigationScreen(
                latitude: currentLocation?.latitude ?? 0,
                longitude: currentLocation?.longitude ?? 0,
              ));
        } else {
          Get.offAll(() => const CreateAccountScreen());
        }
      } else {
        showErrorSnackbar(context, 'This OTP is incorrect!');
      }
    } catch (e) {
      log('ERROR in verifyOTP: $e');
      showErrorSnackbar(context, 'Error verifying OTP');
    } finally {
      isLoading(false);
    }
  }

// Check login status
  Future<void> checkLoginStatus() async {
    final token = await sharedPrefs.getToken();
    if (token != null && token.isNotEmpty) {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }

  // logout function
  Future<void> logout(BuildContext context) async {
    try {
      isLoading(true);
      await sharedPrefs.removeToken();
      await sharedPrefs.removeUserId();

      isLoggedIn.value = false;
      showSuccessSnackbar(context, 'Logout successfully!');
    } catch (e) {
      log('ERROR: $e');
    } finally {
      isLoading(false);
    }
  }
}
