import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api_endpoints.dart';
import '../../../utils/enum/banner_enums.dart';
import '../../models/banner/banners_model.dart';

class BannersController extends GetxController {
  final BannerType bannerType;
  BannersController(this.bannerType);

  var isLoading = false.obs;
  var banners = Rxn<BannersModel>();
  RxList<String> bannerImages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    isLoading.value = true;
    try {
      String url = "${ApiEndpoints.banners}/${bannerType.value}";
      final response = await http.get(Uri.parse(url));
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        banners.value = BannersModel.fromJson(responseData);
        getBannerImages();
      } else {
        banners.value = null;
      }
    } catch (e) {
      log("Error fetching banners: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void getBannerImages() {
    bannerImages.clear();
    if (banners.value?.data != null) {
      bannerImages.addAll(banners.value!.data!.map((e) => e.bannerImage.toString()));
    }
  }
}
