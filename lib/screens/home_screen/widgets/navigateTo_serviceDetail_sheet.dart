import 'package:flutter/material.dart';

import '../../ac_screens/ac_appliance_subcategory_bottom_sheet.dart';
import '../women_subcategory.dart';
import '../../mens salon & massage/men_saloon_bottom_sheet.dart';
import '../../painting_wall_screen/painting_wall_screen.dart';

class NavigateToServiceDetailSheet extends StatelessWidget {
  const NavigateToServiceDetailSheet({super.key});

  void _navigateToServiceDetail(int index, BuildContext context) {
    switch (index) {
      case 2:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.black54,
          clipBehavior: Clip.antiAlias,
          builder: (BuildContext context) {
            return AcApplianceSubcategoryBottomSheet(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
            );
          },
        );
        break;
      case 0:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const WomenSubcategory();
          },
        );
        break;
      case 1:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return MenSaloonBottomSheet(
            
            );
          },
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaintingWaterproofingScreen()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () => _navigateToServiceDetail(0, context), child: const Text('Show Women Subcategory')),
        ElevatedButton(
            onPressed: () => _navigateToServiceDetail(1, context), child: const Text('Show Men Saloon Subcategory')),
        ElevatedButton(
            onPressed: () => _navigateToServiceDetail(2, context), child: const Text('Show AC Appliance Subcategory')),
        ElevatedButton(
            onPressed: () => _navigateToServiceDetail(7, context),
            child: const Text('Navigate to Painting Waterproofing')),
      ],
    );
  }
}
