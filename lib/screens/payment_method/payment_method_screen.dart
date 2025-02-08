import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/custom_text.dart';
import '../../components/divider.dart';
import '../../components/round_button.dart';
import 'order_placed_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int payment = 0;
  int? selectedMethodIndex;

  final List<String> methodsName = [
    'Muhammad Shoaib',
    'Muhammad Shoaib',
    'Debit/Credit Card',
    'Muhammad Shoaib',
  ];
  final List<String> accNumbers = [
    '030******789',
    '030******789',
    'Card# 030******789',
    'Acc # 030******789',
  ];

  final List<String> paymentMethods = [
    'Jazzcash',
    'Easypaisa',
    'Credit/Debit Card',
    'Bank Account',
    'Cash After Service',
  ];

  final List<String> methodsImages = [
    'assets/images/jazz.png',
    'assets/images/easypaisa.png',
    'assets/images/atm-card.png',
    'assets/images/symbols.png',
  ];

  final List<String> dataImages = [
    'assets/images/jazz.png',
    'assets/images/easypaisa.png',
    'assets/images/atm-card.png',
    'assets/images/symbols.png',
    'assets/images/pay-bill.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Select Payment Method', fontSize: 20.px, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.px),
              appText('My saved payment methods', fontSize: 19.5.px, fontWeight: FontWeight.bold),
              SizedBox(height: 10.px),
              ListView.builder(
                itemCount: methodsName.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index >= methodsImages.length) return const SizedBox.shrink();
                  bool isSelected = selectedMethodIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMethodIndex = (selectedMethodIndex == index) ? null : index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 60.px,
                      decoration: BoxDecoration(
                        color: AppColors.whiteTheme,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: isSelected ? AppColors.lowPurple : Colors.transparent,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey300,
                            offset: const Offset(0, 0),
                            blurRadius: 1,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(image: AssetImage(methodsImages[index])),
                            ),
                          ),
                          SizedBox(width: 20.px),
                          index == 3
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText('Muhammad Shoaib', fontSize: 16),
                                    appText('UBL , ABC Branch', color: AppColors.hintGrey),
                                    appText('Acc # 030******789', color: AppColors.hintGrey),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText(methodsName[index], fontSize: 16),
                                    appText(accNumbers[index], color: AppColors.hintGrey),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 10.px),
              div(),
              SizedBox(height: 25.px),
              appText('Other payment methods', fontSize: 19.5.px, fontWeight: FontWeight.bold),
              SizedBox(height: 20.px),
              ListView.builder(
                itemCount: paymentMethods.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // Safeguard against out-of-bounds access
                  if (index >= dataImages.length) return const SizedBox.shrink();

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 60.px,
                    decoration: BoxDecoration(
                      color: AppColors.whiteTheme,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey300,
                          offset: const Offset(0, 0),
                          blurRadius: 1,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 55.px,
                          width: 55.px,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(image: AssetImage(dataImages[index])),
                          ),
                        ),
                        SizedBox(width: 20.px),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText(paymentMethods[index], fontSize: 16.px, fontWeight: FontWeight.bold),
                              appText('Jazzcash mobile account required', color: AppColors.hintGrey, fontSize: 12.px),
                            ],
                          ),
                        ),
                        Radio<int>(
                          value: index,
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 30.px),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 8, left: 16, right: 16),
        child: roundButton(
          textColor: selectedMethodIndex == null ? AppColors.blackColor : AppColors.whiteTheme,
          onTap: selectedMethodIndex != null
              ? () {
                  // showSuccessSnackbar(context, 'Your booking has been confirmed,');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPlacedScreen()));
                }
              : null,
          title: 'Continue',
          color: selectedMethodIndex == null ? AppColors.grey300 : AppColors.lowPurple,
        ),
      ),
    );
  }
}
