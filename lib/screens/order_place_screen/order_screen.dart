// ignore_for_file: deprecated_member_use

import 'package:doorstep_company_app/api/controllers/products/products_controller.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:doorstep_company_app/screens/order_place_screen/shipping_address_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../api/models/products/view_cart_model.dart';
import '../../components/app_text.dart';
import '../../components/custom_container.dart';
import '../../theme/colors.dart';
import '../auth/app_textfield.dart';
import '../offers_screens/products/components/custom_row.dart';
import 'components/cart_bottom_sheet.dart';
import 'shipping_address_screen.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final ItemController itemController = Get.put(ItemController());
  final voucherController = TextEditingController();
  final productsController = Get.put(ProductsController());
  List<int> productsIds = [];
  int totalItems = 0;
  List<int> totalQuantity = [];
  @override
  Widget build(BuildContext context) {
    productsController.fetchCartData();
    return Scaffold(
      appBar: AppBar(
          foregroundColor: AppColors.whiteTheme,
          backgroundColor: AppColors.darkBlueShade,
          title: appText('Cart', fontSize: 18.sp, fontWeight: FontWeight.w400, color: AppColors.whiteTheme)),
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
                Container(height: 1.r, width: 110.w, color: AppColors.whiteTheme),
                CircleAvatar(radius: 10.r, backgroundColor: AppColors.whiteTheme, child: appText('2')),
                Container(height: 1.r, width: 110.w, color: AppColors.whiteTheme),
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
                appText('Address', color: AppColors.whiteTheme),
                SizedBox(width: 70.w),
                appText('Checkout', color: AppColors.whiteTheme),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child:
                  appText('Shopping Cart', fontSize: 27.sp, fontWeight: FontWeight.bold, color: AppColors.whiteTheme)),
          SizedBox(height: 40.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 657.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.whiteTheme,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
              child: Obx(() {
                if (productsController.isLoading.value) {
                  return Center(child: showLoading());
                }
                if (productsController.viewCart.value == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove_shopping_cart, size: 30.sp, color: AppColors.greyColor),
                      SizedBox(height: 6.h),
                      appText('Cart is empty!', fontSize: 14.sp, color: AppColors.greyColor),
                    ],
                  );
                }
                final items = productsController.viewCart.value?.data;
                totalItems = items?.length ?? 0; // Update totalItems here
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            itemCount: items?.length ?? 0,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              productsIds.add(productsController.viewCart.value!.data![index].productDetailId!);
                              totalQuantity.add(itemController.getQuantity(index));
                              final item = items?[index].productDetail;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.h),
                                  appText('DC Items', fontSize: 18, fontWeight: FontWeight.bold),
                                  SizedBox(height: 10.h),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //  Product Image
                                      CustomContainer(
                                        height: 70.h,
                                        width: 70.w,
                                        color: AppColors.grey300.withOpacity(0.3),
                                        borderRadius: 8.r,
                                        image: DecorationImage(
                                          image: NetworkImage(item?.previewImage ?? ""),
                                          fit: BoxFit.cover,
                                        ),
                                        child: const SizedBox(),
                                      ),
                                      SizedBox(width: 10.w),

                                      //  Product Details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                    width: 160.w,
                                                    child: appText(item?.productName ?? "",
                                                        fontSize: 14.sp, fontWeight: FontWeight.w400)),

                                                //  Quantity Counter
                                                GetBuilder<ItemController>(
                                                  builder: (controller) {
                                                    return CustomContainer(
                                                      height: 30.h,
                                                      width: 100.w,
                                                      borderRadius: 20.r,
                                                      borderColor: AppColors.blueColor,
                                                      color: AppColors.whiteTheme,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          IconButton(
                                                            onPressed: () => controller.decrement(index),
                                                            icon: Icon(Icons.remove,
                                                                color: AppColors.blueColor, size: 14.sp),
                                                          ),
                                                          appText(controller.getQuantity(index).toString()),
                                                          IconButton(
                                                            onPressed: () => controller.increment(index),
                                                            icon: Icon(Icons.add,
                                                                color: AppColors.blueColor, size: 14.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),

                                            //  Price & Delivery Charges
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomContainer(
                                                  height: 26.h,
                                                  borderRadius: 4,
                                                  color: AppColors.greenColor,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(4.r),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Image.asset('assets/images/delivery.png',
                                                            height: 30.h, color: AppColors.whiteTheme),
                                                        SizedBox(width: 4.w),
                                                        appText('Rs.${item?.deliveryCharges.toString() ?? ""}',
                                                            color: AppColors.whiteTheme)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                appText(
                                                  "PKR.${(item?.price ?? 0) * itemController.getQuantity(index)}",
                                                  color: AppColors.blueColor,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  Divider(color: AppColors.grey300),
                                  SizedBox(height: 10.h),

                                  //  Subtotal & Shipping
                                  rowWidget(
                                    text1: 'Subtotal',
                                    text2:
                                        "PKR.${(item?.price ?? 0) * itemController.getQuantity(index) + (item?.deliveryCharges ?? 0)}",
                                  ),
                                  rowWidget(
                                      text1: 'Shipping',
                                      text2: "PKR.${item?.deliveryCharges.toString() ?? ""}",
                                      color: AppColors.hintGrey,
                                      text3: 'PKR 180'),
                                  rowWidget(text1: 'Receive between', text2: "${item?.shippingDays ?? ""} days"),

                                  Divider(color: AppColors.grey300),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Icon(Icons.percent_rounded, color: AppColors.blueColor, size: 18.sp),
                              appText('Have a discount voucher? Add it here',
                                  color: AppColors.hintGrey, fontWeight: FontWeight.bold)
                            ],
                          ),
                          SizedBox(height: 6.h),
                          appTextField(
                            hint: 'Enter voucher code',
                            controller: voucherController,
                            suffixIcon: CustomContainer(
                                onTap: () {},
                                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                                width: 80.w,
                                color: AppColors.transparentColor,
                                borderColor: AppColors.blueColor,
                                child: Padding(
                                  padding: EdgeInsets.all(6.r),
                                  child: Center(
                                    child: appText('Apply',
                                        color: AppColors.blueColor, fontWeight: FontWeight.bold, fontSize: 15.sp),
                                  ),
                                )),
                          ),
                          SizedBox(height: 20.h),
                          appText(
                            "${(items?.length ?? 0).toString()} Total items",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 8.h),
                          rowWidget(text1: 'Subtotal', text2: 'PKR ${itemController.calculateTotalPrice()}'),
                          SizedBox(height: 8.h),
                          rowWidget(
                              text1: 'Shipping',
                              text2: 'PKR ${itemController.calculateTotalShipping().toString()}',
                              color: AppColors.hintGrey),
                          SizedBox(height: 20.h),
                          const Divider(),
                          rowWidget(
                              text1: 'Total(Incl.tax)',
                              text2: "PKR ${itemController.calculateTotalPrice().toString()}",
                              color: AppColors.hintGrey,
                              fontWeight: FontWeight.normal),
                          SizedBox(height: 200.h)
                        ],
                      ),
                    ));
              }),
            ),
          )
        ],
      ),
      bottomSheet: Obx(() {
        return CartBottomSheet(
          price: 'PKR ${itemController.calculateTotalPrice()}',
          onTap: () async {
            productsController.fetchCheckoutAddress(context);
            Get.to(() => productsController.checkoutAddress.value?.data == null
                ? ShippingAddressScreen(
                    voucherCode: voucherController.text.trim(),
                    productId: productsIds,
                    totalPrice: itemController.calculateTotalPrice(),
                    totalItems: totalItems,
                    quantity: totalQuantity,
                  )
                : ShippingAddressSummaryScreen(
                    productId: productsIds,
                    totalPrice: itemController.calculateTotalPrice(),
                    totalItems: totalItems,
                    quantity: totalQuantity,
                  ));
          },
        );
      }),
    );
  }
}

//

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
      int quantity = getQuantity(items.indexOf(item));
      total += (item.productDetail?.price ?? 0) * quantity + (item.productDetail?.deliveryCharges ?? 0);
    }

    return total;
  }

  num calculateTotalShipping() {
    num totalShipping = 0;
    final items = productsController.viewCart.value?.data ?? [];

    for (var item in items) {
      final deliveryCharges = item.productDetail?.deliveryCharges ?? 0;
      totalShipping += deliveryCharges;
    }

    return totalShipping.toInt();
  }
}
