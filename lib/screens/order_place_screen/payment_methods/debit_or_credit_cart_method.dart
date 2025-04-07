import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import '../../../components/round_button.dart';

class DebitOrCreditCartMethod extends StatefulWidget {
  const DebitOrCreditCartMethod({super.key});

  @override
  State<DebitOrCreditCartMethod> createState() => _DebitOrCreditCartMethodState();
}

class _DebitOrCreditCartMethodState extends State<DebitOrCreditCartMethod> {
  final creditController = TextEditingController();
  final nameController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Debit/Credit Card Payment')),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                  width: double.infinity,
                  borderRadius: 20.px,
                  color: AppColors.greenColor.withOpacity(0.2),
                  child: Padding(
                    padding: EdgeInsets.all(8.px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.lock_outline_rounded, color: AppColors.greenColor),
                        SizedBox(width: 10.px),
                        Expanded(
                          child: appText('All payment methods are encrypted & secure', color: AppColors.greenColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.px),
                appText('Debit/Credit card number', fontSize: 16, fontWeight: FontWeight.w400),
                SizedBox(height: 4.px),
                TextFormField(
                  controller: creditController,
                  decoration: InputDecoration(
                    hintText: '0000 0000 0000 0000',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20.px),
                appText('Name on card', fontSize: 16, fontWeight: FontWeight.w400),
                SizedBox(height: 4.px),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                SizedBox(height: 20.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Expiration Month', fontSize: 16, fontWeight: FontWeight.w400),
                          SizedBox(height: 4.px),
                          TextFormField(
                            controller: monthController,
                            decoration: InputDecoration(
                              hintText: 'MM',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.px),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Expiration Year', fontSize: 16, fontWeight: FontWeight.w400),
                          SizedBox(height: 4.px),
                          TextFormField(
                            controller: yearController,
                            decoration: InputDecoration(
                              hintText: 'YY',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.px),
                SizedBox(height: 20.px),
                Row(
                  children: [
                    appText('CVV', fontSize: 16, fontWeight: FontWeight.w400),
                    SizedBox(width: 10.px),
                    Icon(Icons.info_outline, color: AppColors.hintGrey)
                  ],
                ),
                SizedBox(height: 4.px),
                TextFormField(
                    controller: cvvController,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)))),
                SizedBox(height: 50.px),
                roundButton(title: 'Pay'),
                SizedBox(height: 5.px),
                appText('Session expires in 9m 53s', color: AppColors.hintGrey)
              ],
            ))));
  }
}
