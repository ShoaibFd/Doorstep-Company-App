import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';

class CustomItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onOptionsTap;
  final String optionsText;
  final String imagePath;
  final int initialItemCount;

  CustomItemWidget({
    super.key,
    required this.onTap,
    required this.onIncrement,
    required this.onDecrement,
    required this.onOptionsTap,
    required this.optionsText,
    required this.imagePath,
    required this.initialItemCount,
  });

  final CustomItemController controller = Get.put(CustomItemController());

  @override
  Widget build(BuildContext context) {
    // Initialize itemCount with the provided initialItemCount
    controller.itemCount.value = initialItemCount;

    return Stack(
      children: [
        // Custom Container with an Image
        Container(
          margin: const EdgeInsets.only(bottom: 140),
          height: 90,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Add or Increment/Decrement Button
        Obx(() {
          return GestureDetector(
            onTap: () {
              if (controller.itemCount.value == 0) {
                controller.resetCount();
                onTap();
              }
            },
            child: controller.itemCount.value > 0
                ? Container(
                    margin: const EdgeInsets.only(top: 80, left: 10),
                    height: 34,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.whiteTheme,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.lowPurple,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Decrement Button
                        InkWell(
                          onTap: () {
                            controller.decrement();
                            onDecrement();
                          },
                          child: const Icon(
                            Icons.remove,
                            size: 16,
                            color: AppColors.lowPurple,
                          ),
                        ),

                        // Item Count Text
                        Text(
                          controller.itemCount.value.toString(),
                          style: const TextStyle(
                            color: AppColors.lowPurple,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Increment Button
                        InkWell(
                          onTap: () {
                            controller.increment();
                            onIncrement();
                          },
                          child: const Icon(
                            Icons.add,
                            size: 16,
                            color: AppColors.lowPurple,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 80, left: 10),
                    height: 34,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Add',
                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.lowPurple),
                      ),
                    ),
                  ),
          );
        }),

        // Options Text
        GestureDetector(
          onTap: onOptionsTap,
          child: Container(
            margin: const EdgeInsets.only(top: 120, left: 24),
            child: Text(
              optionsText,
            ),
          ),
        ),
      ],
    );
  }
}

// Controller

class CustomItemController extends GetxController {
  RxInt itemCount = 0.obs;

  void increment() {
    itemCount++;
  }

  void decrement() {
    if (itemCount > 0) {
      itemCount--;
    }
  }

  void resetCount() {
    itemCount.value = 1;
  }
}
