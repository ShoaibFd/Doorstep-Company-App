import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import 'ac_repair.dart';
import 'ac_repair_return_screen.dart';
// Import other screens here

class AcApplianceSubcategoryBottomSheet extends StatefulWidget {
  final double height;
  final double width;

  const AcApplianceSubcategoryBottomSheet({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<AcApplianceSubcategoryBottomSheet> createState() => _AcApplianceSubcategoryBottomSheetState();
}

class _AcApplianceSubcategoryBottomSheetState extends State<AcApplianceSubcategoryBottomSheet> {
  List<String> images = [
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
    'assets/images/ac.jpeg',
  ];

  List<String> text = [
    'AC Repair\nService',
    'Air Cooler\nRepair&\nService',
    'Chimney\nRepair&\nService',
    'Gas Stove\nRepair&\nService',
    'Geyser\nRepair&\nService',
    'Inverter\nRepair&\nService',
    'Water Purifier\nRepair',
    'Laptop\nRepair&\nService',
    'Microwave\nRepair',
    'Mixer&\nGrinder Repair',
    'Refrigerator\nRepair',
    'Television\nRepair',
    'Washing\nMachine\nRepair',
  ];

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AcRepairScreen()));
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.96,
      color: AppColors.transparentColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                          backgroundColor: AppColors.whiteTheme, radius: 20, child: Icon(Icons.close))))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('AC & Appliances Repair', fontWeight: FontWeight.bold, fontSize: 24),
                        const SizedBox(height: 20),
                        appText('Appliance Repair & Service', fontWeight: FontWeight.bold, fontSize: 17),
                        SizedBox(height: height * 0.013),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: images.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 3, mainAxisExtent: 140),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => _navigateToScreen(index), // Call navigation function on tap
                              child: Column(
                                children: [
                                  Container(
                                      height: height * 0.088,
                                      width: width * 0.30,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage(images[index]), fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(8),
                                          color: AppColors.grey300)),
                                  const SizedBox(height: 4),
                                  appText(text[index], textAlign: TextAlign.center, fontSize: 12),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
