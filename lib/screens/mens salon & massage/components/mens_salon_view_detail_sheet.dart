import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../components/bottom_sheet/30_day_warranty.dart';
import '../../../components/bottom_sheet/dc_verified_quotes.dart';
import '../../../components/bottom_sheet/no_question_asked_bottom_sheet.dart';
import '../../../components/bottom_sheet/review_bottom_sheet.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import '../../../components/divider.dart';
import '../../../components/round_button.dart';
import '../../../theme/colors.dart';
import '../../home_screen/components/carousel_slider.dart';
import '../../painting_wall_screen/components/how_it_works_widget.dart';
import '../../painting_wall_screen/components/reviews_widget.dart';
import '../../painting_wall_screen/components/share_btn.dart';
import '../../salon_for_women/spa_for_women/spa_view_detail_sheet.dart';
import '../../subcategory_screens/dc_container.dart';

class MenSalonViewDetailBottomSheet extends StatefulWidget {
  const MenSalonViewDetailBottomSheet({
    super.key,
  });

  @override
  State<MenSalonViewDetailBottomSheet> createState() => _MenSalonViewDetailBottomSheetState();
}

class _MenSalonViewDetailBottomSheetState extends State<MenSalonViewDetailBottomSheet> {
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
    'assets/images/mitshubi.png',
    'assets/images/toshiba.png',
    'assets/images/more.png',
  ];
  final steps = [
    ProcessStep(
      title: 'Pre-service check',
      subtitle: 'Detailed inspection including gas check to identify repair',
      images: [
        'https://www.shutterstock.com/image-photo/technician-service-cleaning-air-conditioner-600nw-1498805081.jpg',
        'https://www.shutterstock.com/image-photo/technician-service-cleaning-air-conditioner-600nw-1498805081.jpg'
      ],
    ),
    ProcessStep(
      title: 'Pre-service check',
      subtitle: 'Detailed inspection including gas check to identify repair',
      images: [
        'https://www.shutterstock.com/image-photo/technician-service-cleaning-air-conditioner-600nw-1498805081.jpg',
      ],
    ),
    ProcessStep(
      title: 'Pre-service check',
      subtitle: 'Detailed inspection including gas check to identify repair',
      images: [
        'https://www.shutterstock.com/image-photo/technician-service-cleaning-air-conditioner-600nw-1498805081.jpg',
      ],
    ),
  ];

  bool isAdded = false;
  int count = 0;
  final String urlToShare = 'https://flutter.dev';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(clipBehavior: Clip.none, children: [
      count > 0
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 1,
                child: SizedBox(
                  height: 70.px,
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.px),
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 16.px,
                            backgroundColor: AppColors.grey300.withOpacity(0.5),
                            child: Center(child: appText('0'))),
                        SizedBox(width: 20.px),
                        appText('Rs. 0', fontWeight: FontWeight.bold, fontSize: 16),
                        const Spacer(),
                        roundButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: 170.px,
                            color: AppColors.lowPurple,
                            title: 'Done')
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
      Container(
          height: height * 0.9,
          width: width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: Column(
                    children: [
                      SizedBox(height: 10.px),
                      const CarouselSliderWidget(images: [
                        'assets/images/aaa.jpeg',
                        'assets/images/aa.jpeg',
                        'assets/images/aaaa.jpeg',
                        'assets/images/aaaaa.jpeg',
                        'assets/images/aaaaaa.jpeg',
                        'assets/images/a.jpeg',
                      ]),
                      SizedBox(height: height * 0.040),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText('Vedic Signature full-body\npain relief massage',
                              fontSize: 24.px, fontWeight: FontWeight.bold),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CustomContainer(
                              height: 28,
                              borderRadius: 4,
                              onTap: () {
                                showReviewsBottomSheet(context);
                              },
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              color: AppColors.greenColor.shade800,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.star, color: AppColors.whiteTheme, size: 16),
                                  appText('4.82', color: AppColors.whiteTheme)
                                ],
                              )),
                          SizedBox(width: width * 0.03),
                          appText("597K reviews"),
                        ],
                      ),
                      const SizedBox(height: 16),
                      div(),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomContainer(
                                margin: const EdgeInsets.only(right: 10),
                                width: 160,
                                borderColor: AppColors.grey300,
                                borderRadius: 10,
                                color: AppColors.transparentColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  child: Column(
                                    spacing: 6,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 6),
                                      appText('60 mins', fontSize: 18.px, fontWeight: FontWeight.bold),
                                      Row(children: [
                                        const Icon(Icons.star, size: 15),
                                        appText('4.78 (23k reviews)', color: AppColors.lightBlack)
                                      ]),
                                      const SizedBox(height: 10),
                                      appText('Rs.99', fontWeight: FontWeight.bold),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (count == 0) {
                                                count = 1;
                                              }
                                            });
                                          },
                                          child: count > 0
                                              ? Container(
                                                  height: 36,
                                                  width: 76,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.lowPurple.withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: AppColors.lowPurple)),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              if (count > 0) {
                                                                count--;
                                                              }
                                                            });
                                                          },
                                                          child: const Icon(Icons.remove,
                                                              size: 16, color: AppColors.lowPurple)),
                                                      appText(count.toString(),
                                                          color: AppColors.lowPurple,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold),
                                                      InkWell(
                                                          onTap: () {},
                                                          child: Icon(Icons.add,
                                                              size: 16, color: AppColors.hintGrey.withOpacity(0.2))),
                                                    ],
                                                  ))
                                              : Container(
                                                  height: 36,
                                                  width: 76,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: AppColors.grey300)),
                                                  child: Center(
                                                      child: appText('Add',
                                                          fontWeight: FontWeight.bold, color: AppColors.lowPurple)))),
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
                      SizedBox(height: 16.px),
                      div(),
                      SizedBox(height: 10.px),
                      appText('Why UC Ayurveda', fontSize: 24.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 30.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DcContainer(
                            image: 'assets/images/warranty.png',
                            title: '30-day\nwarranty',
                            onTap: () => showWarrantyBottomSheet(context),
                          ),
                          DcContainer(
                              image: 'assets/images/refund.png',
                              title: 'No Questions\nasked claimed',
                              onTap: () => showNoQuestionAskedClaimedSheet(context)),
                          DcContainer(
                              image: 'assets/images/warranty.png',
                              title: 'DC verified\nquotes',
                              onTap: () => showDcVerifiedQuotes(context)),
                        ],
                      ),
                      SizedBox(height: 30.px),
                    ],
                  ),
                ),
                CustomContainer(
                    color: AppColors.grey300,
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Overview', fontSize: 24.px, fontWeight: FontWeight.bold),
                          SizedBox(height: 12.px),
                          GridView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 220.px,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CustomContainer(
                                      margin: const EdgeInsets.all(6),
                                      height: 130.px,
                                      width: 220.px,
                                      borderRadius: 8,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://www.cavallopoint.com/content/uploads/2023/09/190502_Cavallopoint_tg-400-1400x960.jpg'),
                                          fit: BoxFit.cover),
                                      color: AppColors.grey300,
                                      child: const SizedBox()),
                                  SizedBox(height: 8.px),
                                  appText('Long rythmic strokes', fontWeight: FontWeight.bold, fontSize: 16.px),
                                  appText('Relaxesmuscles &\n improves circulation',
                                      fontSize: 16.px, color: AppColors.hintGrey)
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    )),
                SizedBox(height: 20.px),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                          width: double.maxFinite,
                          color: AppColors.grey300,
                          borderRadius: 10,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 12.px),
                              child: Column(
                                spacing: 6.px,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appText('Best for', fontSize: 18.px, fontWeight: FontWeight.bold),
                                  bestRow(text: 'Muscoloskeletal issues like arthritis'),
                                  bestRow(text: 'Improving sleep quality & concentration'),
                                  bestRow(text: 'Addressing hairfall & premature greying'),
                                ],
                              ))),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      appText('Spa-like ambience at home', fontSize: 22.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 12.px),
                      CustomContainer(
                          height: 200.px,
                          width: double.maxFinite,
                          borderRadius: 10.px,
                          color: AppColors.grey300,
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://primemassagecenter.com/wp-content/uploads/2017/06/aroma-therapy-massage-for-men-in-dubai.jpg'),
                              fit: BoxFit.cover),
                          child: const SizedBox()),
                      SizedBox(height: 13.px),
                      Image.asset('assets/images/bed.png'),
                      SizedBox(height: 12.px),
                      div(),
                      SizedBox(height: 12.px),
                      appText('We bring the spa for you', fontSize: 24.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 12.px),
                      GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250.px,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomContainer(
                                  margin: const EdgeInsets.all(6),
                                  height: 150.px,
                                  width: 230.px,
                                  borderRadius: 4,
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://img.edilportale.com/product-thumbs/b_PORTOFINO-EVO-Lemi-Group-386464-rel850ee3a0.jpg'),
                                      fit: BoxFit.cover),
                                  color: AppColors.grey300,
                                  child: const SizedBox()),
                              SizedBox(height: 8.px),
                              appText('Massage bed', fontWeight: FontWeight.bold, fontSize: 16.px),
                              appText('6ft x 2.5ft with a\ncapacity of 280kg',
                                  fontSize: 16.px, color: AppColors.hintGrey)
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      appText('Oil used', fontSize: 24.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 20.px),
                      ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              spacing: 20.px,
                              children: [
                                CustomContainer(
                                    margin: EdgeInsets.only(bottom: 20.px),
                                    height: 130.px,
                                    width: 130.px,
                                    borderRadius: 10,
                                    color: AppColors.transparentColor,
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://beautycharms.pk/cdn/shop/files/Picsart_23-07-03_20-50-58-499.jpg?v=1709149100'),
                                        fit: BoxFit.cover),
                                    child: const SizedBox()),
                                Column(
                                  spacing: 10.px,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText('Hair massage oil', fontSize: 22.px, fontWeight: FontWeight.bold),
                                    appText('Blend of Aloe vera, Brahmi\nHibiscus, Coconut oil,\nBringraj',
                                        color: AppColors.hintGrey, fontSize: 16),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Row(spacing: 10.px, children: [
                                        appText('Know more', fontSize: 16.px, fontWeight: FontWeight.bold),
                                        const Icon(Icons.chevron_right, size: 20)
                                      ]),
                                    )
                                  ],
                                )
                              ],
                            );
                          }),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      ProcessTimeline(
                        steps: steps,
                        title: 'Massage procedure',
                      ),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      appText("Massage pre-requisites", fontSize: 22.px, fontWeight: FontWeight.bold),
                      SizedBox(height: height * 0.02),
                      suggestinRow('Advanced Foam-jet cleaning of indoor unit'),
                      SizedBox(height: 10.px),
                      avoidRow('Avoid caffeine or heavy meals 2\nhours before the session'),
                      SizedBox(height: 10.px),
                      avoidRow('Avoid using any lotion or oils on your skin\nbefore the session'),
                      SizedBox(height: 10.px),
                      div(),
                      SizedBox(height: 20.px),
                      appText('UC therapist', fontSize: 24.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 10.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText('Skilled therapist', fontSize: 20.px, fontWeight: FontWeight.bold),
                              SizedBox(height: 6.px),
                              appText('Extensively trained in\nAyurvedic principles\n& massage techniques',
                                  color: AppColors.hintGrey, fontSize: 16),
                              SizedBox(height: 20.px),
                              const Icon(Icons.menu),
                              SizedBox(height: 20.px),
                              appText('Personalized therapy', fontSize: 20.px, fontWeight: FontWeight.bold),
                              SizedBox(height: 6.px),
                              appText('Theraphy consult &\ndo tailored treatment\n& as per your concern',
                                  color: AppColors.hintGrey, fontSize: 16),
                            ],
                          ),
                          Image.network(
                            'https://w7.pngwing.com/pngs/502/468/png-transparent-businessperson-kotak-life-insurance-graphy-woman-business-people-arm-woman-thumbnail.png',
                            height: 230.px,
                          )
                        ],
                      ),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: height * 0.020),
                      appText('Aftercare tips', fontSize: 24.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 12.px),
                      suggestinRow('Drink plenty of water to stay hydrated &\nhelp flush out toxin'),
                      SizedBox(height: 12.px),
                      suggestinRow(
                          'shower using warm water and a gentle\nshampoo 30 minutes after the session\nfor maximum oil absorption'),
                      SizedBox(height: 12.px),
                      avoidRow('Avoid any excercise immedialtely after the\nsession'),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      appText('Please note', fontSize: 24.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 20.px),
                      Row(
                        spacing: 20.px,
                        children: [
                          Icon(Icons.info, color: AppColors.hintGrey),
                          appText(
                              'Feel free to inform your therapist about\nspecific concerns or pressure preferences\nduring the massage',
                              fontSize: 16.px)
                        ],
                      ),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      appText('Disclaimer', fontSize: 18.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 20.px),
                      appText(
                        'This treatment is not recommended for individuals with\nhypertension, pregnancy, cold/fever/flu, contagious skin\n alergies diabetes. Please consult a healthcare professional if you have any of these conditions.',
                      ),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      shareBtn(context, () {
                        Share.share('Check out the Flutter website: $urlToShare');
                      }),
                      SizedBox(height: 10.px),
                      const ReviewsWidget(),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
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
            child: const CircleAvatar(
              backgroundColor: AppColors.whiteTheme,
              child: Icon(Icons.close),
            ),
          )),
    ]);
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
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        fontSize: isHeader ? 18 : 16,
      ),
      textAlign: TextAlign.center,
    ),
  );
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
