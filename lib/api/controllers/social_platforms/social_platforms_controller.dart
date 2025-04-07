import 'dart:convert';
import 'dart:developer';

import 'package:doorstep_company_app/api/api_endpoints.dart';
import 'package:doorstep_company_app/models/social_platform_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SocialPlatformsController extends GetxController {
  var isLoading = false.obs;
  var platforms = Rxn<SocialPlatformModel>();

  @override
  void onInit() {
    fetchSocialPlatforms();
    super.onInit();
  }

  Future<SocialPlatformModel?> fetchSocialPlatforms() async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse(ApiEndpoints.socialPlatforms));

      log('Status Code in Platforms: ${response.statusCode}');
      log('Response: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        platforms.value = SocialPlatformModel.fromJson(responseData);
        return platforms.value;
      } else {
        log('API Error: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      log('Exception in SocialPlatformsController: $e');
    } finally {
      isLoading.value = false;
    }
    return platforms.value;
  }
}
