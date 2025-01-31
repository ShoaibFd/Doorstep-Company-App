import 'package:doorstep_company_app/widgets/edit_package/edit_your_package.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/bottom_sheet/review_bottom_sheet.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../../widgets/edit_package_button.dart';
import '../../widgets/round_button.dart';
import '../ac_screens/view_detail_sheet.dart';
import '../cart_screen/summary_screen.dart';
import '../mens salon & massage/widgets/package_row.dart';
import '../painting_wall_screen/rooms_wall_painting.dart';
import '../subcategory_screens/Widgets/service_container_widget.dart';
import '../subcategory_screens/Widgets/topbar_widget.dart';
import '../subcategory_screens/uc_cover_screen.dart';
import 'widgets/offers_section.dart';
import 'widgets/view_detail_bottom_sheet.dart';

class HairStudioScreen extends StatefulWidget {
  const HairStudioScreen({super.key});

  @override
  State<HairStudioScreen> createState() => _HairStudioScreenState();
}

class _HairStudioScreenState extends State<HairStudioScreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for scrolling to sections
  final GlobalKey _packagesKey = GlobalKey();
  final GlobalKey _makePackageKey = GlobalKey();
  final GlobalKey _waxingKey = GlobalKey();
  final GlobalKey _facialKey = GlobalKey();

  List<String> carouselImages = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
  ];

  List<int> itemCounts = List.filled(4, 0);
  int count = 0;
  final List itemPrice = [300, 200, 400, 600];

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  //scrollFunction for dialog
  void _scrollSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Navigator.pop(context);
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showMenuDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: AppColors.whiteTheme,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)),
          content: SizedBox(
              height: 200.px,
              child: Padding(
                padding: EdgeInsets.all(10.px),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 8.px,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServiceContainerWidget(
                              title: 'Packages',
                              onTap: () => _scrollSection(_packagesKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Make your package',
                              onTap: () => _scrollSection(_makePackageKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Waxing',
                              onTap: () => _scrollSection(_waxingKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Facial &\ncleanup',
                              onTap: () => _scrollSection(_facialKey),
                              image: 'assets/images/service.png'),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 220.px,
                        right: 140.px,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: AppColors.whiteTheme,
                            child: Icon(Icons.close),
                          ),
                        )),
                  ],
                ),
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50.px),
        child: SizedBox(
          width: 100.px,
          height: 36.px,
          child: FloatingActionButton(
            onPressed: () {
              _showMenuDialog();
            },
            backgroundColor: AppColors.blackColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.menu, size: 20.px, color: AppColors.whiteTheme),
                appText('Menu', color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
              padding: EdgeInsets.all(8.px),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TopBarwidget(carouselImages: carouselImages),
                appText("Hair Studio for Women", fontSize: 22.px, fontWeight: FontWeight.bold),
                SizedBox(height: 12.px),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          showReviewsBottomSheet(context);
                        },
                        child: Container(
                            height: 26.px,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(4.px), color: Colors.green.shade900),
                            child: Padding(
                                padding: EdgeInsets.all(4.px),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.star, color: Colors.white, size: 18.px),
                                    SizedBox(width: 4.px),
                                    appText("4.82", color: Colors.white, fontWeight: FontWeight.bold),
                                  ],
                                )))),
                    SizedBox(width: 10.px),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText("(1.4M Bookings)", color: AppColors.lightBlack),
                        SizedBox(width: width * 0.27, child: const DottedLine(dashColor: AppColors.greyColor)),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 4.px),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.px),
                    CustomContainer(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const UcCoverScreen()));
                        },
                        height: 80.px,
                        width: double.maxFinite,
                        color: AppColors.grey300.withOpacity(0.6),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 6.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.download_done_rounded, color: AppColors.greenColor.shade800),
                                  SizedBox(width: 10.px),
                                  Text('DC Cover',
                                      style: GoogleFonts.aclonica(
                                          color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 16.px)),
                                ],
                              ),
                              SizedBox(height: 6.px),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  appText('Warranty, rate card, claim process..', fontSize: 16.px),
                                  const Icon(Icons.chevron_right)
                                ],
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: 20.px),
                    offerSection(),
                    SizedBox(height: 10.px),
                    div(),
                  ],
                ),
                SizedBox(height: 20.px),
                Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        appText('Select Your Services', fontSize: 18.px, fontWeight: FontWeight.bold),
                        const Icon(Icons.arrow_downward_rounded),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ServiceContainerWidget(
                            title: 'Packages\n',
                            onTap: () => _scrollToSection(_packagesKey),
                            image: 'assets/images/service.png'),
                        ServiceContainerWidget(
                            title: 'Make your\npackage',
                            onTap: () => _scrollToSection(_makePackageKey),
                            image: 'assets/images/service.png'),
                        ServiceContainerWidget(
                            title: 'Waxing\n',
                            onTap: () => _scrollToSection(_waxingKey),
                            image: 'assets/images/service.png'),
                        ServiceContainerWidget(
                            title: 'Facial &\ncleanup',
                            onTap: () => _scrollToSection(_facialKey),
                            image: 'assets/images/service.png'),
                        SizedBox(height: 10.px),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.px),
                div(),
                SizedBox(height: 20.px),
                // Packages Section
                Container(
                    key: _packagesKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        appText('Packages', fontSize: 20.px, fontWeight: FontWeight.bold),
                        ListView.builder(
                          itemCount: itemCounts.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('Rs. 120 PER Waxing',
                                            color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                                        const SizedBox(height: 6),
                                        appText('Waxing and Facial', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        SizedBox(height: 6.px),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                SizedBox(width: 4.px),
                                                appText('4.85', color: AppColors.hintGrey),
                                                SizedBox(width: 4.px),
                                                appText('(621K reviews)', color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.3,
                                                child: const DottedLine(dashColor: AppColors.greyColor)),
                                          ],
                                        ),
                                        SizedBox(height: 22.px),
                                        Row(
                                          spacing: 10.px,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', fontWeight: FontWeight.bold),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            Icon(Icons.circle, size: 4.px, color: AppColors.hintGrey),
                                            appText('1hr 30 mins', color: AppColors.hintGrey),
                                          ],
                                        ),
                                        SizedBox(height: 6.px),
                                        Row(
                                          children: [
                                            Icon(Icons.local_offer, color: AppColors.darkGreen, size: 16.px),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.darkGreen),
                                          ],
                                        ),
                                        SizedBox(height: 20.px),
                                        packageRow(heading: 'Waxing', desc: 'Waxing for women'),
                                        packageRow(heading: 'Facial', desc: 'Facial for Women'),
                                        SizedBox(height: 10.px),
                                         EditPackageButton(onTap: (){
                                          showEditPackageBottomSheet(context);
                                        }),
                                        const Divider(),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (itemCounts[index] == 0) {
                                                  itemCounts[index] = 1;
                                                }
                                              });
                                            },
                                            child: itemCounts[index] > 0
                                                ? Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px),
                                                    height: 34.px,
                                                    width: 80.px,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.whiteTheme,
                                                        borderRadius: BorderRadius.circular(8.px),
                                                        border: Border.all(color: AppColors.lowPurple)),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]--;
                                                                if (itemCounts[index] < 0) {
                                                                  itemCounts[index] = 0;
                                                                }
                                                              });
                                                            },
                                                            child: Icon(Icons.remove,
                                                                size: 16.px, color: AppColors.lowPurple)),
                                                        appText(itemCounts[index].toString(),
                                                            color: AppColors.lowPurple,
                                                            fontSize: 16.px,
                                                            fontWeight: FontWeight.bold),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]++;
                                                                // _checkAndPlayConfetti();
                                                              });
                                                            },
                                                            child: Icon(Icons.add,
                                                                size: 16.px, color: AppColors.lowPurple)),
                                                      ],
                                                    ))
                                                : Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px),
                                                    height: 34.px,
                                                    width: 80.px,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.whiteTheme,
                                                        borderRadius: BorderRadius.circular(8.px),
                                                        border: Border.all(color: AppColors.lightGrey)),
                                                    child: Center(
                                                        child: appText('Add',
                                                            fontWeight: FontWeight.bold, color: AppColors.lowPurple)))),
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (BuildContext context) {
                                                return const ViewDetailBottomSheetScreen();
                                              },
                                            );
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(top: 120.px, left: 24.px),
                                              child: appText('2 Options')),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                index == 3 ? const SizedBox() : const Divider(),
                                const SizedBox(height: 20)
                              ],
                            );
                          },
                        ),
                        div()
                      ],
                    )),

                SizedBox(height: 10.px),
                // Make Your Own Package Section
                Container(
                    key: _makePackageKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        appText('Manicure & Pedicure', fontSize: 20.px, fontWeight: FontWeight.bold),
                        ListView.builder(
                          itemCount: itemCounts.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('Rs. 120 PER Pedicure',
                                            color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                                        const SizedBox(height: 6),
                                        appText('Manicure and Waxing', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        SizedBox(height: 6.px),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                SizedBox(width: 4.px),
                                                appText('4.85', color: AppColors.hintGrey),
                                                SizedBox(width: 4.px),
                                                appText('(621K reviews)', color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.3,
                                                child: const DottedLine(dashColor: AppColors.greyColor)),
                                          ],
                                        ),
                                        SizedBox(height: 22.px),
                                        Row(
                                          spacing: 10.px,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', fontWeight: FontWeight.bold),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            Icon(Icons.circle, size: 4.px, color: AppColors.hintGrey),
                                            appText('1hr 30 mins', color: AppColors.hintGrey),
                                          ],
                                        ),
                                        SizedBox(height: 6.px),
                                        Row(
                                          children: [
                                            Icon(Icons.local_offer, color: AppColors.darkGreen, size: 16.px),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.darkGreen),
                                          ],
                                        ),
                                        SizedBox(height: 20.px),
                                        SizedBox(width: width * 0.7, child: DottedLine(dashColor: AppColors.grey300)),
                                        const SizedBox(height: 10),
                                        appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                        SizedBox(height: 10.px),
                                        TextButton(
                                            onPressed: () {
                                              showHairStudioBottomSheet(context);
                                            },
                                            child: appText('View Details',
                                                color: AppColors.lowPurple, fontWeight: FontWeight.bold)),
                                        const Divider(),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        CustomContainer(
                                            margin: const EdgeInsets.only(bottom: 140),
                                            height: 90.px,
                                            width: 100.px,
                                            color: AppColors.grey300,
                                            borderRadius: 10.px,
                                            image: const DecorationImage(
                                                image: NetworkImage(
                                                    'https://media.istockphoto.com/id/692999494/photo/hairdresser-cutting-some-hair-tips.jpg?s=612x612&w=0&k=20&c=5bC0fdICk914P5JWYDOi6N3CirJV4IBMTxYJh32vi8o='),
                                                fit: BoxFit.cover),
                                            child: const SizedBox()),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (itemCounts[index] == 0) {
                                                  itemCounts[index] = 1;
                                                }
                                              });
                                            },
                                            child: itemCounts[index] > 0
                                                ? Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px),
                                                    height: 34.px,
                                                    width: 80.px,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.whiteTheme,
                                                        borderRadius: BorderRadius.circular(8.px),
                                                        border: Border.all(color: AppColors.lowPurple)),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]--;
                                                                if (itemCounts[index] < 0) {
                                                                  itemCounts[index] = 0;
                                                                }
                                                              });
                                                            },
                                                            child: Icon(Icons.remove,
                                                                size: 16.px, color: AppColors.lowPurple)),
                                                        appText(itemCounts[index].toString(),
                                                            color: AppColors.lowPurple,
                                                            fontSize: 16.px,
                                                            fontWeight: FontWeight.bold),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]++;
                                                              });
                                                            },
                                                            child: Icon(Icons.add,
                                                                size: 16.px, color: AppColors.lowPurple)),
                                                      ],
                                                    ))
                                                : Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px),
                                                    height: 34.px,
                                                    width: 80.px,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.whiteTheme,
                                                        borderRadius: BorderRadius.circular(8.px),
                                                        border: Border.all(color: AppColors.lightGrey)),
                                                    child: Center(
                                                        child: appText('Add',
                                                            fontWeight: FontWeight.bold, color: AppColors.lowPurple)))),
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (BuildContext context) {
                                                return const ViewDetailBottomSheetScreen();
                                              },
                                            );
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(top: 120.px, left: 24.px),
                                              child: appText('2 Options')),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                index == 3 ? const SizedBox() : const Divider(),
                                const SizedBox(height: 30)
                              ],
                            );
                          },
                        ),
                        div()
                      ],
                    )),
                SizedBox(height: 10.px),
                // Waxing Section
                Container(
                    key: _waxingKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        appText('Massage & Threadings', fontSize: 20.px, fontWeight: FontWeight.bold),
                        ListView.builder(
                          itemCount: itemCounts.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('Rs. 120 PER MASSAGE',
                                            color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                                        const SizedBox(height: 6),
                                        appText('Massage and threadings', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        SizedBox(height: 6.px),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                SizedBox(width: 4.px),
                                                appText('4.85', color: AppColors.hintGrey),
                                                SizedBox(width: 4.px),
                                                appText('(621K reviews)', color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.3,
                                                child: const DottedLine(dashColor: AppColors.greyColor)),
                                          ],
                                        ),
                                        SizedBox(height: 22.px),
                                        Row(
                                          spacing: 10.px,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', fontWeight: FontWeight.bold),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            Icon(Icons.circle, size: 4.px, color: AppColors.hintGrey),
                                            appText('1hr 30 mins', color: AppColors.hintGrey),
                                          ],
                                        ),
                                        SizedBox(height: 6.px),
                                        Row(
                                          children: [
                                            Icon(Icons.local_offer, color: AppColors.darkGreen, size: 16.px),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.darkGreen),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        serviceRow(serviceName: '', serviceDesc: 'Massage description'),
                                        const SizedBox(height: 4),
                                        serviceRow(serviceName: '', serviceDesc: 'Massage description'),
                                        SizedBox(height: 10.px),
                                        EditPackageButton(onTap: (){
                                          showEditPackageBottomSheet(context);
                                        }),
                                        const Divider(),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (itemCounts[index] == 0) {
                                                  itemCounts[index] = 1;
                                                }
                                              });
                                            },
                                            child: itemCounts[index] > 0
                                                ? Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px),
                                                    height: 34.px,
                                                    width: 80.px,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.whiteTheme,
                                                        borderRadius: BorderRadius.circular(8.px),
                                                        border: Border.all(color: AppColors.lowPurple)),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]--;
                                                                if (itemCounts[index] < 0) {
                                                                  itemCounts[index] = 0;
                                                                }
                                                              });
                                                            },
                                                            child: Icon(Icons.remove,
                                                                size: 16.px, color: AppColors.lowPurple)),
                                                        appText(itemCounts[index].toString(),
                                                            color: AppColors.lowPurple,
                                                            fontSize: 16.px,
                                                            fontWeight: FontWeight.bold),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]++;
                                                              });
                                                            },
                                                            child: Icon(Icons.add,
                                                                size: 16.px, color: AppColors.lowPurple)),
                                                      ],
                                                    ))
                                                : Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px),
                                                    height: 34.px,
                                                    width: 80.px,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.whiteTheme,
                                                        borderRadius: BorderRadius.circular(8.px),
                                                        border: Border.all(color: AppColors.lightGrey)),
                                                    child: Center(
                                                        child: appText('Add',
                                                            fontWeight: FontWeight.bold, color: AppColors.lowPurple)))),
                                      ],
                                    ),
                                  ],
                                ),
                                index == 3 ? const SizedBox() : const Divider(),
                                const SizedBox(height: 20)
                              ],
                            );
                          },
                        ),
                        div()
                      ],
                    )),
