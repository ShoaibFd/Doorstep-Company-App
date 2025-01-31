import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/custom_container.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/round_button.dart';
import '../../../auth/app_textfield.dart';
import 'refund_submitted_screen.dart';

class RefundScreen extends StatefulWidget {
  const RefundScreen({super.key});

  @override
  State<RefundScreen> createState() => _RefundScreenState();
}

class _RefundScreenState extends State<RefundScreen> {
  bool isMobileAccount = false;
  bool isBankAccount = false;
  int? selectedRadio;
  String? selectedBank;

  void updateRadioValue(int? value) {
    setState(() {
      selectedRadio = value;
    });
  }

// Controller to use in TextFormField
  final cnicController = TextEditingController();
  final mobileAccountController = TextEditingController();
  final accountOwnerController = TextEditingController();
  final bankAccountOwnerController = TextEditingController();
  final bankAccountNumberController = TextEditingController();
  final branchAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Refund', fontSize: 20.px, fontWeight: FontWeight.bold)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText('For refund, give your account details in one of the followings.', fontSize: 18),
              SizedBox(height: 30.px),
              CustomContainer(
                onTap: () {
                  setState(() {
                    isBankAccount = false;
                    isMobileAccount = !isMobileAccount;
                  });
                },
                height: 40.px,
                color: AppColors.lowPurple.withOpacity(0.1),
                borderColor: AppColors.lowPurple,
                borderRadius: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText('Mobile Account Details', fontSize: 16.px, fontWeight: FontWeight.bold),
                      Icon(
                        isMobileAccount ? Icons.keyboard_arrow_down : Icons.chevron_right,
                      ),
                    ],
                  ),
                ),
              ),
              if (isMobileAccount) ...[
                SizedBox(height: 10.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: RadioListTile<int?>(
                            title: appText('Jazzcash', fontSize: 16.px),
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: updateRadioValue)),
                    Expanded(
                        child: RadioListTile<int?>(
                            title: appText('Easypaisa', fontSize: 16.px),
                            value: 2,
                            groupValue: selectedRadio,
                            onChanged: updateRadioValue))
                  ],
                ),
                appTextField(controller: mobileAccountController, hint: 'Mobile Account Number'),
                SizedBox(height: 10.px),
                appTextField(controller: accountOwnerController, hint: 'Account Owner Name'),
                SizedBox(height: 10.px),
                const CnicTextField(),
                SizedBox(height: 20.px),
              ],
              SizedBox(height: 10.px),
              CustomContainer(
                onTap: () {
                  setState(() {
                    isMobileAccount = false;
                    isBankAccount = !isBankAccount;
                  });
                },
                height: 45.px,
                color: AppColors.lowPurple.withOpacity(0.1),
                borderColor: AppColors.lowPurple,
                borderRadius: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText('Bank Account Details', fontSize: 16.px, fontWeight: FontWeight.bold),
                      Icon(isBankAccount ? Icons.keyboard_arrow_down_outlined : Icons.chevron_right),
                    ],
                  ),
                ),
              ),
              if (isBankAccount) ...[
                SizedBox(height: 10.px),
                BankDropdown(
                  onChanged: (String? value) {
                    setState(() {
                      selectedBank = value;
                    });
                  },
                  selectedBank: selectedBank,
                ),
                SizedBox(height: 10.px),
                appTextField(controller: branchAddressController, hint: 'Branch Address'),
                SizedBox(height: 10.px),
                appTextField(controller: bankAccountOwnerController, hint: 'Account Title'),
                SizedBox(height: 10.px),
                appTextField(controller: bankAccountNumberController, hint: 'Account Number'),
                SizedBox(height: 10.px),
                appTextField(controller: cnicController, hint: 'CNIC Number'),
                SizedBox(height: 10.px),
              ],
              SizedBox(height: 10.px)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: roundButton(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RefundSubmittedScreen()));
            },
            title: 'Submit'),
      ),
    );
  }
}

class BankDropdown extends StatelessWidget {
  final Function(String?) onChanged;
  final String? selectedBank;

  const BankDropdown({super.key, required this.onChanged, this.selectedBank});

  @override
  Widget build(BuildContext context) {
    const banks = [
      'Bank Alfalah',
      'Habib Bank Limited',
      'National Bank of Pakistan',
      'Standard Chartered Bank',
      'United Bank Limited',
      'MCB Bank',
      'Faysal Bank',
    ];

    return DropdownButtonFormField<String>(
      value: selectedBank,
      hint: appText('Select Bank', color: AppColors.hintGrey),
      dropdownColor: AppColors.whiteTheme,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.grey300)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.grey300))),
      items: banks.map((String bank) {
        return DropdownMenuItem<String>(
          value: bank,
          child: Text(bank),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class CnicTextField extends StatefulWidget {
  const CnicTextField({super.key});

  @override
  _CnicTextFieldState createState() => _CnicTextFieldState();
}

class _CnicTextFieldState extends State<CnicTextField> {
  final TextEditingController cnicController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cnicController.addListener(_formatCnic);
  }

  void _formatCnic() {
    String text = cnicController.text.replaceAll('-', '');
    String formattedText = '';

    for (int i = 0; i < text.length; i++) {
      if (i == 5 || i == 12) {
        formattedText += '-';
      }
      formattedText += text[i];
    }

    // Update the controller only if the formatted text is different
    if (formattedText != cnicController.text) {
      cnicController.value = TextEditingValue(
        text: formattedText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: formattedText.length),
        ),
      );
    }
  }

  @override
  void dispose() {
    cnicController.removeListener(_formatCnic);
    cnicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cnicController,
      maxLength: 13,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'CNIC Number',
        hintStyle: TextStyle(color: AppColors.hintGrey),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.grey300)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.grey300)),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
