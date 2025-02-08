import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/custom_container.dart';
import '../../components/custom_snackbar.dart';
import '../../components/custom_text.dart';
import 'payment_methods/debit_or_credit_cart_method.dart';
import 'payment_methods/easypay_method.dart';
import 'payment_methods/jazzcash_method.dart';
import 'payment_methods/online_bank_transfer_method.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final voucherController = TextEditingController();
  String selectedPaymentMethod = '';
  bool isChecked = false;

  // Payment method widget - moved inside the state class
  Widget paymentMethodRow({
    Widget? child,
    required String paymentMethod,
    required String value,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedPaymentMethod = value;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.px, horizontal: 4.px),
        child: Row(
          children: [
            Container(
              height: 20.px,
              width: 20.px,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedPaymentMethod == value ? AppColors.greenColor : AppColors.grey300,
                  width: 2.px,
                ),
                color: selectedPaymentMethod == value ? AppColors.greenColor : AppColors.whiteTheme,
              ),
              child: selectedPaymentMethod == value
                  ? Center(
                      child: Icon(
                        Icons.check,
                        size: 13.px,
                        color: AppColors.whiteTheme,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 12.px),
            Container(
              height: 24.px,
              width: 30.px,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.px), color: AppColors.transparentColor),
              child: child,
            ),
            SizedBox(width: 20.px),
            appText(paymentMethod, fontSize: 14.px, fontWeight: FontWeight.w400),
          ],
        ),
      ),
    );
  }

  // Checkout Row can stay outside as it doesn't need access to state
  Widget checkoutRow({required String text1, required String text2}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appText(
            text1,
          ),
          appText(text2, fontWeight: FontWeight.bold, fontSize: 13.px, color: AppColors.blueColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: AppColors.whiteTheme,
          backgroundColor: AppColors.darkBlueShade,
          title: appText('Checkout', fontSize: 18.px, fontWeight: FontWeight.w400, color: AppColors.whiteTheme)),
      backgroundColor: AppColors.darkBlueShade,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 10.px, backgroundColor: AppColors.yellowColor, child: appText('1')),
                Container(height: 1, width: 130.px, color: AppColors.yellowColor),
                CircleAvatar(radius: 10, backgroundColor: AppColors.yellowColor, child: appText('2')),
                Container(height: 1.px, width: 130.px, color: AppColors.yellowColor),
                CircleAvatar(radius: 10.px, backgroundColor: AppColors.yellowColor, child: appText('3')),
              ],
            ),
          ),
          SizedBox(height: 8.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Row(
              children: [
                SizedBox(width: 26.px),
                appText('Cart', color: AppColors.yellowColor),
                SizedBox(width: 110.px),
                appText('Address', color: AppColors.yellowColor),
                SizedBox(width: 90.px),
                appText('Checkout', color: AppColors.yellowColor),
              ],
            ),
          ),
          SizedBox(height: 30.px),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: appText('Checkout', fontSize: 30.px, fontWeight: FontWeight.bold, color: AppColors.whiteTheme)),
          SizedBox(height: 40.px),
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
                          SizedBox(height: 20.px),
                          CustomContainer(
                              width: double.maxFinite,
                              borderRadius: 20.px,
                              color: AppColors.greenColor.withOpacity(0.2),
                              child: Padding(
                                padding: EdgeInsets.all(8.px),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.lock_outline_rounded, color: AppColors.greenColor),
                                    appText('Your transaction is guaranteed to be 100% secure')
                                  ],
                                ),
                              )),
                          SizedBox(height: 12.px),
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: AppColors.whiteTheme,
                                borderRadius: BorderRadius.circular(8.px),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(1, 1),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      color: AppColors.grey300)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.px),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      appText('Checkout details', fontSize: 16.px),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isChecked = !isChecked;
                                            });
                                          },
                                          icon: Icon(
                                              isChecked ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up,
                                              color: AppColors.blueColor))
                                    ],
                                  ),
                                ),
                                isChecked
                                    ? Column(
                                        children: [
                                          const Divider(),
                                          checkoutRow(text1: 'Subtotal', text2: 'PKR 44,300'),
                                          SizedBox(height: 4.px),
                                          checkoutRow(text1: 'Shipping charges', text2: 'PKR 300'),
                                        ],
                                      )
                                    : const SizedBox(),
                                SizedBox(height: 10.px)
                              ],
                            ),
                          ),
                          SizedBox(height: 10.px),
                          paymentMethodRow(
                              paymentMethod: 'Debit/Credit Card',
                              value: 'card',
                              child: const Icon(Icons.wallet_travel_outlined)),
                          const Divider(),
                          paymentMethodRow(
                              paymentMethod: 'Jazzcash Mobile Account',
                              value: 'jazzcash',
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.px),
                                  child: Image.asset('assets/images/jazzcash.png'))),
                          const Divider(),
                          paymentMethodRow(
                              paymentMethod: 'EasyPay Mobile Account',
                              value: 'easypay',
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset('assets/images/easypesa.png'))),
                          const Divider(),
                          paymentMethodRow(
                              paymentMethod: 'Online Bank Transfer',
                              value: 'bank',
                              child: const Icon(Icons.account_balance_outlined)),
                          const Divider(),
                          paymentMethodRow(
                              paymentMethod: 'Cash on Delivery',
                              value: 'cod',
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset('assets/images/delivery.png'))),
                          SizedBox(height: 200.px)
                        ],
                      ),
                    ))),
          ),
        ],
      ),
      bottomSheet: Material(
        elevation: 4,
        child: Container(
          height: 100.px,
          width: double.maxFinite,
          color: AppColors.whiteTheme,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appText('Total', fontWeight: FontWeight.bold),
                  SizedBox(width: 4.px),
                  appText('(incl.tax):', color: AppColors.hintGrey, fontSize: 12.px),
                  SizedBox(width: 4.px),
                  appText('PKR 26,544', color: AppColors.darkBlueShade, fontSize: 18.px, fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 10.px),
              CustomContainer(
                onTap: () {
                  if (selectedPaymentMethod.isEmpty) {
                    showErrorSnackbar(context, 'Please select a payment method');
                  } else {
                    switch (selectedPaymentMethod) {
                      case 'card':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DebitOrCreditCartMethod()),
                        );
                        break;
                      case 'jazzcash':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const JazzcashMethod()),
                        );
                        break;
                      case 'easypay':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EasyPayMethod()),
                        );
                        break;
                      case 'bank':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OnlineBankTransferMethod()),
                        );
                        break;
                      case 'cod':
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => CashOnDeliveryScreen()),
                        // );
                        break;
                      default:
                        showErrorSnackbar(context, 'Invalid payment method selected');
                        break;
                    }
                  }
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
            ],
          ),
        ),
      ),
    );
  }
}
