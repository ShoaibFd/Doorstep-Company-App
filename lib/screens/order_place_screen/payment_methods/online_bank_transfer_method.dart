import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/round_button.dart';

class OnlineBankTransferMethod extends StatefulWidget {
  const OnlineBankTransferMethod({super.key});

  @override
  State<OnlineBankTransferMethod> createState() => _OnlineBankTransferMethodState();
}

class _OnlineBankTransferMethodState extends State<OnlineBankTransferMethod> {
  final TextEditingController _bankController = TextEditingController();
  final List<String> _pakistaniBanks = [
    'Habib Bank Limited (HBL)',
    'United Bank Limited (UBL)',
    'National Bank of Pakistan (NBP)',
    'Allied Bank Limited (ABL)',
    'Meezan Bank',
    'Bank Alfalah',
    'Faysal Bank',
    'Askari Bank',
    'Standard Chartered Bank',
    'Bank of Punjab',
  ];

  void _showBankDropdown() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: _pakistaniBanks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: appText(_pakistaniBanks[index]),
              onTap: () {
                setState(() {
                  _bankController.text = _pakistaniBanks[index];
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText('Online bank transfer', fontSize: 22.px, fontWeight: FontWeight.w400),
              SizedBox(height: 50.px),
              appText('Summary', fontSize: 22.px, fontWeight: FontWeight.w400),
              SizedBox(height: 30.px),
              const Divider(),
              SizedBox(height: 30.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Total amount', color: AppColors.hintGrey, fontSize: 16),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: AppColors.hintGrey,
                      )),
                ],
              ),
              appText('PKR 10944.00', fontSize: 26.px, fontWeight: FontWeight.bold),
              SizedBox(height: 30.px),
              CustomContainer(
                  margin: EdgeInsets.symmetric(horizontal: 16.px),
                  height: 120.px,
                  width: double.maxFinite,
                  borderRadius: 4,
                  color: AppColors.transparentColor,
                  borderColor: AppColors.grey300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText('Date', fontSize: 16),
                            appText('2025-01-12', fontSize: 16, fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText('Order No.', fontSize: 16),
                            appText('65873686287', fontSize: 16, fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText('Store Name', fontSize: 16),
                            appText('Maxcore', fontSize: 16, fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 40.px),
              appText('Pay with Bank Account', fontSize: 26.px, fontWeight: FontWeight.bold),
              SizedBox(height: 20.px),
              CustomContainer(
                  width: 100.px,
                  borderRadius: 6.px,
                  color: AppColors.transparentColor,
                  borderColor: AppColors.blueColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.account_balance, size: 60.px),
                        appText('Bank', fontWeight: FontWeight.w400),
                        appText('Account', fontWeight: FontWeight.w400),
                      ],
                    ),
                  )),
              SizedBox(height: 20.px),
              appText('Bank', fontSize: 16, fontWeight: FontWeight.bold),
              TextFormField(
                controller: _bankController,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: _showBankDropdown,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                  ),
                  hintText: 'Select Bank',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(height: 20.px),
              appText('Account Number/IBAN', fontSize: 16, fontWeight: FontWeight.bold),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Account Number', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 4.px),
              appText('Enter your account number or IBAN', color: AppColors.hintGrey),
              SizedBox(height: 50.px),
              appText('CNIC', fontSize: 16, fontWeight: FontWeight.bold),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'XXXX XXXXXX XX', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 4.px),
              appText('Enter your 13 digit CNIC number', color: AppColors.hintGrey),
              SizedBox(height: 20.px),
              roundButton(onTap: () {}, color: AppColors.hintGrey, title: 'Pay'),
              SizedBox(height: 20.px)
            ],
          ),
        ),
      ),
    );
  }
}
