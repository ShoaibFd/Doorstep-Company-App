import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../api/controllers/products/products_controller.dart';
import '../../components/app_text.dart';
import '../../components/custom_snackbar.dart';
import '../../components/round_button.dart';
import '../../theme/colors.dart';

class AddressController extends GetxController {
  var selectedAddress = 'Home'.obs;
  final cityController = TextEditingController();
  final areaController = TextEditingController();
  final streetController = TextEditingController();
  final villaController = TextEditingController();

  @override
  void onClose() {
    cityController.dispose();
    areaController.dispose();
    streetController.dispose();
    villaController.dispose();
    super.onClose();
  }
}

class AddressBottomSheet {
  static void show(BuildContext context) { // Accept context
    final addressController = Get.put(AddressController());
    final productsController = Get.put(ProductsController());

    void submitAddress() {
      if (addressController.cityController.text.isEmpty ||
          addressController.areaController.text.isEmpty ||
          addressController.streetController.text.isEmpty ||
          addressController.villaController.text.isEmpty) {
        showErrorSnackbar(context, 'Please fill in all fields.'); // Use passed context
        return;
      }

      productsController.updateShippingAddress(
        context: context, // Use passed context
        city: addressController.cityController.text,
        area: addressController.areaController.text,
        streetName: addressController.streetController.text,
        appartment: addressController.villaController.text,
        addressType: addressController.selectedAddress.value,
      );

      Get.back();
    }

    Get.bottomSheet(
      Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: BoxDecoration(
              color: AppColors.whiteTheme,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.px)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20.px),
                    appText('Enter Address Details', fontSize: 20.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 20.px),

                    // Address Type Selection
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: ['Home', 'Office', 'Other'].map((type) {
                            return GestureDetector(
                              onTap: () => addressController.selectedAddress.value = type,
                              child: Container(
                                height: 34.px,
                                width: 80.px,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.px),
                                  color: addressController.selectedAddress.value == type
                                      ? AppColors.blueColor
                                      : AppColors.transparentColor,
                                  border: Border.all(
                                    color: addressController.selectedAddress.value == type
                                        ? AppColors.transparentColor
                                        : AppColors.grey300,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: appText(type,
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.bold,
                                    color: addressController.selectedAddress.value == type
                                        ? AppColors.whiteTheme
                                        : AppColors.blackColor),
                              ),
                            );
                          }).toList(),
                        )),
                    SizedBox(height: 20.px),

                    TextFormField(
                      controller: addressController.cityController,
                      cursorColor: AppColors.blueColor,
                      decoration: InputDecoration(
                        label: appText('City', fontSize: 16.px),
                        hintText: 'Dubai',
                        hintStyle: TextStyle(color: AppColors.hintGrey),
                      ),
                    ),
                    SizedBox(height: 10.px),

                    TextFormField(
                      controller: addressController.areaController,
                      cursorColor: AppColors.blueColor,
                      decoration: InputDecoration(
                        label: appText('Area', fontSize: 16.px),
                        hintText: 'Select Area',
                        hintStyle: TextStyle(color: AppColors.hintGrey),
                      ),
                    ),
                    SizedBox(height: 10.px),

                    TextFormField(
                      controller: addressController.streetController,
                      cursorColor: AppColors.blueColor,
                      decoration: InputDecoration(
                        label: appText('Building/Street Name', fontSize: 16.px),
                        hintText: 'Building/Street Name',
                        hintStyle: TextStyle(color: AppColors.hintGrey),
                      ),
                    ),
                    SizedBox(height: 10.px),

                    TextFormField(
                      controller: addressController.villaController,
                      cursorColor: AppColors.blueColor,
                      decoration: InputDecoration(
                        label: appText('Apartment/Villa Number', fontSize: 16.px),
                        hintText: 'Apartment/Villa Number',
                        hintStyle: TextStyle(color: AppColors.hintGrey),
                      ),
                    ),
                    SizedBox(height: 20.px),

                    // Save Button
                    Obx(() {
                      return roundButton(
                        isLoading: productsController.isLoading.value,
                        onTap: () => submitAddress(),
                        title: 'Save',
                      );
                    }),
                    SizedBox(height: 10.px),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: -50.px,
            right: 16.px,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const CircleAvatar(
                backgroundColor: AppColors.whiteTheme,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
      isDismissible: true,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}
