// reels_controller.dart
import 'dart:convert';

import 'package:doorstep_company_app/api/api_endpoints.dart';
import 'package:doorstep_company_app/utils/enum/reel_enum.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/reels/reels_model.dart';

class ReelsController extends GetxController {
  final ReelType reelType;
  ReelsController(this.reelType);
  // Observable variables
  var isLoading = false.obs;
  var reelsList = <ReelModel>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchReels();
  }

  Future<void> fetchReels() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse("${ApiEndpoints.reels}/${reelType.value}"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final ReelsResponse reelsResponse = ReelsResponse.fromJson(jsonDecode(response.body));
        if (reelsResponse.success == true) {
          reelsList.assignAll(reelsResponse.data ?? []);
        } else {
          errorMessage.value = reelsResponse.message ?? 'Failed to load reels';
        }
      } else {
        errorMessage.value = 'Error ${response.statusCode}: ${response.reasonPhrase}';
      }
    } catch (e) {
      errorMessage.value = 'Error fetching reels: ${e.toString()}';
    } finally {
      isLoading(false);
    }
  }

  // Get reels by position
  List<ReelModel> getReelsByPosition(String position) {
    return reelsList.where((reel) => reel.reelsPosition?.position?.toLowerCase() == position.toLowerCase()).toList();
  }

  // Refresh reels data
  Future<void> refreshReels() async {
    errorMessage.value = '';
    await fetchReels();
  }
}

// reels_binding.dart

class ReelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReelsController>(() => ReelsController(ReelType.offers));
  }
}
