import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  RxBool isSelected = false.obs;
  RxBool isHidden = true.obs;
  RxBool isHidden1 = true.obs;

  void selectToggle() {
    isSelected.value = !isSelected.value;
  }

  void showPassword() {
    isHidden.value = !isHidden.value;
  }

  void showConfirmPassword() {
    isHidden1.value = !isHidden1.value;
  }
}