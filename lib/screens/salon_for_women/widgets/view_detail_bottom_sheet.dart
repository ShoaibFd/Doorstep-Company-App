import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constants/colors.dart';
import '../../../widgets/bottom_sheet/30_day_warranty.dart';
import '../../../widgets/bottom_sheet/dc_verified_quotes.dart';
import '../../../widgets/bottom_sheet/no_question_asked_bottom_sheet.dart';
import '../../../widgets/bottom_sheet/review_bottom_sheet.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/divider.dart';
import '../../home_screen/widgets/carousel_slider.dart';
import '../../painting_wall_screen/Widgets/frequently_asked_questions_widget.dart';
import '../../painting_wall_screen/Widgets/how_it_works_widget.dart';
import '../../painting_wall_screen/Widgets/painting_view_detail_sheet.dart';
import '../../painting_wall_screen/Widgets/reviews_widget.dart';
import '../../painting_wall_screen/Widgets/share_btn.dart';
import '../../subcategory_screens/dc_container.dart';

void showHairStudioBottomSheet(BuildContext context) {
  const String urlToShare = 'https://flutter.dev';
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
                    SizedBox(height: 10.px),
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
                          onTap: () => showNoQuestionAskedClaimedSheet(context),
                        ),
                        DcContainer(
                          image: 'assets/images/warranty.png',
                          title: 'DC verified\nquotes',
                          onTap: () => showDcVerifiedQuotes(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: height * 0.03),
                    div(),
                    howItWorks(context: context, title: 'About the Process'),
                    SizedBox(height: 20.px),
                    appText('What we bring', fontSize: 22, fontWeight: FontWeight.bold),
                    SizedBox(height: 10.px),
                    SizedBox(
                      height: 150.px,
                      child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomContainer(
                              margin: EdgeInsets.all(4.px),
                              color: AppColors.grey300.withOpacity(0.3),
                              borderRadius: 10.px,
                              width: 140.px,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                                child: Column(
                                  children: [
                                    appText('Hair comb & brushes', fontSize: 16, fontWeight: FontWeight.bold),
                                    SizedBox(height: 8.px),
                                    Image.network('https://pngimg.com/d/hairbrush_PNG93.png', height: 60.px)
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
                    SizedBox(height: 12.px),
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
                    appText('Whats excluded', fontSize: 24.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 20.px),
                    Row(
                      spacing: 16.px,
                      children: [
                        Icon(Icons.info, color: AppColors.hintGrey.withOpacity(0.5)),
                        appText('Hair wash', fontSize: 16.px, fontWeight: FontWeight.bold)
                      ],
                    ),
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
