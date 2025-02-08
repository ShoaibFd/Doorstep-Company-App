import 'package:get/get.dart';

import '../../../../app_controllers/price_controller.dart';

class MenPrimePackagesController extends GetxController {
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

class MenPrimeGroomingController extends GetxController {
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

class MenPrimeGlowController extends GetxController {
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

class MenPrimeCutController extends GetxController {
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
