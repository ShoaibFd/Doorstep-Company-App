// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:doorstep_company_app/api/api_endpoints.dart';
import 'package:doorstep_company_app/components/custom_snackbar.dart';
import 'package:doorstep_company_app/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SuggestionController extends GetxController {
  var isLoading = false.obs;
  final SharedPrefs prefs = SharedPrefs();
  Future<void> postSuggestion(String suggestion, BuildContext context) async {
    final token = await prefs.getToken();
    try {
      isLoading(true);
      final response = await http.post(Uri.parse(ApiEndpoints.suggestion), headers: {
        'Authorization': 'Bearer $token',
      }, body: {
        'suggestion': suggestion
      });
      log('StatusCode: ${response.statusCode}');
      log('Response: ${response.body}');
      if (response.statusCode == 201) {
        showSuccessSnackbar(context, 'Suggestion posted successfully!');
      } else if (response.statusCode == 401) {
        showErrorSnackbar(context, 'Please login first to continue');
      } else {
        showErrorSnackbar(context, 'Something went wrong! try again later.');
      }
    } catch (e) {
      log('ERROR: $e');
    } finally {
      isLoading(false);
    }
  }
}
