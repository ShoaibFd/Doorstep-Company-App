import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/bottom_sheet/review_bottom_sheet.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../../widgets/round_button.dart';
import '../cart_screen/summary_screen.dart';
import '../mens salon & massage/widgets/package_row.dart';
import '../painting_wall_screen/Widgets/add_button.dart';
import '../subcategory_screens/Widgets/service_container_widget.dart';
import '../subcategory_screens/Widgets/topbar_widget.dart';
import 'widgets/offers_section.dart';
import 'widgets/spa_view_detail_sheet.dart';

class SpaForWomenDetailScreen extends StatefulWidget {
  const SpaForWomenDetailScreen({super.key});

  @override
  State<SpaForWomenDetailScreen> createState() => _SpaForWomenDetailScreenState();
}

class _SpaForWomenDetailScreenState extends State<SpaForWomenDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for scrolling to sections
  final GlobalKey _stressKey = GlobalKey();
  final GlobalKey _painKey = GlobalKey();
  final GlobalKey _skinCare = GlobalKey();
  final GlobalKey _addOns = GlobalKey();

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
                              title: 'Stress Relief',
                              onTap: () => _scrollSection(_stressKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Pain Relief',
                              onTap: () => _scrollSection(_painKey),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Skin care',
                              onTap: () => _scrollSection(_skinCare),
                              image: 'assets/images/service.png'),
                          ServiceContainerWidget(
                              title: 'Add-ons',
                              onTap: () => _scrollSection(_addOns),
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
      body: Stack(children: [
        SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TopBarwidget(carouselImages: carouselImages),
                  const SizedBox(height: 14),
                  appText("Spa Prime", fontSize: 22, fontWeight: FontWeight.bold),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            showReviewsBottomSheet(context);
                          },
                          child: Container(
                              height: 26.px,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.px), color: Colors.green.shade900),
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
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      offerSection(),
                      const SizedBox(height: 10),
                      div(),
                    ],
                  ),
                  // Services Section
                  servicesContainerWidget(),
                  const SizedBox(height: 10),
                  // Super Saver Section
                  Container(
                      key: _stressKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          appText('Stress Relief', fontSize: 20.px, fontWeight: FontWeight.bold),
                          ListView.builder(
                            itemCount: itemCounts.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CustomContainer(
                                      height: 200.px,
                                      width: double.maxFinite,
                                      borderRadius: 10,
                                      color: AppColors.grey300,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://primemassagecenter.com/wp-content/uploads/2017/06/aroma-therapy-massage-for-men-in-dubai.jpg'),
                                          fit: BoxFit.cover),
                                      child: const SizedBox()),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          appText('Rs. 120 PER AC',
                                              color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                                          const SizedBox(height: 6),
                                          appText('Power saver services (2 ACs)',
                                              fontSize: 18.px, fontWeight: FontWeight.bold),
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
                                          packageRow(heading: 'Haircut', desc: 'Haircut for men'),
                                          packageRow(heading: 'Beard grooming', desc: 'Beared trimming '),
                                          packageRow(heading: 'Massage', desc: '15 mins head massage'),
                                          SizedBox(height: 10.px),
                                          TextButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (BuildContext context) {
                                                    return const SpaViewDetailSheet();
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
                                          // GestureDetector(
                                          //     onTap: () {
                                          //       setState(() {
                                          //         if (itemCounts[index] == 0) {
                                          //           itemCounts[index] = 1;
                                          //         }
                                          //       });
                                          //     },
                                          //     child: itemCounts[index] > 0
                                          //         ? Container(
                                          //             margin: EdgeInsets.only(top: 30.px, left: 10.px),
                                          //             height: 34.px,
                                          //             width: 80.px,
                                          //             decoration: BoxDecoration(
                                          //                 color: AppColors.whiteTheme,
                                          //                 borderRadius: BorderRadius.circular(8.px),
                                          //                 border: Border.all(color: AppColors.lowPurple)),
                                          //             child: Row(
                                          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          //               children: [
                                          //                 InkWell(
                                          //                     onTap: () {
                                          //                       setState(() {
                                          //                         itemCounts[index]--;
                                          //                         if (itemCounts[index] < 0) {
                                          //                           itemCounts[index] = 0;
                                          //                         }
                                          //                       });
                                          //                     },
                                          //                     child: Icon(Icons.remove,
                                          //                         size: 16.px, color: AppColors.lowPurple)),
                                          //                 customText(itemCounts[index].toString(),
                                          //                     color: AppColors.lowPurple,
                                          //                     fontSize: 16.px,
                                          //                     fontWeight: FontWeight.bold),
                                          //                 InkWell(
                                          //                     onTap: () {
                                          //                       setState(() {
                                          //                         itemCounts[index]++;
                                          //                         _checkAndPlayConfetti();
                                          //                       });
                                          //                     },
                                          //                     child: Icon(Icons.add,
                                          //                         size: 16.px, color: AppColors.lowPurple)),
                                          //               ],
                                          //             ))
                                          //         : Container(
                                          //             margin: EdgeInsets.only(top: 30.px, left: 10.px),
                                          //             height: 34.px,
                                          //             width: 80.px,
                                          //             decoration: BoxDecoration(
                                          //                 color: AppColors.whiteTheme,
                                          //                 borderRadius: BorderRadius.circular(8.px),
                                          //                 border: Border.all(color: AppColors.lightGrey)),
                                          //             child: Center(
                                          //                 child: customText('Add',
                                          //                     fontWeight: FontWeight.bold,
                                          //                     color: AppColors.lowPurple)))),

                                          AddButton(
                                              onIncrement: () {
                                                itemCounts[index]++;
                                                _checkAndPlayConfetti();
                                              },
                                              onDecrement: () {
                                                itemCounts[index]--;
                                                if (itemCounts[index] < 0) {
                                                  itemCounts[index] = 0;
                                                }
                                              },
                                              count: count.toString()),
                                          GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (BuildContext context) {
                                                  return const SpaViewDetailSheet();
                                                },
                                              );
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(top: 50.px, left: 8.px),
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

                  const SizedBox(height: 10),
                  // Pain Key Section
                  Container(
                      key: _painKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          appText('Pain Relief', fontSize: 20.px, fontWeight: FontWeight.bold),
                          ListView.builder(
                            itemCount: itemCounts.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CustomContainer(
                                      height: 200.px,
                                      width: double.maxFinite,
                                      borderRadius: 10,
                                      color: AppColors.grey300,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://primemassagecenter.com/wp-content/uploads/2017/06/aroma-therapy-massage-for-men-in-dubai.jpg'),
                                          fit: BoxFit.cover),
                                      child: const SizedBox()),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          appText('Rs. 120 PER AC',
                                              color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                                          const SizedBox(height: 6),
                                          appText('Power saver services (2 ACs)',
                                              fontSize: 18.px, fontWeight: FontWeight.bold),
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
                                          packageRow(heading: 'Haircut', desc: 'Haircut for men'),
                                          packageRow(heading: 'Beard grooming', desc: 'Beared trimming '),
                                          packageRow(heading: 'Massage', desc: '15 mins head massage'),
                                          SizedBox(height: 10.px),
                                          TextButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (BuildContext context) {
                                                    return const SpaViewDetailSheet();
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
                                                      margin: EdgeInsets.only(top: 30.px, left: 10.px),
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
                                                                  _checkAndPlayConfetti();
                                                                });
                                                              },
                                                              child: Icon(Icons.add,
                                                                  size: 16.px, color: AppColors.lowPurple)),
                                                        ],
                                                      ))
                                                  : Container(
                                                      margin: EdgeInsets.only(top: 30.px, left: 10.px),
                                                      height: 34.px,
                                                      width: 80.px,
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
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (BuildContext context) {
                                                  return const SpaViewDetailSheet();
                                                },
                                              );
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(top: 70.px, left: 16.px),
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

                  const SizedBox(height: 10),
                  Container(
                      key: _skinCare,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          appText('Pain Relief', fontSize: 20.px, fontWeight: FontWeight.bold),
                          ListView.builder(
                            itemCount: itemCounts.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CustomContainer(
                                      height: 200.px,
                                      width: double.maxFinite,
                                      borderRadius: 10,
                                      color: AppColors.grey300,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://primemassagecenter.com/wp-content/uploads/2017/06/aroma-therapy-massage-for-men-in-dubai.jpg'),
                                          fit: BoxFit.cover),
                                      child: const SizedBox()),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          appText('Rs. 120 PER AC',
                                              color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                                          const SizedBox(height: 6),
                                          appText('Power saver services (2 ACs)',
                                              fontSize: 18.px, fontWeight: FontWeight.bold),
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
                                          packageRow(heading: 'Haircut', desc: 'Haircut for men'),
                                          packageRow(heading: 'Beard grooming', desc: 'Beared trimming '),
                                          packageRow(heading: 'Massage', desc: '15 mins head massage'),
                                          SizedBox(height: 10.px),
                                          TextButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (BuildContext context) {
                                                    return const SpaViewDetailSheet();
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
                                                      margin: EdgeInsets.only(top: 30.px, left: 10.px),
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
                                                                  _checkAndPlayConfetti();
                                                                });
                                                              },
                                                              child: Icon(Icons.add,
                                                                  size: 16.px, color: AppColors.lowPurple)),
                                                        ],
                                                      ))
                                                  : Container(
                                                      margin: EdgeInsets.only(top: 30.px, left: 10.px),
                                                      height: 34.px,
                                                      width: 80.px,
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
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (BuildContext context) {
                                                  return const SpaViewDetailSheet();
                                                },
                                              );
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(top: 70.px, left: 16.px),
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

                  Container(
                      key: _addOns,
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
                                  CustomContainer(
                                      height: 200.px,
                                      width: double.maxFinite,
                                      borderRadius: 10,
                                      color: AppColors.grey300,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://primemassagecenter.com/wp-content/uploads/2017/06/aroma-therapy-massage-for-men-in-dubai.jpg'),
                                          fit: BoxFit.cover),
                                      child: const SizedBox()),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10),
                                          appText('Rs. 120 PER AC', color: AppColors.darkGreen),
                                          appText('Kumkumadi face massage', fontSize: 18, fontWeight: FontWeight.bold),
                                          SizedBox(height: 4.px),
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
                                          SizedBox(height: 6.px),
                                          Row(
                                            spacing: 10,
                                            children: [
                                              appText('Rs. ${itemPrice[index]}',
                                                  color: AppColors.darkGreen, fontWeight: FontWeight.bold),
                                              appText('Rs. 200',
                                                  color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                              const Icon(Icons.circle, size: 4),
                                              appText(' 1hr 30 mins',
                                                  color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                            ],
                                          ),
                                          SizedBox(height: 10.px),
                                          Row(
                                            children: [
                                              Icon(Icons.local_offer, color: AppColors.darkGreen, size: 16),
                                              const SizedBox(width: 4),
                                              appText('Rs. 120 off  2nd items onward', color: AppColors.darkGreen),
                                            ],
                                          ),
                                          const SizedBox(height: 30),
                                          SizedBox(
                                              width: width * 0.57, child: DottedLine(dashColor: Colors.grey.shade300)),
                                          appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                          const SizedBox(height: 10),
                                          TextButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (BuildContext context) {
                                                    return const SpaViewDetailSheet();
                                                  },
                                                );
                                              },
                                              child: appText('View Details',
                                                  color: AppColors.lowPurple, fontWeight: FontWeight.bold)),
                                          const Divider(),
                                        ],
                                      ),
                                      AddButton(
                                          onIncrement: () {
                                            itemCounts[index]++;
                                            _checkAndPlayConfetti();
                                          },
                                          onDecrement: () {
                                            itemCounts[index]--;
                                          },
                                          count: itemCounts[index].toString())
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              );
                            },
                          ),
                          Divider(thickness: 8, color: AppColors.grey300),
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
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.local_offer, color: AppColors.whiteTheme, size: 16),
                            const SizedBox(width: 6),
                            appText('Congratulation, Rs.${_calculateSavings()} saved so far',
                                color: AppColors.whiteTheme)
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SummaryScreen(
                                            onChecked: false,
                                          )));
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
        const SizedBox(height: 10),
        Row(
          spacing: 10,
          children: [
            appText('Select Your Services', fontSize: 18, fontWeight: FontWeight.bold),
            const Icon(Icons.arrow_downward_rounded)
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ServiceContainerWidget(
                title: 'Stress Relief', onTap: () => _scrollToSection(_stressKey), image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Pain Relief', onTap: () => _scrollToSection(_painKey), image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Skin care', onTap: () => _scrollToSection(_skinCare), image: 'assets/images/service.png'),
            ServiceContainerWidget(
                title: 'Add-ons', onTap: () => _scrollToSection(_addOns), image: 'assets/images/service.png'),
          ],
        ),
        const SizedBox(height: 10),
        div(),
      ],
    );
  }
}
