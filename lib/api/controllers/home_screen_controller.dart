import 'dart:developer';

import 'package:doorstep_company_app/api/controllers/categories/category_controller.dart';
import 'package:get/get.dart';

import 'categories/subscription_package_controller.dart';

class HomeController extends GetxController {
  final subscriptionController = Get.put(SubscriptionPackageController());
  final categoryController = Get.put(CategoryController());

  bool isLoading = true;
  List categoryHeadings = [];
  List categories = [];
  List subscription = [];

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    isLoading = true;
    update();

    try {
      final heading = await subscriptionController.fetchSubscriptionPackages();
      final categoriesData = await categoryController.fetchCategories();
      final subscriptionData = await subscriptionController.fetchSubscriptionPackages();

      categoryHeadings = heading!.data?.subscriptionPackages ?? [];
      categories = categoriesData?.data ?? [];
      subscription = subscriptionData?.data?.subscriptionPackages ?? [];
    } catch (error) {
      log('Error fetching data: $error');
    } finally {
      isLoading = false;
      update();
    }
  }
}
