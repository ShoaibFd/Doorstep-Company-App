import 'package:get/get.dart';
import '../../../app_controllers/price_controller.dart';

class AcPackagesController extends GetxController {
  var count = 0.obs;
  final PriceController priceController = Get.find(); // Access PriceController

  void increment() {
    count++;
    priceController.increment(); // Update price
  }

  void decrement() {
    if (count > 0) {
      count--;
      priceController.decrement(); // Update price
    }
  }
}

class AcServicesController extends GetxController {
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

class AcRepairController extends GetxController {
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

class AcInstallationController extends GetxController {
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
