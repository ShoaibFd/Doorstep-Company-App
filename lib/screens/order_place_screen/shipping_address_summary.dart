import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../payment_process/address_bottom_sheet.dart';
import 'checkout_screen.dart';

class ShippingAddressSummaryScreen extends StatefulWidget {
  const ShippingAddressSummaryScreen({super.key});

  @override
  State<ShippingAddressSummaryScreen> createState() => _ShippingAddressSummaryScreenState();
}

class _ShippingAddressSummaryScreenState extends State<ShippingAddressSummaryScreen> {
  final voucherController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: AppColors.whiteTheme,
          backgroundColor: AppColors.darkBlueShade,
          title:
              appText('Shipping Address', fontSize: 18.px, fontWeight: FontWeight.w400, color: AppColors.whiteTheme)),
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
                Container(height: 1.px, width: 110.px, color: AppColors.yellowColor),
                CircleAvatar(radius: 10.px, backgroundColor: AppColors.yellowColor, child: appText('2')),
                Container(height: 1.px, width: 110.px, color: AppColors.yellowColor),
                CircleAvatar(radius: 9.px, backgroundColor: AppColors.yellowColor, child: appText('3')),
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
                appText('Address', color: AppColors.yellowColor),
                SizedBox(width: 80.px),
                appText('Checkout', color: AppColors.yellowColor),
              ],
            ),
          ),
          SizedBox(height: 30.px),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child:
                  appText('Select Address', fontSize: 30.px, fontWeight: FontWeight.bold, color: AppColors.whiteTheme)),
          SizedBox(height: 20.px),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 657.px,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.whiteTheme,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.px), topRight: Radius.circular(20.px))),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 8.px),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const AddressBottomSheet();
                                  });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.add, color: AppColors.blueColor, size: 18.px),
                                appText('Address',
                                    color: AppColors.blueColor, fontWeight: FontWeight.bold, fontSize: 16.px)
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CustomContainer(
                                    margin: EdgeInsets.only(top: 20.px),
                                    width: double.maxFinite,
                                    color: AppColors.transparentColor,
                                    borderRadius: 10.px,
                                    borderColor: AppColors.blueColor,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 12.px),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          appText('Shoaib Lodhra',
                                              fontSize: 18.px, fontWeight: FontWeight.bold, color: AppColors.blueColor),
                                          appText('Sabzazar coloney, Bosan Road',
                                              fontWeight: FontWeight.w400, fontSize: 16.px),
                                          appText('AbbotAbad',
                                              fontSize: 16.px, fontWeight: FontWeight.w400, color: AppColors.hintGrey),
                                          appText('03xxxxxxxx', fontSize: 16.px, fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                    ));
                              }),
                          SizedBox(height: 20.px),
                        ],
                      ),
                    ))),
          ),
        ],
      ),
      bottomSheet: CustomContainer(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckoutScreen()));
          },
          margin: EdgeInsets.symmetric(horizontal: 14.px, vertical: 10.px),
          height: 55.px,
          color: AppColors.blueColor,
          borderRadius: 40.px,
          child: Center(
            child: appText('Continue', color: AppColors.whiteTheme, fontWeight: FontWeight.bold, fontSize: 18.px),
          )),
    );
  }
}
