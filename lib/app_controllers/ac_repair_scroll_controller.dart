import 'package:get/get.dart';

class ScrollControllerX extends GetxController {
  var currentCategory = ''.obs;
  var showHeader = false.obs;

  void updateCategory(String category) {
    if (currentCategory.value != category) {
      currentCategory.value = category;
    }
  }
  void updateHeaderVisibility(bool isVisible) {
    if (showHeader.value != isVisible) {
      showHeader.value = isVisible;
    }
  }
}
