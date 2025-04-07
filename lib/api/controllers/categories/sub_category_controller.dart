// Women Spa SubCategories
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api_endpoints.dart';
import '../../models/category/category_subtitle_model.dart';
import '../../models/category/sub_category_model.dart';

class SubCategoryController extends GetxController {
  var isLoading = false.obs;
  var subCategories = Rxn<SubcategoryModel>();
  var categorySubtitle = Rxn<CategorySubtitleModel>();

  // SubCategories
  Future<SubcategoryModel?> fetchSubcategories(int? id, {int? tempId, String? tempName}) async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${ApiEndpoints.subCategory}/$id'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        subCategories.value = SubcategoryModel.fromJson(responseData);
        return subCategories.value;
      } else {
        log('Failed to fetch Subcategories. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error fetching services: $e');
      return null;
    } finally {
      isLoading(false);
    }
  }

  Future<CategorySubtitleModel?> fetchCategorySubtitle() async {
    try {
      isLoading(true);

      final response = await http.get(Uri.parse(ApiEndpoints.categorySubtitle));

      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData == null) {
          log('ERROR: Received null response from API');
          return null;
        }

        categorySubtitle.value = CategorySubtitleModel.fromJson(responseData);
        return categorySubtitle.value;
      } else {
        log('ERROR in fetching category subtitle: ${response.statusCode}');
        throw Exception("Failed to load category subtitle, Status Code: ${response.statusCode}");
      }
    } catch (error) {
      log('Exception in fetchCategorySubtitle: $error');
      return null;
    } finally {
      isLoading(false);
    }
  }
}
