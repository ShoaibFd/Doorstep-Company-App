import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
import '../../../constants/colors.dart';
import '../../ac_screens/components/ac_view_detail_sheet.dart';
import '../../cleaning & pest control/bathroom_cleaning/bath_cleaning_bottom_sheet.dart';
import '../../home_screen/components/carousel_slider.dart';
import '../../painting_wall_screen/components/frequently_asked_questions_widget.dart';
import '../../painting_wall_screen/components/how_it_works_widget.dart';
import '../../painting_wall_screen/components/reviews_widget.dart';
import '../../painting_wall_screen/components/share_btn.dart';
import '../../subcategory_screens/dc_container.dart';
import '../../subcategory_screens/rate_card_screen.dart';

class MensSalonDetailSheet extends StatefulWidget {
  const MensSalonDetailSheet({
    super.key,
  });

  @override
  State<MensSalonDetailSheet> createState() => _MensSalonDetailSheetState();
}

class _MensSalonDetailSheetState extends State<MensSalonDetailSheet> {
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
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Container(
            height: height * 0.9,
            width: width,
            decoration: BoxDecoration(
                color: AppColors.whiteTheme,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.px), topRight: Radius.circular(15.px))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.px),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CarouselSliderWidget(images: [
                      'assets/images/aaa.jpeg',
                      'assets/images/aa.jpeg',
                      'assets/images/aaaa.jpeg',
                      'assets/images/aaaaa.jpeg',
                      'assets/images/aaaaaa.jpeg',
                      'assets/images/a.jpeg',
                    ]),
                    SizedBox(width: 40.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText('Mens Salon Bottom Sheet', fontSize: 18.px, fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(height: 8.px),
                    Row(
                      children: [
                        CustomContainer(
                            height: 28.px,
                            borderRadius: 4,
                            onTap: () {
                              showReviewsBottomSheet(context);
                            },
                            padding: EdgeInsets.symmetric(horizontal: 6.px),
                            color: AppColors.greenColor.shade800,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.star, color: AppColors.whiteTheme, size: 16.px),
                                appText('4.82', color: AppColors.whiteTheme)
                              ],
                            )),
                        SizedBox(width: 14.px),
                        appText("597K reviews"),
                      ],
                    ),
                    SizedBox(height: 6.px),
                    Row(
                      children: [
                        appText("PKR 1098"),
                        SizedBox(width: 14.px),
                        appText("PKR 1338", decoration: TextDecoration.lineThrough, color: AppColors.greyColor),
                        SizedBox(width: 14.px),
                        const Icon(Icons.circle, size: 7, color: Colors.grey),
                        SizedBox(width: 14.px),
                        appText("1 hr 30 min", color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: 6.px),
                    Row(
                      children: [
                        Icon(Icons.local_offer, color: Colors.green.shade800, size: 18.px),
                        SizedBox(width: 6.px),
                        appText("PKR 240 off 2nd item onwards", color: Colors.green.shade800),
                      ],
                    ),
                    SizedBox(height: 10.px),
                    CustomContainer(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RateCardScreen()));
                        },
                        height: 55.px,
                        width: double.maxFinite,
                        color: AppColors.grey300.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.download_done_rounded, color: AppColors.greenColor.shade800),
                            Text('dc cover',
                                style: GoogleFonts.aclonica(
                                    color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 20.px)),
                            appText('Standard rate Card', fontSize: 18.px),
                            const Icon(Icons.chevron_right)
                          ],
                        )),
                    SizedBox(height: 16.px),
                    div(),
                    SizedBox(height: 10.px),
                    SizedBox(
                      height: 160.px,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomContainer(
                              margin: EdgeInsets.only(right: 10.px),
                              width: 160.px,
                              borderColor: AppColors.grey300,
                              borderRadius: 10.px,
                              color: AppColors.transparentColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.px, vertical: 8.px),
                                child: Column(
                                  spacing: 6.px,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 6.px),
                                    appText('Less cooling', fontSize: 16.px, fontWeight: FontWeight.bold),
                                    Row(children: [
                                      Icon(Icons.star, size: 15.px),
                                      appText('4.78 (23k reviews)', color: AppColors.lightBlack, fontSize: 12.px)
                                    ]),
                                    SizedBox(height: 6.px),
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
                                                height: 36.px,
                                                width: 76.px,
                                                decoration: BoxDecoration(
                                                    color: AppColors.lowPurple.withOpacity(0.1),
                                                    borderRadius: BorderRadius.circular(6.px),
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
                                                        child: Icon(Icons.remove,
                                                            size: 16.px, color: AppColors.lowPurple)),
                                                    appText(count.toString(),
                                                        color: AppColors.lowPurple,
                                                        fontSize: 16.px,
                                                        fontWeight: FontWeight.bold),
                                                    InkWell(
                                                        onTap: () {},
                                                        child: Icon(Icons.add,
                                                            size: 16, color: AppColors.hintGrey.withOpacity(0.2))),
                                                  ],
                                                ))
                                            : Container(
                                                height: 36.px,
                                                width: 76.px,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8.px),
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
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    Row(
                      children: [
                        Icon(Icons.download_done_rounded, color: AppColors.greenColor.shade800),
                        SizedBox(width: 8.px),
                        Text('dc cover',
                            style: GoogleFonts.aclonica(
                                color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 28)),
                      ],
                    ),
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
                            onTap: () => showNoQuestionAskedClaimedSheet(context)),
                        DcContainer(
                            image: 'assets/images/warranty.png',
                            title: 'DC verified\nquotes',
                            onTap: () => showDcVerifiedQuotes(context)),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    CustomContainer(
                        onTap: () {
                          showNoQuestionAskedClaimedSheet(context);
                        },
                        color: AppColors.grey300,
                        height: 55.px,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            appText('Learn about claim process', fontSize: 18.px),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.px,
                            )
                          ],
                        )),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    const Text("About the service", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16.px),
                    suggestinRow('Advanced Foam-jet cleaning of\nindoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Thorough cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Final checks & clean up'),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
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
                    SizedBox(height: 16.px),
                    div(),
                    SizedBox(height: 20.px),
                    appText("What we need from you", fontSize: 22.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 16.px),
                    suggestinRow('Advanced Foam-jet cleaning of indoor\nunit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Thorough cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Final checks & clean up'),
                    SizedBox(height: 20.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: height * 0.15,
                          width: width * 0.40,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade300),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: height * 0.020),
                              Image(image: const AssetImage('assets/images/stairs.png'), height: height * 0.050),
                              SizedBox(height: height * 0.010),
                              appText('A ladder', fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                        Container(
                            height: height * 0.15,
                            width: width * 0.40,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade300),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: height * 0.020),
                                Icon(Icons.power, size: 40.px),
                                SizedBox(height: height * 0.010),
                                appText('A plug point', fontWeight: FontWeight.bold),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 10.px),
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
                    ProcessTimeline(
                      steps: steps,
                      title: 'How It Works',
                    ),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    appText('We Service all Brands*', fontWeight: FontWeight.bold, fontSize: 20.px),
                    SizedBox(height: 16.px),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 80, crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Container(
                            decoration:
                                BoxDecoration(color: AppColors.whiteTheme, borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Image.asset(images[index], height: 50)));
                      },
                    ),
                    SizedBox(height: height * 0.030),
                    div(),
                    SizedBox(height: height * 0.030),
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
                    SizedBox(height: height * 0.020),
                    div(),
                    SizedBox(height: height * 0.020),
                    appText('Energy Saving Tips', fontSize: 20, fontWeight: FontWeight.bold),
                    SizedBox(height: 16.px),
                    suggestinRow('Advanced Foam-jet cleaning of indoor\nunit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Thorough cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Final checks & clean up'),
                    SizedBox(height: 16.px),
                    Row(
                      children: [
                        Icon(Icons.cancel, color: AppColors.hintGrey, size: 20),
                        SizedBox(width: width * 0.03),
                        appText('Avoid opening windows & doors', fontSize: 16),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    const FrequentlyAskedQuestionsWidget(),
                    SizedBox(height: 20.px),
                    shareBtn(context, () {
                      Share.share('Check out the Flutter website: $urlToShare');
                    }),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    const ReviewsWidget(),
                    SizedBox(height: 12.px),
                  ],
                )))
              ],
            )),
      ),
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
