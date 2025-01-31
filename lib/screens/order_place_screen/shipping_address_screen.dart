import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import 'shipping_address_summary.dart';
import 'widgets/address_widget.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final voucherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteTheme,
        backgroundColor: AppColors.darkBlueShade,
        title: appText(
          'Shipping Address',
          fontSize: 20.px,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteTheme,
        ),
      ),
      backgroundColor: AppColors.darkBlueShade,
      body: Column(
        children: [
          // Progress indicator section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 9.px, backgroundColor: AppColors.yellowColor, child: appText('1')),
                Container(height: 1.px, width: 110.px, color: AppColors.yellowColor),
                CircleAvatar(radius: 10.px, backgroundColor: AppColors.yellowColor, child: appText('2')),
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
                appText('Address', color: AppColors.yellowColor),
                SizedBox(width: 80.px),
                appText('Checkout', color: AppColors.whiteTheme),
              ],
            ),
          ),
          SizedBox(height: 30.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: appText(
              'Select Address',
              fontSize: 30.px,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteTheme,
            ),
          ),
          SizedBox(height: 40.px),
          // Form section
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteTheme,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.px),
                  topRight: Radius.circular(20.px),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 8.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addressWidget(
                        fieldName: 'Your Full Name',
                        hint: 'Shoaib Lodhra',
                        verifyIcon: Icons.check_circle,
                        keyboardType: TextInputType.name,
                        icon: Icons.face),
                    SizedBox(height: 16.px),
                    addressWidget(
                        fieldName: 'Your Phone Number',
                        hint: '03xxxxxxxxx',
                        keyboardType: TextInputType.phone,
                        icon: Icons.phone),
                    SizedBox(height: 16.px),
                    addressWidget(
                        fieldName: 'Where do you live',
                        hint: 'House No, street Area',
                        keyboardType: TextInputType.streetAddress,
                        icon: Icons.place_outlined),
                    SizedBox(height: 10.px),
                    TextFormField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.hintGrey),
                            hintText: 'Land Mark',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.px)))),
                    SizedBox(height: 8.px),
                    appText('Optional field', color: AppColors.hintGrey),
                    SizedBox(height: 16.px),
                    addressWidget(
                      fieldName: 'City area',
                      hint: 'Select city area',
                      keyboardType: TextInputType.streetAddress,
                      icon: Icons.place_outlined,
                    ),
                    SizedBox(height: 30.px),
                    CustomContainer(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShippingAddressSummaryScreen(),
                          ),
                        );
                      },
                      margin: EdgeInsets.symmetric(horizontal: 14.px),
                      height: 55.px,
                      color: AppColors.blueColor,
                      borderRadius: 40.px,
                      child: Center(
                        child: appText(
                          'Continue',
                          color: AppColors.whiteTheme,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.px,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
