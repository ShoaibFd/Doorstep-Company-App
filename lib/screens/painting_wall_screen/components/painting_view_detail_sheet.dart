import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_text.dart';
import '../../../components/divider.dart';
import '../../salon_for_women/spa_for_women/spa_view_detail_sheet.dart';
import 'frequently_asked_questions_widget.dart';
import 'how_it_works_widget.dart';
import 'requirements_section.dart';
import 'reviews_widget.dart';
import 'share_btn.dart';

class PaintingViewDetailBottomSheetScreen extends StatefulWidget {
  const PaintingViewDetailBottomSheetScreen({super.key});

  @override
  State<PaintingViewDetailBottomSheetScreen> createState() => _PaintingViewDetailBottomSheetScreenState();
}

class _PaintingViewDetailBottomSheetScreenState extends State<PaintingViewDetailBottomSheetScreen> {
  List<String> images1 = [
    'assets/images/aaa.jpeg',
    'assets/images/aa.jpeg',
    'assets/images/aaaa.jpeg',
    'assets/images/aaaaa.jpeg',
    'assets/images/aaaaaa.jpeg',
    'assets/images/a.jpeg',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.px),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(height: 20.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText('Bedroom painting', fontSize: 20.px, fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(height: height * 0.012),
                    Row(
                      children: [
                        appText("Starts at Rs. 1098", fontWeight: FontWeight.bold),
                        SizedBox(width: 10.px),
                        const Icon(Icons.circle, size: 7, color: AppColors.greyColor),
                        SizedBox(width: 10.px),
                        appText("3 days", color: AppColors.greyColor),
                      ],
                    ),
                    SizedBox(height: 10.px),
                    Row(
                      children: [
                        Icon(Icons.local_offer, color: Colors.green.shade800, size: 16),
                        SizedBox(width: 10.px),
                        appText("PKR 240 off 2nd item onwards", color: Colors.green.shade800),
                      ],
                    ),
                    SizedBox(height: 16.px),
                    div(),
                    SizedBox(height: 10.px),
                    const RequirementSection(),
                    div(),
                    SizedBox(height: 10.px),
                    appText("Price includes", fontSize: 22.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 20.px),
                    suggestinRow('Advanced Foam-jet cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Thorough cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Final checks & clean up'),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    appText("What we need from you", fontSize: 22.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 20.px),
                    suggestinRow('Advanced Foam-jet cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Thorough cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Final checks & clean up'),
                    SizedBox(height: 30.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 130.px,
                          width: 160.px,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(10.px), color: AppColors.grey300),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: const AssetImage('assets/images/stairs.png'), height: height * 0.050),
                              SizedBox(height: 20.px),
                              appText('A ladder', fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                        Container(
                            height: 130.px,
                            width: 160.px,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10.px), color: AppColors.grey300),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: const AssetImage('assets/images/plc.png'), height: height * 0.050),
                                SizedBox(height: 20.px),
                                appText('A plug point', fontWeight: FontWeight.bold),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    howItWorks(context: context),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    appText('We Service all Brands*', fontWeight: FontWeight.bold, fontSize: 20.px),
                    SizedBox(height: 16.px),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 80.px, crossAxisCount: 3, crossAxisSpacing: 8.px, mainAxisSpacing: 8.px),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Container(
                            decoration:
                                BoxDecoration(color: AppColors.whiteTheme, borderRadius: BorderRadius.circular(10.px)),
                            child: Center(child: Image.asset(images[index], height: 50.px)));
                      },
                    ),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    appText('Why Choose Power Saver?', fontSize: 20.px, fontWeight: FontWeight.bold),
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
                    appText('Energy Saving Tips', fontSize: 20.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 16.px),
                    suggestinRow('Advanced Foam-jet cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Thorough cleaning of indoor unit'),
                    SizedBox(height: 16.px),
                    suggestinRow('Final checks & clean up'),
                    SizedBox(height: 16.px),
                    avoidRow('Avoid opening windows & doors'),
                    SizedBox(height: 20.px),
                    div(),
                    SizedBox(height: 20.px),
                    const FrequentlyAskedQuestionsWidget(),
                    div(),
                    SizedBox(height: 20.px),
                    shareBtn(context, () {
                      Share.share('Check out the Flutter website: $urlToShare');
                    }),
                    SizedBox(height: 20.px),
                    const ReviewsWidget(),
                    SizedBox(height: 20.px),
                  ]),
                ))
              ],
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
            color: AppColors.grey300,
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
              width: width * 0.34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.px),
                color: Colors.grey.shade300,
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.px),
              height: height * 0.22,
              width: width * 0.34,
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
