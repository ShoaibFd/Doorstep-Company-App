import 'package:doorstep_company_app/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ac_screens/components/ac_appliance_bottom_sheet.dart';
import '../../mens salon & massage/mens_salon/men_saloon_bottom_sheet.dart';
import '../../painting_wall_screen/painting_wall_screen.dart';
import '../women_category_screen.dart';

class NavigateToServiceDetailSheet extends StatelessWidget {
  const NavigateToServiceDetailSheet({super.key});

  void navigateTo(int index, BuildContext context) {
    switch (index) {
      case 2:
        acAppliancesBottomSheet(context);
        break;
      case 0:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const WomenCategoryScreen();
          },
        );
        break;
      case 1:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const MenSaloonBottomSheet();
          },
        );
        break;
      case 7:
        Get.to(const PaintingWaterproofingScreen());
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () => navigateTo(0, context), child: appText('Show Women Subcategory')),
        ElevatedButton(onPressed: () => navigateTo(1, context), child: appText('Show Men Saloon Subcategory')),
        ElevatedButton(onPressed: () => navigateTo(2, context), child: appText('Show AC Appliance Subcategory')),
        ElevatedButton(onPressed: () => navigateTo(7, context), child: appText('Navigate to Painting Waterproofing')),
      ],
    );
  }
}
