import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../constants/colors.dart';
import '../../widgets/bottom_sheet/30_day_warranty.dart';
import '../../widgets/bottom_sheet/dc_verified_quotes.dart';
import '../../widgets/bottom_sheet/no_question_asked_bottom_sheet.dart';
import '../../widgets/bottom_sheet/review_bottom_sheet.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../../widgets/round_button.dart';
import '../home_screen/widgets/carousel_slider.dart';
import '../painting_wall_screen/Widgets/frequently_asked_questions_widget.dart';
import '../painting_wall_screen/Widgets/how_it_works_widget.dart';
import '../painting_wall_screen/Widgets/painting_view_detail_sheet.dart';
import '../painting_wall_screen/Widgets/reviews_widget.dart';
import '../painting_wall_screen/Widgets/share_btn.dart';
import '../subcategory_screens/dc_container.dart';
import '../subcategory_screens/rate_card_screen.dart';

class ViewDetailBottomSheetScreen extends StatefulWidget {
  const ViewDetailBottomSheetScreen({
    super.key,
  });

  @override
  State<ViewDetailBottomSheetScreen> createState() => _ViewDetailBottomSheetScreenState();
}

class _ViewDetailBottomSheetScreenState extends State<ViewDetailBottomSheetScreen> {
  void _toggleTextField() => setState(() => _isTextFieldVisible = !_isTextFieldVisible);

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
  bool _isTextFieldVisible = false;

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
                        appText('Split AC Installation', fontSize: 18.px, fontWeight: FontWeight.bold),
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
                    Row(
                      children: [
                        const Text('P', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColors.blackColor,
                            child: Center(child: Icon(Icons.bolt_outlined, color: AppColors.purpleColor, size: 14.px))),
                        appText("werSaver", fontSize: 20.px, fontWeight: FontWeight.bold),
                      ],
                    ),
                    appText("Save more on your electricity bill", fontSize: 20, fontWeight: FontWeight.bold),
                    SizedBox(height: 10.px),
                    appText("With advanced foam-jet technology for superior\ncleaning & better saving",
                        fontSize: 16.px),
                    SizedBox(height: 20.px),
                    Container(
                        decoration: BoxDecoration(
                            color: AppColors.grey300,
                            borderRadius: BorderRadius.circular(10.px),
                            border: Border.all(color: AppColors.grey300)),
                        child: ListTile(
                            title: appText('Learn how', fontSize: 18.px),
                            trailing:
                                Icon(_isTextFieldVisible ? Icons.keyboard_arrow_down_outlined : Icons.chevron_right),
                            onTap: _toggleTextField)),
                    if (_isTextFieldVisible)
                      Container(
                          decoration: BoxDecoration(
                              color: AppColors.grey300,
                              borderRadius: BorderRadius.circular(10.px),
                              border: Border.all(color: Colors.grey.shade200)),
                          child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: appText(
                                  'Assalam o Alaikum. Here we provide all the service in which daily life you need',
                                  fontSize: 16.px))),
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
                    howItWorks(context: context),
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
                    appText('Why Choose Power Saver?', fontSize: 20.px, fontWeight: FontWeight.w600),
                    SizedBox(height: 10.px),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 10,
                        columns: [
                          DataColumn(label: appText('')),
                          DataColumn(label: appText('Classic', fontSize: 16)),
                          DataColumn(label: appText('Intense', fontSize: 16)),
                          DataColumn(label: appText('Move-in', fontSize: 16)),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(appText('Scrubbing\nmachine', fontSize: 16)),
                            DataCell(appText('No')),
                            DataCell(appText('Yes')),
                            DataCell(appText('Yes')),
                          ]),
                          DataRow(cells: [
                            DataCell(appText('Stain type', fontSize: 16)),
                            DataCell(appText('Dirt stains')),
                            DataCell(appText('Hard water scales &\ntile grouting stains')),
                            DataCell(appText('Paint, cement &\nrust stains')),
                          ]),
                          DataRow(cells: [
                            DataCell(appText('Stain removal', fontSize: 16)),
                            DataCell(appText('5X stain removal')),
                            DataCell(appText('10X stain removal')),
                            DataCell(appText('10X stain removal')),
                          ]),
                          DataRow(cells: [
                            DataCell(appText('Shine', fontSize: 16)),
                            DataCell(appText('5X stain shine')),
                            DataCell(appText('5X stain shine')),
                            DataCell(appText('2 months long\nlasting shine')),
                          ]),
                          DataRow(cells: [
                            DataCell(appText('Suitable\nfrequency', fontSize: 16)),
                            DataCell(appText('Monthly')),
                            DataCell(appText('Quarterly')),
                            DataCell(appText('Relocation/occasional')),
                          ]),
                          DataRow(cells: [
                            DataCell(appText('Duration', fontSize: 16)),
                            DataCell(appText('50 min')),
                            DataCell(appText('70 min')),
                            DataCell(appText('85 min')),
                          ]),
                        ],
                      ),
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
