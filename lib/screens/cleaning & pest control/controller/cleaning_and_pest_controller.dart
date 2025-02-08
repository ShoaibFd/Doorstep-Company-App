import 'package:get/get.dart';
import '../../../app_controllers/price_controller.dart';

class CleaningPackagesController extends GetxController {
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

class CleaningBathController extends GetxController {
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

class CleaningServicesController extends GetxController {
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

class CleaningMiniServicesController extends GetxController {
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
