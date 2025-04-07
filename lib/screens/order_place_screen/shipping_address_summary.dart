// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, use_build_context_synchronously

import 'package:doorstep_company_app/components/custom_snackbar.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../api/controllers/products/products_controller.dart';
import '../../components/app_text.dart';
import '../../components/custom_container.dart';
import '../../theme/colors.dart';
import '../payment_process/address_bottom_sheet.dart';
import 'checkout_screen.dart';

class ShippingAddressSummaryScreen extends StatefulWidget {
  const ShippingAddressSummaryScreen({
    super.key,
    this.productId,
    this.quantity,
    this.totalItems,
    this.totalPrice,
  });

  final List<int>? productId;
  final List<int>? quantity;
  final int? totalItems;
  final double? totalPrice;

  @override
  _ShippingAddressSummaryScreenState createState() => _ShippingAddressSummaryScreenState();
}

class _ShippingAddressSummaryScreenState extends State<ShippingAddressSummaryScreen> {
  final productsController = Get.put(ProductsController());
  int? selectedAddressIndex;

  @override
  void initState() {
    productsController.fetchCheckoutAddress(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteTheme,
        backgroundColor: AppColors.darkBlueShade,
        title: Text(
          'Shipping Address',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: AppColors.whiteTheme),
        ),
      ),
      backgroundColor: AppColors.darkBlueShade,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 9.r, backgroundColor: AppColors.yellowColor, child: appText('1')),
                Container(height: 1.h, width: 110.w, color: AppColors.yellowColor),
                CircleAvatar(radius: 10.r, backgroundColor: AppColors.yellowColor, child: appText('2')),
                Container(height: 1.h, width: 110.w, color: AppColors.yellowColor),
                CircleAvatar(radius: 9.r, backgroundColor: AppColors.yellowColor, child: appText('3')),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 25.w),
                appText('Cart', color: AppColors.yellowColor),
                SizedBox(width: 96.w),
                appText('Address', color: AppColors.yellowColor),
                SizedBox(width: 66.w),
                appText('Checkout', color: AppColors.yellowColor),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Select Address',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color: AppColors.whiteTheme),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteTheme,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AddressBottomSheet.show(context); 
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.add, color: AppColors.blueColor, size: 18.sp),
                          Text(
                            'Add Address',
                            style: TextStyle(color: AppColors.blueColor, fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(() {
                        if (productsController.isLoading.value) {
                          return Center(child: showLoading());
                        }
                        final addresses = productsController.checkoutAddress.value?.data;
                        if (addresses == null || addresses.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home_filled, color: AppColors.greyColor, size: 50.sp),
                                Text('No address added yet!',
                                    style: TextStyle(fontSize: 16.sp, color: AppColors.greyColor)),
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: addresses.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final address = addresses[index];
                            bool isSelected = selectedAddressIndex == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAddressIndex = index;
                                });
                              },
                              child: CustomContainer(
                                margin: EdgeInsets.only(top: 20.h),
                                width: double.infinity,
                                color: isSelected ? AppColors.blueColor.withOpacity(0.1) : AppColors.transparentColor,
                                borderRadius: 10.r,
                                borderColor: isSelected ? AppColors.blueColor : AppColors.grey300,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        address.fullName ?? "",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected ? AppColors.blueColor : AppColors.blackColor,
                                        ),
                                      ),
                                      Text(
                                        address.shippingAddress2 ?? "",
                                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
                                      ),
                                      Text(
                                        address.city!,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.hintGrey,
                                        ),
                                      ),
                                      Text(
                                        address.phoneNumber ?? "",
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: AppColors.whiteTheme,
        child: CustomContainer(
          onTap: () async {
            if (selectedAddressIndex != null) {
              final selectedAddress = productsController.checkoutAddress.value?.data?[selectedAddressIndex!];

              if (selectedAddress != null) {
                if (!productsController.isLoading.value) {
                  productsController.isLoading.value = true;

                  await productsController.postCheckoutDetail(
                    context: context,
                    totalItem: widget.totalItems,
                    totalPrice: widget.totalPrice,
                    productId: widget.productId,
                    qty: widget.quantity,
                  );

                  // Fetch updated checkout address
                  await productsController.fetchCheckoutAddress(context);

                  // Navigate to CheckoutScreen after posting details
                  Get.to(() => CheckoutScreen(selectedAddress: selectedAddress.toJson()));
                }
              } else {
                showErrorSnackbar(context, "Selected address data is null.");
              }
            } else {
              showInfoSnackbar(context, "Please select an address before continuing.");
            }
          },
          margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          height: 55.h,
          color: AppColors.blueColor,
          borderRadius: 40.r,
          child: Center(
            child: Text(
              'Continue',
              style: TextStyle(color: AppColors.whiteTheme, fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          ),
        ),
      ),
    );
  }
}
