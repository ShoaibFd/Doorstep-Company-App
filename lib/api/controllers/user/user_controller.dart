// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:doorstep_company_app/api/api_endpoints.dart';
import 'package:doorstep_company_app/components/custom_snackbar.dart';
import 'package:doorstep_company_app/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/user/user_edit_profile.dart';

class UserController extends GetxController {
  final SharedPrefs prefs = SharedPrefs();
  var isLoading = false.obs;
  var userEditProfile = Rxn<UserEditProfile>();

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
  }

// Create Account Function
  Future<bool> createAccount(
      String name, String gender, String dob, String address, String email, String phone, BuildContext context) async {
    try {
      final token = await prefs.getToken();

      log('Token in create account: $token');
      isLoading(true);
      final response = await http.patch(
        Uri.parse(ApiEndpoints.createAccount),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'gender': gender,
          'date_of_birth': dob,
          'email': email,
          'phone_number': phone,
          'address': address,
        }),
      );

      log('StatusCode in createAccount: ${response.statusCode}');
      log('response in createAccount: ${response.body}');
      if (response.statusCode == 200) {
        showSuccessSnackbar(context, 'Account created successfully!');
        return true;
      } else {
        log('ERROR : ${response.body}');
        showErrorSnackbar(context, 'Failed to create account');
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    } finally {
      isLoading(false);
    }
  }

// User Info Function
  Future<UserEditProfile?> fetchUserInfo() async {
    try {
      final token = await prefs.getToken();
      isLoading(true);
      final response = await http.patch(
        Uri.parse(ApiEndpoints.updateProfile),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        userEditProfile.value = UserEditProfile.fromJson(responseData);
        return userEditProfile.value;
      } else {
        log('Error fetching user profile: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      log('ERROR in fetchUserInfo: $e');
    } finally {
      isLoading(false);
    }
    return null;
  }

// Post User Info Function
  Future<void> postUserInfo(String fname, String lname, String email, String phone, String city, String street,
      String apartment, String area, BuildContext context) async {
    try {
      isLoading(true);

      final token = await prefs.getToken();
      final Map<String, dynamic> requestBody = {
        'first_name': fname,
        'last_name': lname,
        'email': email,
        'phone_number': phone,
        'city': city,
        'area': area,
        'street': street,
        'apartment': apartment,
      };

      final response = await http.patch(
        Uri.parse(ApiEndpoints.updateProfile),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
      log('StatusCode: ${response.statusCode}');
      if (response.statusCode == 200) {
        await fetchUserInfo();
        showSuccessSnackbar(context, 'Profile updated successfully!');
      } else {
        showErrorSnackbar(context, 'Failed to update profile. Please try again. (${response.statusCode})');
      }
    } catch (e) {
      log('ERROR in postUserInfo: $e');
    } finally {
      isLoading(false);
    }
  }

// Post User location Function
  Future<void> postUserLocation(double lng, double lat, BuildContext context) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(ApiEndpoints.userLocation),
        body: jsonEncode({
          'latitude': lat,
          'longitude': lng,
        }),
      );
      if (response.statusCode == 200) {
        showSuccessSnackbar(context, 'Location updated successfully!');
      } else {
        log('Failed to post location: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      showErrorSnackbar(context, 'An error occurred. Please try again.');
    } finally {
      isLoading(false);
    }
  }

// Upload Profile Image Function
  Future<void> uploadProfileImage(Rx<File?> imageFile, BuildContext context) async {
    isLoading(true);

    try {
      final token = await prefs.getToken();
      if (token == null) {
        showErrorSnackbar(context, 'Authentication token not found.');
        return;
      }

      if (imageFile.value == null) {
        showErrorSnackbar(context, 'No image selected.');
        return;
      }

      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse(ApiEndpoints.updateProfile),
      );

      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image',
        imageFile.value!.path,
        filename: 'profile_image.jpg',
      ));

      var response = await request.send();
      log('statusCode: ${response.statusCode}');
      log('Response: ${response.stream}');

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var responseJson = jsonDecode(responseData);
        showSuccessSnackbar(context, responseJson['message']);
      } else {
        showErrorSnackbar(context, 'Failed to update profile image. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      showErrorSnackbar(context, 'Error uploading profile image: $e');
    } finally {
      isLoading(false);
    }
  }
}
