import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../components/app_text.dart';
import '../../../components/custom_container.dart';
import '../../../components/divider.dart';
import '../../../theme/colors.dart';
import '../../home_screen/components/carousel_slider.dart';
import '../../painting_wall_screen/components/add_button.dart';
import '../../painting_wall_screen/components/frequently_asked_questions_widget.dart';
import '../../painting_wall_screen/components/reviews_widget.dart';
import '../../painting_wall_screen/components/share_btn.dart';
import '../../salon_for_women/spa_for_women/spa_view_detail_sheet.dart';

class BathCleaningDetailBottomSheet extends StatefulWidget {
  const BathCleaningDetailBottomSheet({super.key});

  @override
  State<BathCleaningDetailBottomSheet> createState() => _BathCleaningDetailBottomSheetState();
}

class _BathCleaningDetailBottomSheetState extends State<BathCleaningDetailBottomSheet> {
  List<String> images1 = [
    'assets/images/aaa.jpeg',
    'assets/images/aa.jpeg',
    'assets/images/aaaa.jpeg',
    'assets/images/aaaaa.jpeg',
    'assets/images/aaaaaa.jpeg',
    'assets/images/a.jpeg',
  ];
  List<String> carouselImages = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
  ];
  List<String> images = [
    'assets/images/LG-Logo.png',
    'assets/images/voltas.png',
    'assets/images/haier.jpg',
    'assets/images/hitachi.png',
    'assets/images/panasonic.webp',
    'assets/images/mitshubi.png',
    'assets/images/bluestar.jpg',
    'assets/images/daikin.png',
    'assets/images/samsung.png',
    'assets/images/godrej.png',
    'assets/images/toshiba.png',
    'assets/images/more.png',
  ];
  // final bool _isTextFieldVisible = false;
  final String urlToShare = 'https://flutter.dev';

  bool isAdded = false;
  int count = 0;
  bool paintSelected = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
            height: height * .9,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.px), topRight: Radius.circular(15.px))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.px),
                  CarouselSliderWidget(images: carouselImages),
                  SizedBox(height: 12.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText('Intense cleaning (2 bathrooms)', fontSize: 18, fontWeight: FontWeight.bold),
                      AddButton(
                          onIncrement: () {
                            count++;
                          },
                          onDecrement: () {
                            if (count > 1) {
                              count--;
                            }
                          },
                          count: count.toString()),
                    ],
                  ),
                  Row(
                    spacing: 6.px,
                    children: [
                      const Icon(Icons.star, size: 18),
                      appText('4.78 (1.2M bookings)', color: AppColors.hintGrey)
                    ],
                  ),
                  SizedBox(height: 6.px),
                  Row(
                    spacing: 6.px,
                    children: [
                      appText('PKR 899', fontWeight: FontWeight.bold),
                      appText('PKR 99', color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                      Icon(Icons.circle, size: 4, color: AppColors.hintGrey),
                      appText('2h 40 mins', color: AppColors.hintGrey)
                    ],
                  ),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  appText('Included', fontSize: 22, fontWeight: FontWeight.bold),
                  SizedBox(height: 20.px),
                  ListView.builder(
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.px),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomContainer(
                                height: 80.px,
                                width: 80.px,
                                borderRadius: 6,
                                color: AppColors.grey300,
                                image: const DecorationImage(
                                    image: NetworkImage('https://static.toiimg.com/photo/96708674.cms'),
                                    fit: BoxFit.cover),
                                child: const SizedBox()),
                            SizedBox(width: 10.px),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText('Object removal befor cleaning', fontSize: 18, fontWeight: FontWeight.w400),
                                appText('Removal of toiletries and other\nobjects from the bathroom',
                                    fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.hintGrey)
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.px),
                  appText('Excluded', fontSize: 22, fontWeight: FontWeight.bold),
                  SizedBox(height: 20.px),
                  avoidRow('Please provide a ladder, if required'),
                  SizedBox(height: 10.px),
                  avoidRow('Wet wiping of the walls'),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  CustomContainer(
                      height: 150.px,
                      width: double.maxFinite,
                      color: AppColors.grey300,
                      borderRadius: 4,
                      image: const DecorationImage(
                          image: NetworkImage('https://static.toiimg.com/photo/96708674.cms'), fit: BoxFit.cover),
                      child: const SizedBox()),
                  SizedBox(height: 20.px),
                  appText('What is 1 hour shine challange', fontSize: 22, fontWeight: FontWeight.bold),
                  appText(
                      'Our challenge that in 1 hour we will deliver result better than 20 hours of regular cleaning.'),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  appText('Spotless bathroom', fontSize: 22, fontWeight: FontWeight.bold),
                  appText(
                      'Our challenge that in 1 hour we will deliver result better than 20 hours of regular cleaning.'),
                  SizedBox(height: 10.px),
                  SizedBox(
                    height: 160.px,
                    width: double.maxFinite,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomContainer(
                            margin: EdgeInsets.only(right: 8.px),
                            height: 150.px,
                            width: 200.px,
                            borderRadius: 8.px,
                            color: AppColors.grey300,
                            child: Row(
                              children: [
                                CustomContainer(
                                    height: 150.px,
                                    width: 98.px,
                                    borderRadius: 1,
                                    color: AppColors.transparentColor,
                                    child: Center(
                                      child: appText('Trained\ncleaners', fontWeight: FontWeight.w400),
                                    )),
                                CustomContainer(
                                    height: 150.px,
                                    width: 98.px,
                                    borderRadius: 1,
                                    image: const DecorationImage(
                                        image: NetworkImage('https://static.toiimg.com/photo/96708674.cms'),
                                        fit: BoxFit.cover),
                                    color: AppColors.transparentColor,
                                    child: const SizedBox()),
                              ],
                            ));
                      },
                    ),
                  ),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  appText('Types of UC cleaning services', fontSize: 22, fontWeight: FontWeight.bold),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  // const FrequentlyAskedQuestionsWidget(),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const Column(
                        children: [
                          FAQsComponent(
                            question: 'Hello! dear, What is your name?',
                            answer: 'Hey there! My name is Muhammad Shoaib. What is your name?',
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20.px),
                  shareBtn(context, () {
                    Share.share('Check out the Flutter website: $urlToShare');
                  }),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  const ReviewsWidget(),
                  SizedBox(height: 20.px),
                ],
              ),
            )),
        Positioned(
            top: -55.px,
            right: 6.px,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(backgroundColor: AppColors.whiteTheme, child: Icon(Icons.close)))),
      ]),
    );
  }
}

