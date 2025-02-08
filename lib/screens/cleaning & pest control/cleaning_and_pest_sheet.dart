import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/custom_text.dart';
import '../../constants/colors.dart';
import 'bathroom_cleaning/bathroom_cleaning_screen.dart';
import 'full_home_cleaning/home_cleaning_screen.dart';

void showCleaningAndPestSheet(BuildContext context) {
  List<String> services = [
    'Bathroom Cleaning',
    'Kitchen Cleaning',
    'Full Home Cleaning',
    'Sofa & Carpet Cleaning',
  ];
  List images = [
    'https://pngimg.com/d/toilet_PNG17748.png',
    'https://cdn-icons-png.freepik.com/512/17828/17828044.png',
    'https://image.similarpng.com/file/similarpng/very-thumbnail/2022/01/House-icon-illustration-on-transparent-background-PNG.png',
    'https://images.vexels.com/media/users/3/148279/isolated/preview/25a144393fe1fd9eb8e10b69dbcd2772-sofa-armchair-icon.png'
  ];
  showModalBottomSheet(
    constraints: const BoxConstraints(),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 500.px,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: AppColors.whiteTheme,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16.px), topRight: Radius.circular(16.px))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 8.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.px,
              children: [
                SizedBox(height: 10.px),
                appText('Cleaning & Pest Control', fontSize: 22.px, fontWeight: FontWeight.bold),
                SizedBox(height: 20.px),
                appText('Cleaning', fontSize: 20.px, fontWeight: FontWeight.bold),
                SizedBox(
                  height: 140.px,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              index == 0
                                  ? Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const BathroomCleaningScreen()))
                                  : Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const HomeCleaningScreen()));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 70.px,
                              width: 70.px,
                              decoration: BoxDecoration(
                                color: AppColors.grey300.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                              child: Center(child: Image.network(images[index], height: 55.px)),
                            ),
                          ),
                          SizedBox(
                              height: 50.px,
                              width: 70.px,
                              child: appText(services[index].toString(), textAlign: TextAlign.center))
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.px),
                appText('Pest Control', fontSize: 20.px, fontWeight: FontWeight.bold),
                SizedBox(
                  height: 140.px,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              index == 0
                                  ? Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const BathroomCleaningScreen()))
                                  : Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const HomeCleaningScreen()));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 70.px,
                              width: 70.px,
                              decoration: BoxDecoration(
                                color: AppColors.grey300.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                              child: Center(child: Image.network(images[index], height: 55.px)),
                            ),
                          ),
                          SizedBox(
                              height: 50.px,
                              width: 70.px,
                              child: appText(services[index].toString(), textAlign: TextAlign.center))
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: -50.px,
            right: 16.px,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.close))))
      ]);
    },
  );
}
