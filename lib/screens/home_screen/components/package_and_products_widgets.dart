import 'package:doorstep_company_app/screens/home_screen/packages/projects_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/app_text.dart';
import '../packages/packages_detail_screen.dart';

Widget packagesAndProjects(BuildContext context) {
  List<String> packageImage = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
    'assets/images/men.png',
  ];
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
  List<String> text = [
    'Women Saloon&\nspa',
    'Men Saloon&\nspa',
    'AC & Appliances\nRepair',
    'Cleaning&pest\ncontrol',
    'plumber&\nCarpenter',
    'Native Water\nPurifier',
    'Native Smart\nLocks',
    'Painting & Water\nproofing',
    'Wall Panels',
  ];
  double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 3),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText('Subscription Packages', fontSize: 20, fontWeight: FontWeight.bold),
        SizedBox(height: 10.px),
        Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: GridView.builder(
              itemCount: packageImage.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 3, mainAxisExtent: 120),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PackagesDetailScreen()));
                    },
                    child: Column(
                      children: [
                        Container(
                            height: height * 0.088,
                            width: width * 0.27,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8), color: AppColors.grey300.withOpacity(0.4)),
                            child: Center(child: Image.asset(images[index], height: 55.px))),
                        SizedBox(height: 4.px),
                        appText(text[index], textAlign: TextAlign.center, fontSize: 13.5, fontWeight: FontWeight.w500),
                      ],
                    ));
              },
            )),
        SizedBox(height: 4.px),
        const Divider(),
        SizedBox(height: 6.px),
        Padding(
            padding: EdgeInsets.only(top: 8, left: 4.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText('New Home Projects', fontSize: 20.px, fontWeight: FontWeight.bold),
                SizedBox(height: 20.px),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProjectsDetailScreen()));
                    },
                    child: Container(
                        height: height * 0.09,
                        width: width * 0.27,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: AppColors.grey300.withOpacity(0.4)),
                        child: Center(child: Image.asset("assets/images/project-management.png", height: 55.px)))),
                SizedBox(height: height * 0.010),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:
                        appText("Projects", textAlign: TextAlign.center, fontSize: 13.5, fontWeight: FontWeight.w500))
              ],
            ))
      ],
    ),
  );
}
