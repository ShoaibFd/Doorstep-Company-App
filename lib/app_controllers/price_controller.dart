import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class PriceController extends GetxController {
  RxDouble totalPrice = 0.0.obs;
  RxDouble savings = 0.0.obs;
  RxBool showConfetti = false.obs;
  late ConfettiController confettiController;

  @override
  void onInit() {
    super.onInit();
    confettiController = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }

  // Increment Function
  void increment() {
    const double itemPrice = 300;
    const double itemSavings = 200;

    totalPrice.value += itemPrice;
    savings.value += itemSavings;

    if (savings.value >= itemSavings && !showConfetti.value) {
      showConfetti.value = true;
      confettiController.play();
    }
  }

  // Decrement Function
  void decrement() {
    const double itemPrice = 300;
    const double itemSavings = 200;

    if (totalPrice.value - itemPrice >= 0) {
      totalPrice.value -= itemPrice;
    } else {
      totalPrice.value = 0;
    }

    if (savings.value - itemSavings >= 0) {
      savings.value -= itemSavings;
    } else {
      savings.value = 0;
    }

    if (savings.value < itemSavings) {
      showConfetti.value = false;
    }
  }
}
