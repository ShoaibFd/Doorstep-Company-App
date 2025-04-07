// ignore_for_file: use_build_context_synchronously

import 'package:doorstep_company_app/api/controllers/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/app_text.dart';
import '../../components/custom_container.dart';
import '../../theme/colors.dart';
import 'components/address_widget.dart';

class ShippingAddressScreen extends StatefulWidget {
  final List<int>? productId;
  final List<int>? quantity;
  final int? totalItems;
  final double? totalPrice;
  final String? voucherCode;

  const ShippingAddressScreen(
      {super.key, this.productId, this.quantity, this.totalItems, this.totalPrice, this.voucherCode});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final productsController = Get.put(ProductsController());
  final voucherController = TextEditingController();
  final fnameController = TextEditingController();
  final phoneController = TextEditingController();
  final houseController = TextEditingController();
  final landController = TextEditingController();
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.whiteTheme,
          backgroundColor: AppColors.darkBlueShade,
          title: appText(
            'Shipping Address',
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteTheme,
          ),
        ),
        backgroundColor: AppColors.darkBlueShade,
        body: Column(
          children: [
            // Progress indicator section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 9.r, backgroundColor: AppColors.yellowColor, child: appText('1')),
                  Container(height: 1.h, width: 110.w, color: AppColors.yellowColor),
                  CircleAvatar(radius: 10.r, backgroundColor: AppColors.yellowColor, child: appText('2')),
                  Container(height: 1.h, width: 110.w, color: AppColors.whiteTheme),
                  CircleAvatar(radius: 9.r, backgroundColor: AppColors.whiteTheme, child: appText('3')),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  SizedBox(width: 30.w),
                  appText('Cart', color: AppColors.yellowColor),
                  SizedBox(width: 90.w),
                  appText('Address', color: AppColors.yellowColor),
                  SizedBox(width: 76.w),
                  appText('Checkout', color: AppColors.whiteTheme),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: appText(
                'Select Address',
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteTheme,
              ),
            ),
            SizedBox(height: 40.h),
            // Form section
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteTheme,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addressWidget(
                          controller: fnameController,
                          fieldName: 'Your Full Name',
                          hint: 'Shoaib Lodhra',
                          verifyIcon: Icons.check_circle,
                          keyboardType: TextInputType.name,
                          icon: Icons.face),
                      SizedBox(height: 16.h),
                      addressWidget(
                          controller: phoneController,
                          fieldName: 'Your Phone Number',
                          hint: '03xxxxxxxxx',
                          keyboardType: TextInputType.phone,
                          icon: Icons.phone),
                      SizedBox(height: 16.h),
                      addressWidget(
                          controller: houseController,
                          fieldName: 'Where do you live',
                          hint: 'House No, street Area',
                          keyboardType: TextInputType.streetAddress,
                          icon: Icons.place_outlined),
                      SizedBox(height: 10.h),
                      TextFormField(
                          controller: landController,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              hintText: 'Land Mark',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)))),
                      SizedBox(height: 8.h),
                      appText('Optional field', color: AppColors.hintGrey),
                      SizedBox(height: 16.h),
                      addressWidget(
                        controller: cityController,
                        fieldName: 'City area',
                        hint: 'Select city area',
                        keyboardType: TextInputType.streetAddress,
                        icon: Icons.place_outlined,
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Container(
            color: AppColors.whiteTheme,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Obx(() {
                return CustomContainer(
                    isLoading: productsController.isLoading.value,
                    onTap: () async {
                      if (!productsController.isLoading.value) {
                        productsController.isLoading.value = true;
                        await productsController.postCheckoutDetail(
                          context: context,
                          totalItem: widget.totalItems,
                          totalPrice: widget.totalPrice,
                          productId: widget.productId,
                          voucherCode: widget.voucherCode,
                          qty: widget.quantity,
                          city: cityController.text.trim(),
                          fullName: fnameController.text.trim(),
                          phone: phoneController.text.trim(),
                          shippingAddress: houseController.text.trim(),
                          shippingAddress2: landController.text.trim(),
                        );
                        productsController.fetchCheckoutAddress(context);
                      }
                    },
                    margin: EdgeInsets.symmetric(horizontal: 14.w),
                    height: 55.h,
                    color: AppColors.blueColor,
                    borderRadius: 40.r,
                    child: Center(
                        child: appText('Continue',
                            color: AppColors.whiteTheme, fontWeight: FontWeight.bold, fontSize: 18.sp)));
              }),
            )));
  }
}
