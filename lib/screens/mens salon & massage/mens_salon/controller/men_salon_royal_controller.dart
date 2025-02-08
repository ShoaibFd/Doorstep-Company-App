import 'package:get/get.dart';

import '../../../../app_controllers/price_controller.dart';

class MenRoyalPackagesController extends GetxController {
  var count = 0.obs;
  final PriceController priceController = Get.find(); 

  void increment() {
    count++;
    priceController.increment(); 
  }

  void decrement() {
    if (count > 0) {
      count--;
      priceController.decrement(); 
    }
  }
}

class MenRoyalGroomingController extends GetxController {
  var count = 0.obs;
  final PriceController priceController = Get.find();

  void increment() {
    count++;
    priceController.increment();
  }

  void decrement() {
    if (count > 0) {
      count--;
      priceController.decrement();
    }
  }
}

class MenRoyalGlowController extends GetxController {
  var count = 0.obs;
  final PriceController priceController = Get.find();

  void increment() {
    count++;
    priceController.increment();
  }

  void decrement() {
    if (count > 0) {
      count--;
      priceController.decrement();
    }
  }
}

class MenRoyalCutController extends GetxController {
  var count = 0.obs;
  final PriceController priceController = Get.find();

  void increment() {
    count++;
    priceController.increment();
  }

  void decrement() {
    if (count > 0) {
      count--;
      priceController.decrement();
    }
  }
}
