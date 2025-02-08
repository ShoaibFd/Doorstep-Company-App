import 'package:get/get.dart';

import '../../../../app_controllers/price_controller.dart';

class MenPrimeMassagePackagesController extends GetxController {
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

class MenPrimeMassageGroomingController extends GetxController {
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

class MenPrimeMassageGlowController extends GetxController {
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

class MenPrimeMassageCutController extends GetxController {
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
