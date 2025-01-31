import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/colors.dart';
import '../../../widgets/custom_text.dart';
import '../../ac_screens/ac_appliance_subcategory_bottom_sheet.dart';
import '../../cleaning & pest control/cleaning_and_pest_sheet.dart';
import '../../wall_panel_screen/wall_panel_screen.dart';
import '../women_subcategory.dart';
import '../../mens salon & massage/men_saloon_bottom_sheet.dart';
import '../../painting_wall_screen/painting_wall_screen.dart';

Widget categoryWidget(BuildContext context) {
  //

  navigateToServiceDetail(int index) {
    switch (index) {
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
            return const MenSaloonBottomSheet();
          },
        );
        break;
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
      case 3:
        showCleaningAndPestSheet(context);
        break;

      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const WallPanelScreen()));
        break;

      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PaintingWaterproofingScreen()));
      default:
        break;
    }
  }

//
  List<String> text = [
    'Women Saloon &\nSpa',
    "Men's Saloon &\nSpa",
    'AC & Appliances\nRepair',
    'Cleaning&pest\nControl',
    'Plumber &\nCarpenter',
    'Native Water\nPurifier',
    'Native Smart\nLocks',
    'Painting & Water\nProofing',
    'Wall Panels',
  ];
//
  List<String> images = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
    'assets/images/pest-control.png',
    'assets/images/drill.png',
    'assets/images/water.jpg',
    'assets/images/smartphone.png',
    'assets/images/paintingwater.png',
    'assets/images/bricks.png',
  ];
  double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.px, vertical: 20.px),
    child: GridView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 3, mainAxisExtent: 130),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigateToServiceDetail(index);
          },
          child: Column(
            children: [
              Container(
                height: height * 0.09,
                width: width * 0.27,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.grey300.withOpacity(0.4)),
                child: Center(child: Image.asset(images[index], height: 55.px)),
              ),
              const SizedBox(height: 4),
              appText(text[index], textAlign: TextAlign.center, fontSize: 13.5, fontWeight: FontWeight.w500),
            ],
          ),
        );
      },
    ),
  );
}
