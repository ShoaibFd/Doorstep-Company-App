import 'package:get/get.dart';

class LanguagesController extends GetxController {
  RxString selectedLanguage = 'English'.obs;

  void changeLanguage(String value) {
    selectedLanguage.value = value;
  }
}
