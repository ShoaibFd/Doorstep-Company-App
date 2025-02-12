import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../components/app_text.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String defaultAddress = 'Karachi';
  final Map<String, String> addresses = {
    'Karachi': 'New Mumbai Bakery Masoomeen Road, Naseerabad Block 14 Federal B Area, Karachi, Sindh',
    'Multan': 'Khawaja Tanneries Pvt Ltd, North Gulgasht Colony, Multan, Punjab'
  };

  void _setDefaultAddress(String address) {
    setState(() {
      defaultAddress = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Address', fontSize: 18)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            appText('Default Address', fontSize: 18, fontWeight: FontWeight.w500),
            const SizedBox(height: 8),
            AddressTile(
                addressName: 'Karachi',
                addressDetails: addresses['Karachi']!,
                isSelected: defaultAddress == 'Karachi',
                onTap: () => _setDefaultAddress('Karachi')),
            const SizedBox(height: 16),
            appText('Select Default Address', fontSize: 18, fontWeight: FontWeight.w500),
            const SizedBox(height: 8),
            AddressTile(
                addressName: 'Multan',
                addressDetails: addresses['Multan']!,
                isSelected: defaultAddress == 'Multan',
                onTap: () => _setDefaultAddress('Multan')),
          ],
        ),
      ),
    );
  }
}

class AddressTile extends StatelessWidget {
  final String addressName;
  final String addressDetails;
  final bool isSelected;
  final VoidCallback onTap;

  const AddressTile({
    super.key,
    required this.addressName,
    required this.addressDetails,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: appText(addressName),
        subtitle: appText(addressDetails),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: AppColors.blackColor)
            : const Icon(Icons.radio_button_unchecked),
        onTap: onTap,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: isSelected ? AppColors.blackColor : AppColors.lightGrey, width: 1),
            borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.all(8.0));
  }
}
