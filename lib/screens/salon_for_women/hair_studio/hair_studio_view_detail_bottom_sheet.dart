import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../components/bottom_sheet/review_bottom_sheet.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_text.dart';
import '../../../components/divider.dart';
import '../../../constants/colors.dart';
import '../../home_screen/components/carousel_slider.dart';
import '../../painting_wall_screen/components/frequently_asked_questions_widget.dart';
import '../../painting_wall_screen/components/how_it_works_widget.dart';
import '../../painting_wall_screen/components/painting_view_detail_sheet.dart';
import '../../painting_wall_screen/components/reviews_widget.dart';
import '../../painting_wall_screen/components/share_btn.dart';

void showHairStudioBottomSheet(BuildContext context) {
  const String urlToShare = 'https://flutter.dev';
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
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      // Get screen dimensions
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;

      return Container(
        height: height * 0.9,
        decoration: BoxDecoration(
            color: AppColors.whiteTheme, borderRadius: BorderRadius.vertical(top: Radius.circular(15.px))),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        appText('Hair Studio for Women', fontSize: 22.px, fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(height: 8.px),
                    Row(
                      children: [
                        CustomContainer(
                          height: 28.px,
                          borderRadius: 4.px,
                          onTap: () {
                            showReviewsBottomSheet(context);
                          },
                          padding: EdgeInsets.symmetric(horizontal: 6.px),
                          color: AppColors.darkGreen,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.star, color: AppColors.whiteTheme, size: 16.px),
                              appText('4.82', color: AppColors.whiteTheme)
                            ],
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        appText("597K reviews"),
                      ],
                    ),
                    SizedBox(height: 16.px),
                    div(),
                    SizedBox(height: height * 0.02),
                    appText('Overview', fontSize: 24.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 30.px),
                    GridView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 12.px, mainAxisSpacing: 16.px, crossAxisCount: 3, mainAxisExtent: 140.px),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: AppColors.grey300.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.px),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.production_quantity_limits),
                                SizedBox(height: 12.px),
                                appText('Branded products', fontWeight: FontWeight.bold, height: 1.5)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.px),
                    div(),
                       ProcessTimeline(
                          steps: steps,
                          title: 'About the process',
                        ),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 30.px),
                    appText('What we bring', fontSize: 20.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 30.px),
                    SizedBox(
                      height: 130.px,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10.px),
                            height: 130.px,
                            width: 120.px,
                            decoration: BoxDecoration(
                              color: AppColors.grey300.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.px),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  appText('Hair comb & brushes', fontSize: 16.px, fontWeight: FontWeight.bold),
                                  const Spacer(),
                                  Image.network('https://pngimg.com/d/hair_dryer_PNG10.png', height: 60.px)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.px),
                    div(),
                    SizedBox(height: 30.px),
                    appText('Our Professionals', fontSize: 20, fontWeight: FontWeight.bold),
                    SizedBox(height: 10.px),
                    appText('Trained & experienced hairstylist at your home', fontSize: 16, color: AppColors.hintGrey),
                    SizedBox(height: 12.px),
                    ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(6.px),
                          height: 300.px,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: AppColors.grey300.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.px),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText('Gender-sensitied', fontWeight: FontWeight.bold, fontSize: 18.px),
                                SizedBox(height: 14.px),
                                appText(
                                    'All hairstylist undergo rigorous behavioural\ntraining to ensure that you feel safe &\ncomfortable at all time',
                                    fontSize: 16.px,
                                    color: AppColors.hintGrey),
                                SizedBox(height: 8.px),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.network(
                                      'https://static.vecteezy.com/system/resources/previews/044/200/814/non_2x/professional-barber-styling-hair-of-a-handsome-client-png.png',
                                      height: 140.px),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10.px),
                    CustomContainer(
                        color: AppColors.grey300.withOpacity(0.3),
                        borderRadius: 8.px,
                        width: double.maxFinite,
                        child: Padding(
                          padding: EdgeInsets.all(14.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText('Maintenance tips', fontSize: 24.px, fontWeight: FontWeight.bold),
                              SizedBox(height: 20.px),
                              Image.asset('assets/images/healthcare.png', height: 30.px),
                              SizedBox(height: 20.px),
                              appText('Gentle care', fontSize: 18.px, fontWeight: FontWeight.bold),
                              SizedBox(height: 20.px),
                              appText(
                                  'Consider productive styles like braids & bun along with using satin pillowcase to maintain the look for longer.',
                                  color: AppColors.hintGrey,
                                  fontSize: 16.px),
                              SizedBox(height: 20.px),
                              Image.asset('assets/images/brush.png', height: 30.px),
                              SizedBox(height: 20.px),
                              appText('Avoid excessive brushing', fontSize: 18.px, fontWeight: FontWeight.bold),
                              SizedBox(height: 20.px),
                              appText('Smooth out tangles with care, using a wide-tooth comb or your fingers',
                                  color: AppColors.hintGrey, fontSize: 16.px),
                              SizedBox(height: 20.px),
                              const Icon(Icons.water_drop_outlined),
                              SizedBox(height: 20.px),
                              appText('Avoid humidity', fontSize: 18.px, fontWeight: FontWeight.bold),
                              SizedBox(height: 20.px),
                              appText('Stay out of humid environment to avoid frizzing',
                                  color: AppColors.hintGrey, fontSize: 16.px),
                            ],
                          ),
                        )),
                    SizedBox(height: 20.px),
                    appText('What Included', fontSize: 20, fontWeight: FontWeight.bold),
                    SizedBox(height: 16.px),
                    suggestinRow('Advanced Foam-jet cleaning of indoor\nunit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Thorough cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Final checks & clean up'),
                    SizedBox(height: height * 0.020),
                    div(),
                    SizedBox(height: height * 0.020),
                    appText('What excluded', fontSize: 20, fontWeight: FontWeight.bold),
                    SizedBox(height: 16.px),
                    excludedRow(context: context, text: 'Advanced Foam-jet cleaning of indoor\nunit'),
                    SizedBox(height: 16.px),
                    excludedRow(context: context, text: 'Advanced Foam-jet cleaning of indoor\nunit'),
                    SizedBox(height: 16.px),
                    excludedRow(context: context, text: 'Advanced Foam-jet cleaning of indoor\nunit'),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    Padding(
                        padding: EdgeInsets.only(left: 40.px),
                        child: appText(
                            'Please wash the scalp & hair thoroughly before the service for the best result.',
                            color: AppColors.hintGrey,
                            fontSize: 16.px)),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    appText('Why Choose Power Saver?', fontSize: 20, fontWeight: FontWeight.w600),
                    SizedBox(height: 10.px),
                    Table(
                      border: TableBorder.all(),
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(3),
                        2: FlexColumnWidth(3),
                      },
                      children: [
                        commonRow(' ', 'UC power saver', 'Local servicing', isHeader: true),
                        commonRow('Energy savings', 'High', 'Low'),
                        commonRow('Savings report', '✔', '✖'),
                        commonRow('Technique', 'Foam-jet technology', 'Manual'),
                        commonRow('Service warranty', '30 days', '✖'),
                      ],
                    ),
                
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    const FrequentlyAskedQuestionsWidget(),
                    div(),
                    SizedBox(height: 20.px),
                    shareBtn(context, () {
                      Share.share('Check out the Flutter website: $urlToShare');
                    }),
                    SizedBox(height: height * 0.020),
                    const ReviewsWidget(),
                    SizedBox(height: 12.px),
                    SizedBox(height: height * 0.020),
                  ],
                ),
              ),
            ),

            // Close button
            Positioned(
              top: -55.px,
              right: 6.px,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget excludedRow({required BuildContext context, required String text}) {
  return Row(
    children: [
      Icon(Icons.cancel, color: AppColors.hintGrey, size: 20),
      SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
      appText(text, fontSize: 16),
    ],
  );
}
