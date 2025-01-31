import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widgets/bottom_sheet/review_bottom_sheet.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../../widgets/round_button.dart';
import '../cleaning & pest control/guideline_bottom_sheet.dart';
import '../painting_wall_screen/rooms_wall_painting.dart';
import '../subcategory_screens/Widgets/offers_container_widget.dart';
import '../subcategory_screens/Widgets/service_container_widget.dart';
import 'cleaning_view_detail_sheet.dart';

class HomeCleaningScreen extends StatefulWidget {
  const HomeCleaningScreen({super.key});

  @override
  State<HomeCleaningScreen> createState() => _HomeCleaningScreenState();
}

class _HomeCleaningScreenState extends State<HomeCleaningScreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for scrolling to sections
  final GlobalKey _furnishedKey = GlobalKey();
  final GlobalKey _unfurnishedKey = GlobalKey();
  final GlobalKey _roomKey = GlobalKey();
  final GlobalKey _bungalowKey = GlobalKey();

  List<String> carouselImages = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
  ];

// Add ConfettiController
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _scrollController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

// Single, clear function to check savings and play confetti
  void _checkAndPlayConfetti() {
    int savings = _calculateTotalSavings();
    // Check for specific savings milestones
    if (savings == 200 || savings == 400 || savings == 600) {
      _confettiController.play();
    }
  }

