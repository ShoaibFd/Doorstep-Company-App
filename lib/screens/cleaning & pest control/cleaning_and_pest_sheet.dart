import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../home_cleaning/home_cleaning_screen.dart';
import 'bathroom_cleaning_screen.dart';

void showCleaningAndPestSheet(BuildContext context) {
  List<String> services = [
    'Bathroom\ncleaning',
    'Full home\ncleaning',
    'Kitchen\ncleaning',
    'Sofa\ncleaning',
  ];
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 400.px,
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
                appText('Cleaning & Pest Control', fontSize: 22.px, fontWeight: FontWeight.bold),
                appText('Cleaning', fontSize: 18.px, fontWeight: FontWeight.bold),
                SizedBox(
                  height: 130.px,
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
                              margin: EdgeInsets.all(10.px),
                              height: 70.px,
                              width: 70.px,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.px),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://media.istockphoto.com/id/1066978818/photo/exterminator-working.jpg?s=612x612&w=0&k=20&c=sddrtDtVPnyn8jIukuNcyCQS0gm6I4GwQQ_CGvs9UYM='),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          appText(services[index].toString(), fontWeight: FontWeight.bold, color: AppColors.hintGrey)
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.px),
                SizedBox(
                  height: 130.px,
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
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const HomeCleaningScreen()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10.px),
                              height: 70.px,
                              width: 70.px,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.px),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://media.istockphoto.com/id/1066978818/photo/exterminator-working.jpg?s=612x612&w=0&k=20&c=sddrtDtVPnyn8jIukuNcyCQS0gm6I4GwQQ_CGvs9UYM='),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          appText('Pest control', fontWeight: FontWeight.bold, color: AppColors.hintGrey)
                        ],
                      );
                    },
                  ),
                )
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
