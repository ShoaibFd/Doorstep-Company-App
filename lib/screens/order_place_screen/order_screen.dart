import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/custom_container.dart';
import '../../components/app_text.dart';
import '../../constants/colors.dart';
import '../auth/app_textfield.dart';
import 'shipping_address_screen.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final ItemController itemController = Get.put(ItemController());
  final voucherController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: AppColors.whiteTheme,
            backgroundColor: AppColors.darkBlueShade,
            title: appText('Cart', fontSize: 20.px, fontWeight: FontWeight.w400, color: AppColors.whiteTheme)),
        backgroundColor: AppColors.darkBlueShade,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 9.px, backgroundColor: AppColors.yellowColor, child: appText('1')),
                  Container(height: 1.px, width: 110.px, color: AppColors.whiteTheme),
                  CircleAvatar(radius: 10.px, backgroundColor: AppColors.whiteTheme, child: appText('2')),
                  Container(height: 1.px, width: 110.px, color: AppColors.whiteTheme),
                  CircleAvatar(radius: 9.px, backgroundColor: AppColors.whiteTheme, child: appText('3')),
                ],
              ),
            ),
            SizedBox(height: 8.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Row(
                children: [
                  SizedBox(width: 44.px),
                  appText('Cart', color: AppColors.yellowColor),
                  SizedBox(width: 100.px),
                  appText('Address', color: AppColors.whiteTheme),
                  SizedBox(width: 80.px),
                  appText('Checkout', color: AppColors.whiteTheme),
                ],
              ),
            ),
            SizedBox(height: 30.px),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: appText('Shopping Cart',
                    fontSize: 30.px, fontWeight: FontWeight.bold, color: AppColors.whiteTheme)),
            SizedBox(height: 40.px),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 657.px,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: AppColors.whiteTheme,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 8.px),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.px),
                                    appText('DC Items', fontSize: 18, fontWeight: FontWeight.bold),
                                    SizedBox(height: 10.px),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomContainer(
                                          height: 70.px,
                                          width: 70.px,
                                          borderRadius: 8,
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://cdn.pixabay.com/photo/2021/09/08/07/20/air-conditioner-6605973_1280.jpg'),
                                              fit: BoxFit.cover),
                                          child: const SizedBox(),
                                        ),
                                        SizedBox(width: 10.px),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  appText('Rear samsung inverter',
                                                      fontSize: 16, fontWeight: FontWeight.w400),
                                                  CustomContainer(
                                                    height: 30.px,
                                                    width: 110.px,
                                                    borderRadius: 20.px,
                                                    borderColor: AppColors.blueColor,
                                                    color: AppColors.whiteTheme,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () => itemController.decrement(),
                                                            icon: const Icon(Icons.remove,
                                                                color: AppColors.blueColor, size: 14)),
                                                        Obx(() {
                                                          return appText(itemController.item.toString());
                                                        }),
                                                        IconButton(
                                                            onPressed: () => itemController.increment(),
                                                            icon: const Icon(Icons.add,
                                                                color: AppColors.blueColor, size: 14))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.px),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  CustomContainer(
                                                      height: 26.px,
                                                      width: 70.px,
                                                      borderRadius: 4,
                                                      color: AppColors.greenColor,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Image.asset('assets/images/delivery.png',
                                                              height: 30.px, color: AppColors.whiteTheme),
                                                          appText('FREE', color: AppColors.whiteTheme)
                                                        ],
                                                      )),
                                                  appText('PKR 1,400',
                                                      color: AppColors.blueColor,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(color: AppColors.grey300),
                                    SizedBox(height: 10.px),
                                    rowWidget(text1: 'Subtotal', text2: 'PKR 1400'),
                                    rowWidget(
                                        text1: 'Shipping',
                                        text2: 'PKR 145',
                                        color: AppColors.hintGrey,
                                        text3: 'PKR 180'),
                                    rowWidget(text1: 'Receive between', text2: '08 - 10 jan'),
                                    Divider(color: AppColors.grey300),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 20.px),
                            Row(
                              children: [
                                Icon(Icons.percent_rounded, color: AppColors.blueColor, size: 18.px),
                                appText('Have a discount voucher? Add it here',
                                    color: AppColors.hintGrey, fontWeight: FontWeight.bold)
                              ],
                            ),
                            SizedBox(height: 6.px),
                            appTextField(
                              hint: 'Enter voucher code',
                              controller: voucherController,
                              suffixIcon: CustomContainer(
                                  onTap: () {},
                                  margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 6.px),
                                  width: 80.px,
                                  color: AppColors.transparentColor,
                                  borderColor: AppColors.blueColor,
                                  child: Center(
                                    child: appText('Apply',
                                        color: AppColors.blueColor, fontWeight: FontWeight.bold, fontSize: 16.px),
                                  )),
                            ),
                            SizedBox(height: 20.px),
                            appText('2 Total Items', fontSize: 16.px, fontWeight: FontWeight.bold),
                            SizedBox(height: 8.px),
                            rowWidget(text1: 'Subtotal', text2: 'PKR 26, 200'),
                            SizedBox(height: 8.px),
                            rowWidget(text1: 'Shipping', text2: 'PKR 145', color: AppColors.hintGrey),
                            SizedBox(height: 20.px),
                            const Divider(),
                            rowWidget(
                                text1: 'Total(Incl.tax)',
                                text2: 'PKR 145',
                                color: AppColors.hintGrey,
                                fontWeight: FontWeight.normal),
                            SizedBox(height: 200.px)
                          ],
                        ),
                      ))),
            ),
          ],
        ),
        bottomSheet: Container(
            height: 100.px,
            width: double.maxFinite,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(0, -2),
                ),
              ],
              color: AppColors.whiteTheme,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appText('Total', fontWeight: FontWeight.bold),
                    appText('(incl.tax):', color: AppColors.hintGrey, fontSize: 12.px),
                    appText('PKR 26,544', color: AppColors.darkBlueShade, fontSize: 18.px, fontWeight: FontWeight.bold),
                  ],
                ),
                SizedBox(height: 6.px),
                CustomContainer(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ShippingAddressScreen()));
                    },
                    margin: EdgeInsets.symmetric(horizontal: 14.px),
                    height: 55.px,
                    color: AppColors.blueColor,
                    borderRadius: 40.px,
                    child: Center(
                        child: appText('Continue',
                            color: AppColors.whiteTheme, fontWeight: FontWeight.bold, fontSize: 18.px))),
              ],
            )));
  }
}

// row widget
Widget rowWidget({
  required String text1,
  required String text2,
  String? text3,
  Color? color,
  FontWeight? fontWeight,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      appText(text1, fontSize: 16.px, fontWeight: fontWeight ?? FontWeight.w400, color: color ?? AppColors.blackColor),
      Column(
        children: [
          appText(text2, fontSize: 16.px, color: AppColors.darkBlueShade, fontWeight: FontWeight.w400),
          appText(text3 ?? '',
              color: AppColors.hintGrey, fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough),
        ],
      ),
    ],
  );
}

// Controller
class ItemController extends GetxController {
  var item = 0.obs;

  void increment() {
    item++;
  }

  void decrement() {
    if (item > 0) {
      item--;
    }
  }
}
