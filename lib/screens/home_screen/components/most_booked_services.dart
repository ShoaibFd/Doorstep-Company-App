import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_text.dart';

Widget mostBookedServices(BuildContext context) {
  double height = MediaQuery.sizeOf(context).height;

  List<String> addimages = [
    'assets/images/a.jpeg',
    'assets/images/aa.jpeg',
    'assets/images/a.jpeg',
    'assets/images/aa.jpeg',
    'assets/images/aaa.jpeg',
    'assets/images/aaaa.jpeg',
    'assets/images/aaaaa.jpeg',
    'assets/images/aaaaaa.jpeg',
  ];
  //

  return Container(
    color: AppColors.whiteTheme,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText('Most Booked Services', fontSize: 20.px, fontWeight: FontWeight.bold),
          SizedBox(height: 30.px),
          SizedBox(
            height: height * 0.32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: addimages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          height: 140.px,
                          width: 140.px,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://www.shutterstock.com/image-photo/barber-cuts-boys-hair-cute-600nw-2144943153.jpg'),
                                  fit: BoxFit.cover),
                              color: AppColors.grey300.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        SizedBox(height: 16.px),
                        appText('Haircut for men'),
                        SizedBox(height: 4.px),
                        Row(
                          children: [
                            Icon(Icons.star, size: 14.px, color: AppColors.hintGrey),
                            SizedBox(width: 4.px),
                            appText('4.88 (491K)', color: AppColors.hintGrey)
                          ],
                        ),
                        SizedBox(height: 4.px),
                        appText('PKR 200')
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    ),
  );
}