// Facial Section
                Container(
                    key: _facialKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Complete Care', fontSize: 20.px, fontWeight: FontWeight.bold),
                        ListView.builder(
                          itemCount: itemCounts.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.px),
                                        appText('Rs. 120 PER CARE',
                                            color: AppColors.darkGreen, fontWeight: FontWeight.bold),
                                        appText('Complete Care', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        SizedBox(height: 6.px),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                const SizedBox(width: 4),
                                                appText('4.85', fontSize: 12.px, color: AppColors.hintGrey),
                                                const SizedBox(width: 4),
                                                appText('(621K reviews)', fontSize: 12, color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.27, child: DottedLine(dashColor: AppColors.grey300)),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          spacing: 10.px,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', color: AppColors.darkGreen),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            Icon(Icons.circle, size: 4, color: AppColors.hintGrey),
                                            appText(' 1hr 30 mins', color: AppColors.hintGrey),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.local_offer, color: AppColors.greenColor, size: 16.px),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                          ],
                                        ),
                                        SizedBox(height: 30.px),
                                        SizedBox(
                                            width: width * 0.57, child: DottedLine(dashColor: Colors.grey.shade300)),
                                        appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                        SizedBox(height: 10.px),
                                        EditPackageButton(onTap: (){
                                          showEditPackageBottomSheet(context);
                                        }),
                                        const Divider(),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (itemCounts[index] == 0) {
                                                  itemCounts[index] = 1;
                                                }
                                              });
                                            },
                                            child: itemCounts[index] > 0
                                                ? Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px),
                                                    height: 34.px,
                                                    width: 90.px,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.whiteTheme,
                                                        borderRadius: BorderRadius.circular(8),
                                                        border: Border.all(color: AppColors.lightGrey)),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]--;
                                                                if (itemCounts[index] < 0) {
                                                                  itemCounts[index] = 0;
                                                                }
                                                              });
                                                            },
                                                            child: Icon(Icons.remove,
                                                                size: 16.px, color: AppColors.lowPurple)),
                                                        appText(itemCounts[index].toString(),
                                                            color: AppColors.lowPurple,
                                                            fontSize: 16.px,
                                                            fontWeight: FontWeight.bold),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]++;
                                                              });
                                                            },
                                                            child: Icon(Icons.add,
                                                                size: 16.px, color: AppColors.lowPurple)),
                                                      ],
                                                    ))
                                                : Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px),
                                                    height: 34.px,
                                                    width: 90.px,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.whiteTheme,
                                                        borderRadius: BorderRadius.circular(8),
                                                        border: Border.all(color: AppColors.lightGrey)),
                                                    child: Center(
                                                        child: appText('Add',
                                                            fontWeight: FontWeight.bold, color: AppColors.lowPurple)))),
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (BuildContext context) {
                                                return const ViewDetailBottomSheetScreen();
                                              },
                                            );
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(top: 120.px, left: 24),
                                              child: appText('4 Options')),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
                        div()
                      ],
                    )),
              ]))),
      bottomSheet: count > 0
          ? Align(alignment: Alignment.bottomCenter, child: roundButton(title: 'Done'))
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomContainer(
                    borderRadius: 0,
                    color: AppColors.darkGreen,
                    child: Padding(
                      padding: EdgeInsets.all(4.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_offer, color: AppColors.whiteTheme, size: 16.px.px),
                          SizedBox(width: 6.px),
                          appText('Congratulation, Rs.200 saved so far', color: AppColors.whiteTheme)
                        ],
                      ),
                    )),
                Container(
                  height: 70.px,
                  width: double.infinity,
                  color: AppColors.whiteTheme,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        appText('Rs. 1200', fontWeight: FontWeight.bold),
                        SizedBox(width: 10.px),
                        appText('Rs. 200',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.hintGrey),
                        const Spacer(),
                        CustomContainer(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SummaryScreen(
                                            onChecked: false,
                                          )));
                            },
                            color: AppColors.lowPurple,
                            borderRadius: 8.px,
                            height: 45.px,
                            width: 150.px,
                            child: Center(
                                child: appText('View Cart', fontWeight: FontWeight.w400, color: AppColors.whiteTheme))),
                      ],
                    ),
                  ),
                ),
                count > 0
                    ? Align(alignment: Alignment.bottomCenter, child: roundButton(title: 'Done'))
                    : const SizedBox(),
              ],
            ),
    );
  }

  Widget servicesContainerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.px),
        Row(
          spacing: 10.px,
          children: [
            appText('Select Your Services', fontSize: 22.px, fontWeight: FontWeight.bold),
            const Icon(Icons.arrow_downward_rounded)
          ],
        ),
        SizedBox(height: 20.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ServiceContainerWidget(
                title: 'Super saver\npackages',
                onTap: () => _scrollToSection(_packagesKey),
                image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Services\n',
                onTap: () => _scrollToSection(_makePackageKey),
                image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Repair &\ngas refill',
                onTap: () => _scrollToSection(_waxingKey),
                image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Installation &\nUninstallation',
                onTap: () => _scrollToSection(_facialKey),
                image: 'assets/images/service.png'),
          ],
        ),
        SizedBox(height: 10.px),
        div(),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
