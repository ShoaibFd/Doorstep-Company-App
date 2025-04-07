// Controller
import 'package:get/get.dart';

import '../../api/controllers/products/products_controller.dart';
import '../../api/models/products/view_cart_model.dart';

class ItemController extends GetxController {
  var itemQuantities = <int, int>{}.obs;
  var viewCart = Rxn<ViewCartModel>();
  final productsController = Get.put(ProductsController());

  void increment(int index) {
    itemQuantities[index] = (itemQuantities[index] ?? 1) + 1;
    update();
  }

  void decrement(int index) {
    if (itemQuantities[index] != null && itemQuantities[index]! > 1) {
      itemQuantities[index] = itemQuantities[index]! - 1;
      update();
    }
  }

  int getQuantity(int index) {
    return itemQuantities[index] ?? 1;
  }

  double calculateTotalPrice() {
    double total = 0;
    final items = productsController.viewCart.value?.data ?? [];

    for (var item in items) {
      int quantity = getQuantity(items.indexOf(item)); // ✅ Direct function call
      total += (item.productDetail?.price ?? 0) * quantity + (item.productDetail?.deliveryCharges ?? 0);
    }

    return total;
  }
}
