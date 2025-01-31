import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/bottom_sheet/review_bottom_sheet.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../../widgets/round_button.dart';
import '../ac_screens/view_detail_sheet.dart';
import '../cart_screen/summary_screen.dart';
import '../painting_wall_screen/rooms_wall_painting.dart';
import '../subcategory_screens/Widgets/offers_container_widget.dart';
import '../subcategory_screens/Widgets/service_container_widget.dart';
import '../subcategory_screens/Widgets/topbar_widget.dart';
import '../subcategory_screens/uc_cover_screen.dart';
import 'bath_cleaning_bottom_sheet.dart';

class BathroomCleaningScreen extends StatefulWidget {
  const BathroomCleaningScreen({super.key});

  @override
  State<BathroomCleaningScreen> createState() => _BathroomCleaningScreenState();
}

class _BathroomCleaningScreenState extends State<BathroomCleaningScreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for scrolling to sections
  final GlobalKey _packagesKey = GlobalKey();
  final GlobalKey _makePackageKey = GlobalKey();
  final GlobalKey _waxingKey = GlobalKey();

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

  //
  void _scrollSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
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
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServiceContainerWidget(
                              title: 'Packages',
                              onTap: () => _scrollToSection(_packagesKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Bath cleaning',
                              onTap: () => _scrollToSection(_makePackageKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Mini service',
                              onTap: () => _scrollToSection(_waxingKey),
                              image: 'assets/images/service.png'),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 220,
                        right: 140,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
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
        padding: const EdgeInsets.only(bottom: 50),
        child: SizedBox(
          width: 100,
          height: 36,
          child: FloatingActionButton(
            onPressed: () {
              _showMenuDialog();
            },
            backgroundColor: AppColors.blackColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.menu, size: 20, color: AppColors.whiteTheme),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TopBarwidget(carouselImages: carouselImages),
                appText("Bathroom Cleaning", fontSize: 28, fontWeight: FontWeight.bold),
                const SizedBox(height: 12),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          showReviewsBottomSheet(context);
                        },
                        child: Container(
                            height: 34.px,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.green.shade900),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.star, color: Colors.white, size: 18),
                                    const SizedBox(width: 4),
                                    appText("4.82", color: Colors.white, fontWeight: FontWeight.bold),
                                  ],
                                )))),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText("(1.4M Bookings)", color: Colors.black54),
                        SizedBox(width: width * 0.27, child: DottedLine(dashColor: Colors.grey.shade300)),
                      ],
                    ),
                  ],
                ),
                //  SizedBox(height: 10.px),

                SizedBox(height: 20.px),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    CustomContainer(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const UcCoverScreen()));
                        },
                        height: 80,
                        width: double.maxFinite,
                        color: AppColors.grey300.withOpacity(0.6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.download_done_rounded, color: AppColors.greenColor.shade800),
                                  const SizedBox(width: 10),
                                  Text('DC Cover',
                                      style: GoogleFonts.aclonica(
                                          color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 20)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  appText('Warranty, rate card, claim process..', fontSize: 18),
                                  const Icon(Icons.chevron_right)
                                ],
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: 20.px),
                    const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            OffersContainers(
                              title: 'Amazon cashback upto Rs. 50',
                              subtitle: 'Get cashback via Amazon pay',
                            ),
                            OffersContainers(
                              title: 'Amazon cashback upto Rs. 50',
                              subtitle: 'Get cashback via Amazon pay',
                            ),
                          ],
                        )),
                    SizedBox(height: 10.px),
                    div(),
                  ],
                ),
                SizedBox(height: 20.px),
                // Services Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServiceContainerWidget(
                        title: 'Packages',
                        onTap: () => _scrollSection(_packagesKey),
                        image: 'assets/images/service.png'),
                    ServiceContainerWidget(
                        title: 'Bath cleaning',
                        onTap: () => _scrollSection(_makePackageKey),
                        image: 'assets/images/service.png'),
                    ServiceContainerWidget(
                        title: 'Mini service',
                        onTap: () => _scrollSection(_waxingKey),
                        image: 'assets/images/service.png'),
                    SizedBox(height: 10.px),
                  ],
                ),
                SizedBox(height: 20.px),
                div(),
                SizedBox(height: 20.px),
                // Super Saver Section
                Container(
                    key: _packagesKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Packages', fontSize: 20, fontWeight: FontWeight.bold),
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
                                        appText('PACKAGE', color: AppColors.greenColor, fontWeight: FontWeight.bold),
                                        //  SizedBox(height: 10.px),
                                        appText('Classic cleaning (2 bathrooms)',
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: AppColors.hintGrey, size: 16),
                                                const SizedBox(width: 4),
                                                appText('4.85', fontSize: 12, color: AppColors.hintGrey),
                                                const SizedBox(width: 4),
                                                appText('(621K reviews)', fontSize: 12, color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.27,
                                                child: DottedLine(dashColor: Colors.grey.shade300)),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          spacing: 10,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', fontWeight: FontWeight.bold),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            const Icon(Icons.circle, size: 4),
                                            appText('1hr 30 mins',
                                                color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(Icons.local_offer, color: AppColors.greenColor, size: 16),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                          ],
                                        ),
                                        SizedBox(height: 30.px),
                                        serviceRow(serviceName: 'Waxing', serviceDesc: 'Waxing description'),

                                        const SizedBox(height: 8),
                                        SizedBox(
                                            width: width * 0.57, child: DottedLine(dashColor: Colors.grey.shade300)),
                                        appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                        SizedBox(height: 10.px),
                                        TextButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (BuildContext context) {
                                                  return const BathCleaningDetailBottomSheetScreen();
                                                },
                                              );
                                            },
                                            child: appText('View Details',
                                                color: AppColors.lowPurple, fontWeight: FontWeight.bold)),

                                        const Divider(),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        CustomContainer(
                                            height: 100.px,
                                            color: AppColors.grey300,
                                            width: 110.px,
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
                                                  itemCounts[index] = 1; // Set count to 1 when adding
                                                }
                                              });
                                            },
                                            child: itemCounts[index] > 0
                                                ? Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px.px),
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
                                                            child: const Icon(Icons.remove,
                                                                size: 16, color: AppColors.lowPurple)),
                                                        appText(itemCounts[index].toString(),
                                                            color: AppColors.lowPurple,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]++;
                                                              });
                                                            },
                                                            child: const Icon(Icons.add,
                                                                size: 16, color: AppColors.lowPurple)),
                                                      ],
                                                    ))
                                                : Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px.px),
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
                                              margin: const EdgeInsets.only(top: 120, left: 24),
                                              child: appText('2 Options')),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
                        div(),
                      ],
                    )),
                SizedBox(height: 10.px),
                //Intense cleaning
                Container(
                    key: _waxingKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Intense cleaning', fontSize: 20, fontWeight: FontWeight.bold),
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
                                        appText('Rs. 120 PER Waxing', color: AppColors.greenColor),
                                        appText('Intense cleaning', fontSize: 18, fontWeight: FontWeight.bold),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: AppColors.hintGrey, size: 16),
                                                const SizedBox(width: 4),
                                                appText('4.85', fontSize: 12, color: AppColors.hintGrey),
                                                const SizedBox(width: 4),
                                                appText('(621K reviews)', fontSize: 12, color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.27,
                                                child: DottedLine(dashColor: Colors.grey.shade300)),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          spacing: 10,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            const Icon(Icons.circle, size: 4),
                                            appText('1hr 30 mins',
                                                color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(Icons.local_offer, color: AppColors.greenColor, size: 16),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                          ],
                                        ),
                                        SizedBox(height: 30.px),
                                        serviceRow(serviceName: 'cleaning', serviceDesc: 'Intense cleaning'),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                            width: width * 0.57, child: DottedLine(dashColor: Colors.grey.shade300)),
                                        appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                        SizedBox(height: 10.px),
                                        TextButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (BuildContext context) {
                                                  return const BathCleaningDetailBottomSheetScreen();
                                                },
                                              );
                                            },
                                            child: appText('View Details',
                                                color: AppColors.lowPurple, fontWeight: FontWeight.bold)),
                                        const Divider(),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        CustomContainer(
                                            height: 100.px,
                                            color: AppColors.grey300,
                                            width: 110.px,
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
                                                  itemCounts[index] = 1; // Set count to 1 when adding
                                                }
                                              });
                                            },
                                            child: itemCounts[index] > 0
                                                ? Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px.px),
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
                                                            child: const Icon(Icons.remove,
                                                                size: 16, color: AppColors.lowPurple)),
                                                        appText(itemCounts[index].toString(),
                                                            color: AppColors.lowPurple,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]++;
                                                              });
                                                            },
                                                            child: const Icon(Icons.add,
                                                                size: 16, color: AppColors.lowPurple)),
                                                      ],
                                                    ))
                                                : Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px.px),
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
                                              margin: const EdgeInsets.only(top: 120, left: 24),
                                              child: appText('6 Options')),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
                        div(),
                      ],
                    )),
                SizedBox(height: 10.px),

                Container(
                    key: _makePackageKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                        appText('Rs. 120 PER AC', color: AppColors.greenColor),
                                        appText('Complete care', fontSize: 18, fontWeight: FontWeight.bold),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: AppColors.hintGrey, size: 16),
                                                const SizedBox(width: 4),
                                                appText('4.85', fontSize: 12, color: AppColors.hintGrey),
                                                const SizedBox(width: 4),
                                                appText('(621K reviews)', fontSize: 12, color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.27,
                                                child: DottedLine(dashColor: Colors.grey.shade300)),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          spacing: 10,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            const Icon(Icons.circle, size: 4),
                                            appText(' 1hr 30 mins',
                                                color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.local_offer, color: AppColors.greenColor, size: 16),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                          ],
                                        ),
                                        SizedBox(height: 30.px),
                                        SizedBox(
                                            width: width * 0.57, child: DottedLine(dashColor: Colors.grey.shade300)),
                                        appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                        SizedBox(height: 10.px),
                                        TextButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (BuildContext context) {
                                                  return const BathCleaningDetailBottomSheetScreen();
                                                },
                                              );
                                            },
                                            child: appText('View Details',
                                                color: AppColors.lowPurple, fontWeight: FontWeight.bold)),
                                        const Divider(),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        CustomContainer(
                                            height: 100.px,
                                            color: AppColors.grey300,
                                            width: 110.px,
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
                                                  itemCounts[index] = 1; // Set count to 1 when adding
                                                }
                                              });
                                            },
                                            child: itemCounts[index] > 0
                                                ? Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px.px),
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
                                                            child: const Icon(Icons.remove,
                                                                size: 16, color: AppColors.lowPurple)),
                                                        appText(itemCounts[index].toString(),
                                                            color: AppColors.lowPurple,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                itemCounts[index]++;
                                                              });
                                                            },
                                                            child: const Icon(Icons.add,
                                                                size: 16, color: AppColors.lowPurple)),
                                                      ],
                                                    ))
                                                : Container(
                                                    margin: EdgeInsets.only(top: 80.px, left: 10.px.px),
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
                                              margin: const EdgeInsets.only(top: 120, left: 24),
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
                        div(),
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
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.local_offer, color: AppColors.whiteTheme, size: 16),
                          const SizedBox(width: 6),
                          appText('Congratulation, Rs.200 saved so far', color: AppColors.whiteTheme)
                        ],
                      ),
                    )),
                Container(
                  height: 70,
                  width: double.infinity,
                  color: AppColors.whiteTheme,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        appText('Rs. 1200', fontWeight: FontWeight.bold),
                        const SizedBox(width: 10),
                        appText('Rs. 200',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.hintGrey),
                        const Spacer(),
                        CustomContainer(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const SummaryScreen(onChecked: false)));
                            },
                            color: AppColors.lowPurple,
                            borderRadius: 8,
                            height: 45,
                            width: 150,
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
          spacing: 10,
          children: [
            appText('Select Your Services', fontSize: 22, fontWeight: FontWeight.bold),
            const Icon(Icons.arrow_downward_rounded)
          ],
        ),
        SizedBox(height: 20.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ServiceContainerWidget(
                title: 'Packages', onTap: () => _scrollSection(_packagesKey), image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Bath cleaning',
                onTap: () => _scrollSection(_makePackageKey),
                image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Mini service', onTap: () => _scrollSection(_waxingKey), image: 'assets/images/service.png'),
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