TableRow commonRow(String col1, String col2, String col3, {bool isHeader = false}) {
  return TableRow(
    children: [
      _buildCell(col1, isHeader),
      _buildCell(col2, isHeader),
      _buildCell(col3, isHeader),
    ],
  );
}

Widget _buildCell(String text, bool isHeader) {
  return Padding(
      padding: EdgeInsets.all(8.px),
      child: appText(text,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 18.px : 16.px,
          textAlign: TextAlign.center));
}

//  Suggestion row widget
Widget suggestinRow(final String text) {
  return Row(
    children: [
      Icon(Icons.check_circle, color: AppColors.greenColor, size: 20.px),
      SizedBox(width: 20.px),
      appText(text, fontSize: 16.px)
    ],
  );
}

// Work Detail Widget
Widget workDetailWidget(final String desc, final String image, String? image2, BuildContext context) {
  double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;

  // If image2 is null, show one image taking full width, else show two images
  if (image2 == null) {
    return Column(
      children: [
        appText(desc),
        Container(
          margin: EdgeInsets.only(left: 10.px),
          height: height * 0.22,
          width: width * 0.76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.px),
            color: Colors.grey.shade300,
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  } else {
    return Column(
      children: [
        appText(desc),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.px),
              height: height * 0.22,
              width: width * 0.38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.px),
                color: Colors.grey.shade300,
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.px),
              height: height * 0.22,
              width: width * 0.38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.px),
                color: Colors.grey.shade300,
                image: DecorationImage(image: AssetImage(image2), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
