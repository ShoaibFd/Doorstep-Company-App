import 'dart:convert';
import 'dart:developer';

import 'package:doorstep_company_app/api/api_endpoints.dart';
import 'package:doorstep_company_app/utils/shared_prefs.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/category/category_model.dart';
import '../../models/category/template_settings_model.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;
  var categories = Rxn<CategoryModel>();
  var template = Rxn<TemplateSettingsModel>();
  final SharedPrefs sharedPrefs = SharedPrefs();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Categories
  Future<CategoryModel?> fetchCategories() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(ApiEndpoints.categories));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        categories.value = CategoryModel.fromJson(responseData);
        return categories.value;
      } else {
        log('Failed to fetch categories. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('ERROR FETCHING CATEGORIES: ${e.toString()}');
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
