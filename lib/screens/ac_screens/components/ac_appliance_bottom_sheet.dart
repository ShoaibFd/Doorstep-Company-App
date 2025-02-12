import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/app_text.dart';
import '../../../constants/colors.dart';
import '../ac_repair.dart';

void acAppliancesBottomSheet(BuildContext context) {
  List<String> text = [
    'AC Repair Service',
    'Air Cooler Repair& Service',
    'Chimney Repair & Service',
    'Gas Stove Repair& Service',
    'Geyser Repair& Service',
    'Inverter Repair& Service',
    'Water Purifier Repair',
    'Laptop Repair& Service',
    'Microwave Repair',
    'Mixer& Grinder Repair',
    'Refrigerator Repair',
    'Television Repair',
    'Washing Machine Repair',
  ];

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AcRepairScreen()));
        break;

      default:
        break;
    }
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              height: height * 0.90,
              width: width,
              decoration: BoxDecoration(
                  color: AppColors.whiteTheme,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18.px), topRight: Radius.circular(18.px))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.px),
                      appText('AC & Appliances Repair', fontWeight: FontWeight.bold, fontSize: 24),
                      SizedBox(height: 40.px),
                      appText('Appliance Repair & Service', fontWeight: FontWeight.bold, fontSize: 18.px),
                      SizedBox(height: 20.px),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: text.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 3, mainAxisExtent: 140),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => navigateToScreen(index),
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.084,
                                  width: width * 0.18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.px),
                                      color: AppColors.grey300.withOpacity(0.4)),
                                  child: Center(
                                    child: Image.asset('assets/images/air-conditioner.png', height: 55.px),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                appText(text[index], textAlign: TextAlign.center, fontSize: 15.px),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 40.px),
                      appText('Home appliances', fontWeight: FontWeight.bold, fontSize: 18.px),
                      SizedBox(height: 20.px),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 3, mainAxisExtent: 140),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => navigateToScreen(index),
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.084,
                                  width: width * 0.18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.px),
                                      color: AppColors.grey300.withOpacity(0.4)),
                                  child: Center(
                                    child: Image.asset('assets/images/air-conditioner.png', height: 55.px),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                appText(text[index], textAlign: TextAlign.center, fontSize: 15.px),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10.px),
                    ],
                  ),
                ),
              )),
          Positioned(
              top: -50,
              right: 16,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.close))))
        ],
      );
    },
  );
}
