import 'package:get/get.dart';

import '../../../../app_controllers/price_controller.dart';

class WomenStudioPackageController extends GetxController {
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

class WomenStudioProfessionalController extends GetxController {
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

class WomenStudioOwnPackageController extends GetxController {
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

class WomenStudioStyleController extends GetxController {
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
