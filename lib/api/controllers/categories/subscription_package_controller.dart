import 'dart:convert';
import 'dart:developer';

import 'package:doorstep_company_app/api/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/category/packages_model.dart';
import '../../models/category/subscription_package_model.dart';

class SubscriptionPackageController extends GetxController {
  final isLoading = false.obs;
  final subscriptionPackagesModel = Rxn<SubscriptionPackagesModel>();
  final projects = Rxn<ProjectsModel>();

  @override
  void onInit() {
    super.onInit();
    fetchSubscriptionPackages();
    fetchProjects();
  }

  Future<SubscriptionPackagesModel?> fetchSubscriptionPackages() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(ApiEndpoints.subscriptionPackage),
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        subscriptionPackagesModel.value = SubscriptionPackagesModel.fromJson(responseData);
        return subscriptionPackagesModel.value;
      } else {
        log('Error in Subscription Packages: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in Subscription Packages: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
    return null;
  }

  Future<ProjectsModel?> fetchProjects() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(ApiEndpoints.projects),
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        projects.value = ProjectsModel.fromJson(responseData);
        return projects.value;
      } else {
        log('Error in Project Packages: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in Subscription Packages: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
    return null;
  }
}