// Helper function to calculate total savings
  int _calculateTotalSavings() {
    int totalSavings = 0;
    for (int i = 0; i < itemCounts.length; i++) {
      totalSavings += (itemCounts[i] * 200); // 200 is the savings per item
    }
    return totalSavings;
  }

  // Add this method to calculate savings
  double _calculateSavings() {
    return itemCounts.fold(0, (sum, count) => sum + (count * 200));
  }

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
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                              title: 'Furnished\napartment',
                              onTap: () => _scrollSection(_furnishedKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Unfurnished\napartment',
                              onTap: () => _scrollSection(_unfurnishedKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Book by\nroom',
                              onTap: () => _scrollSection(_roomKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Furnished \nbungalow/duplex',
                              onTap: () => _scrollSection(_bungalowKey),
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
    double height = MediaQuery.of(context).size.height;
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
      body: Scaffold(
        appBar: AppBar(
          title: appText('Full Home Cleaning', fontSize: 20.px, fontWeight: FontWeight.bold),
        ),
        body: Stack(children: [
          SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px.px),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(height: 20.px),
                    appText("Full Home Cleaning", fontSize: 28.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 8.px),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              showReviewsBottomSheet(context);
                            },
                            child: Container(
                                height: 34.px,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.px), color: Colors.green.shade900),
                                child: Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.star, color: AppColors.whiteTheme, size: 18.px),
                                        SizedBox(width: 4.px),
                                        appText("4.82", color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
                                      ],
                                    )))),
                        SizedBox(width: 10.px),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText("(1.4M Bookings)", color: AppColors.lightBlack),
                            SizedBox(width: width * 0.27, child: DottedLine(dashColor: AppColors.greyColor.shade300)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          OffersContainers(
                              title: 'Amazon cashback upto Rs. 50', subtitle: 'Get cashback via Amazon pay'),
                          OffersContainers(
                              title: 'Amazon cashback upto Rs. 50', subtitle: 'Get cashback via Amazon pay'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.px),
                    div(),
                    // Services Section
                    servicesContainerWidget(),
                    SizedBox(height: 10.px),
                    // Furnished Apartment Section
                    Container(
                        key: _furnishedKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText('Furnished Apartment', fontSize: 20.px, fontWeight: FontWeight.bold),
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
                                            SizedBox(height: 20.px),
                                            appText('Rs. 120 PER AC', color: AppColors.greenColor),
                                            appText('1 BHK apartment\ncleaning',
                                                fontSize: 18.px, fontWeight: FontWeight.bold),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                    SizedBox(width: 4.px),
                                                    appText('4.85', fontSize: 12, color: AppColors.hintGrey),
                                                    SizedBox(width: 4.px),
                                                    appText('(621K reviews)',
                                                        fontSize: 12.px, color: AppColors.hintGrey),
                                                  ],
                                                ),
                                                SizedBox(
                                                    width: width * 0.27,
                                                    child: DottedLine(dashColor: AppColors.greyColor.shade300)),
                                              ],
                                            ),
                                            SizedBox(height: 6.px),
                                            Row(
                                              spacing: 10.px,
                                              children: [
                                                appText('Rs. ${itemPrice[index]}', fontWeight: FontWeight.bold),
                                                appText('Rs. 200',
                                                    color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                                Icon(Icons.circle, size: 4.px),
                                                appText('1hr 30 mins',
                                                    color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                              ],
                                            ),
                                            SizedBox(height: 6.px),
                                            Row(
                                              children: [
                                                Icon(Icons.local_offer, color: AppColors.greenColor, size: 16.px),
                                                SizedBox(width: 4.px),
                                                appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                              ],
                                            ),
                                            SizedBox(height: 8.px),
                                            serviceRow(serviceName: 'Ac repair', serviceDesc: 'Ac repair description'),
                                            SizedBox(height: 8.px),
                                            SizedBox(
                                                width: width * 0.57,
                                                child: DottedLine(dashColor: AppColors.greyColor.shade300)),
                                            appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                            SizedBox(height: 10.px),
                                            TextButton(
                                                onPressed: () {
                                                  showCleaningDetailSheet(context);
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
                                                        'https://remaxinterlake.ca/wp-content/uploads/2023/12/kathy-kuo-guest-room.jpg'),
                                                    fit: BoxFit.contain),
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
                                                                    _checkAndPlayConfetti();
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
                                                                fontWeight: FontWeight.bold,
                                                                color: AppColors.lowPurple)))),
                                            GestureDetector(
                                              onTap: () {
                                                showCleaningDetailSheet(context);
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(top: 120.px, left: 24.px),
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
                    // Unfurnished apartment Section
                    Container(
                        key: _roomKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText('Unfurnished apartment', fontSize: 20.px, fontWeight: FontWeight.bold),
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
                                            SizedBox(height: 20.px),
                                            appText('Rs. 120 PER AC', color: AppColors.greenColor),
                                            //   SizedBox(height: 10.px),
                                            appText('1 BHK apartment\ncleaning',
                                                fontSize: 18.px, fontWeight: FontWeight.bold),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                    SizedBox(width: 4.px),
                                                    appText('4.85', fontSize: 12.px, color: AppColors.hintGrey),
                                                    SizedBox(width: 4.px),
                                                    appText('(621K reviews)',
                                                        fontSize: 12.px, color: AppColors.hintGrey),
                                                  ],
                                                ),
                                                SizedBox(
                                                    width: width * 0.27,
                                                    child: DottedLine(dashColor: AppColors.greyColor.shade300)),
                                              ],
                                            ),
                                            SizedBox(height: 6.px),
                                            Row(
                                              spacing: 10,
                                              children: [
                                                appText('Rs. ${itemPrice[index]}', fontWeight: FontWeight.bold),
                                                appText('Rs. 200',
                                                    color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                                Icon(Icons.circle, size: 4.px),
                                                appText('1hr 30 mins',
                                                    color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                              ],
                                            ),
                                            SizedBox(height: 6.px),
                                            Row(
                                              children: [
                                                Icon(Icons.local_offer, color: AppColors.greenColor, size: 16.px),
                                                SizedBox(width: 4.px),
                                                appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                              ],
                                            ),
                                            SizedBox(height: 8.px),
                                            serviceRow(serviceName: 'Ac repair', serviceDesc: 'Ac repair description'),
                                            SizedBox(height: 8.px),
                                            SizedBox(
                                                width: width * 0.57,
                                                child: DottedLine(dashColor: AppColors.greyColor.shade300)),
                                            appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                            SizedBox(height: 10.px),
                                            TextButton(
                                                onPressed: () {
                                                  showCleaningDetailSheet(context);
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
                                                        'https://remaxinterlake.ca/wp-content/uploads/2023/12/kathy-kuo-guest-room.jpg'),
                                                    fit: BoxFit.contain),
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
                                                                    _checkAndPlayConfetti();
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
                                                            borderRadius: BorderRadius.circular(8.px),
                                                            border: Border.all(color: AppColors.lightGrey)),
                                                        child: Center(
                                                            child: appText('Add',
                                                                fontWeight: FontWeight.bold,
                                                                color: AppColors.lowPurple)))),
                                            GestureDetector(
                                              onTap: () {
                                                showCleaningDetailSheet(context);
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(top: 120.px, left: 24.px),
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
                    Container(
                        key: _bungalowKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText('Book by room', fontSize: 20.px, fontWeight: FontWeight.bold),
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
                                            appText('Bedroom cleaning', fontSize: 18.px, fontWeight: FontWeight.bold),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                    SizedBox(width: 4.px),
                                                    appText('4.85', fontSize: 12.px, color: AppColors.hintGrey),
                                                    SizedBox(width: 4.px),
                                                    appText('(621K reviews)',
                                                        fontSize: 12.px, color: AppColors.hintGrey),
                                                  ],
                                                ),
                                                SizedBox(
                                                    width: width * 0.27,
                                                    child: DottedLine(dashColor: AppColors.grey300)),
                                              ],
                                            ),
                                            SizedBox(height: 6.px),
                                            Row(
                                              spacing: 10,
                                              children: [
                                                appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                                appText('Rs. 200',
                                                    color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                                Icon(Icons.circle, size: 4.px),
                                                appText(' 1hr 30 mins',
                                                    color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.local_offer, color: AppColors.greenColor, size: 16.px),
                                                SizedBox(width: 4.px),
                                                appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                              ],
                                            ),
                                            SizedBox(height: 8.px),
                                            serviceRow(serviceName: 'Ac repair', serviceDesc: 'Ac repair description'),
                                            SizedBox(height: 8.px),
                                            SizedBox(
                                                width: width * 0.57,
                                                child: DottedLine(dashColor: AppColors.greyColor.shade300)),
                                            appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                            SizedBox(height: 10.px),
                                            TextButton(
                                                onPressed: () {
                                                  showCleaningDetailSheet(context);
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
                                                        'https://remaxinterlake.ca/wp-content/uploads/2023/12/kathy-kuo-guest-room.jpg'),
                                                    fit: BoxFit.contain),
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
                                                                    _checkAndPlayConfetti();
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
                                                            borderRadius: BorderRadius.circular(8.px),
                                                            border: Border.all(color: AppColors.lightGrey)),
                                                        child: Center(
                                                            child: appText('Add',
                                                                fontWeight: FontWeight.bold,
                                                                color: AppColors.lowPurple)))),
                                            GestureDetector(
                                              onTap: () {
                                                showCleaningDetailSheet(context);
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(top: 120.px, left: 24.px),
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
                    Container(
                        key: _unfurnishedKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText('Unfurnished bungalow/duplex', fontSize: 20, fontWeight: FontWeight.bold),
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
                                            appText('Kitchen appliances cleaning',
                                                fontSize: 18, fontWeight: FontWeight.bold),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                    SizedBox(width: 4.px),
                                                    appText('4.85', fontSize: 12.px, color: AppColors.hintGrey),
                                                    SizedBox(width: 4.px),
                                                    appText('(621K reviews)',
                                                        fontSize: 12.px, color: AppColors.hintGrey),
                                                  ],
                                                ),
                                                SizedBox(
                                                    width: width * 0.27,
                                                    child: DottedLine(dashColor: AppColors.grey300)),
                                              ],
                                            ),
                                            SizedBox(height: 6.px),
                                            Row(
                                              spacing: 10.px,
                                              children: [
                                                appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                                appText('Rs. 200',
                                                    color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                                Icon(Icons.circle, size: 4.px),
                                                appText(' 1hr 30 mins',
                                                    color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.local_offer, color: AppColors.greenColor, size: 16.px),
                                                SizedBox(width: 4.px),
                                                appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                              ],
                                            ),
                                            SizedBox(height: 30.px),
                                            SizedBox(
                                                width: width * 0.57,
                                                child: DottedLine(dashColor: AppColors.greyColor.shade300)),
                                            appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                            SizedBox(height: 10.px),
                                            TextButton(
                                                onPressed: () {
                                                  showCleaningDetailSheet(context);
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
                                                        'https://remaxinterlake.ca/wp-content/uploads/2023/12/kathy-kuo-guest-room.jpg'),
                                                    fit: BoxFit.contain),
                                                child: const SizedBox()),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (itemCounts[index] == 0) {
                                                      itemCounts[index] = 1;
                                                      _checkAndPlayConfetti();
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
                                                                    _checkAndPlayConfetti();
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
                                                            borderRadius: BorderRadius.circular(8.px),
                                                            border: Border.all(color: AppColors.lightGrey)),
                                                        child: Center(
                                                            child: appText('Add',
                                                                fontWeight: FontWeight.bold,
                                                                color: AppColors.lowPurple)))),
                                            GestureDetector(
                                              onTap: () {
                                                showCleaningDetailSheet(context);
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(top: 120.px, left: 24.px),
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
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              emissionFrequency: 0.20,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 30,
              gravity: 0.2,
              shouldLoop: false,
              colors: [AppColors.darkGreen, AppColors.blueShade, Colors.pink, Colors.orange, AppColors.lowPurple],
            ),
          ),
        ]),
      ),
      bottomSheet: count > 0
          ? Align(alignment: Alignment.bottomCenter, child: roundButton(title: 'Done'))
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_calculateSavings() > 0)
                  CustomContainer(
                      borderRadius: 0,
                      color: AppColors.darkGreen,
                      child: Padding(
                        padding: EdgeInsets.all(4.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.local_offer, color: AppColors.whiteTheme, size: 16.px),
                            SizedBox(width: 6.px),
                            appText('Congratulation, Rs.${_calculateSavings()} saved so far',
                                color: AppColors.whiteTheme)
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
                              showGuidelinesBottomSheet(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const SummaryScreen(
                              //               onChecked: false,
                              //             )));
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
                title: 'Furnished\napartment',
                onTap: () => _scrollToSection(_furnishedKey),
                image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Unfurnished\napartment',
                onTap: () => _scrollToSection(_unfurnishedKey),
                image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Book by\nroom', onTap: () => _scrollToSection(_roomKey), image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Furnished\nbungalow/duplex',
                onTap: () => _scrollToSection(_bungalowKey),
                image: 'assets/images/service.png'),
          ],
        ),
        SizedBox(height: 10.px),
        div()
      ],
    );
  }
}
