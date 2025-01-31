import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:doorstep_company_app/screens/cart_screen/summary_screen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/bottom_sheet/review_bottom_sheet.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/round_button.dart';
import '../../ac_screens/view_detail_sheet.dart';
import '../../painting_wall_screen/rooms_wall_painting.dart';
import '../../subcategory_screens/Widgets/offers_container_widget.dart';
import '../../subcategory_screens/Widgets/topbar_widget.dart';
import '../../subcategory_screens/uc_cover_screen.dart';

class ProjectsDetailScreen extends StatefulWidget {
  const ProjectsDetailScreen({super.key});

  @override
  State<ProjectsDetailScreen> createState() => _ProjectsDetailScreenState();
}

class _ProjectsDetailScreenState extends State<ProjectsDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  List<String> carouselImages = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
  ];
// Add these keys to your state class
  final Map<String, GlobalKey> sectionKeys = {
    'Hair cutting': GlobalKey(),
    'Facial Makeover': GlobalKey(),
    'Manicure': GlobalKey(),
    'Pedicure': GlobalKey()
  };
// Add ConfettiController
  late ConfettiController _confettiController;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

// Single, clear function to check savings and play confetti
  void checkAndPlayConfetti() {
    int savings = _calculateTotalSavings();
    if (savings == 200 || savings == 400 || savings == 600) {
      _confettiController.play();
    }
  }

// Helper function to calculate total savings
  int _calculateTotalSavings() {
    int totalSavings = 0;
    for (int i = 0; i < itemCounts.length; i++) {
      totalSavings += (itemCounts[i] * 200);
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
  List filterTitles = ['Hair cutting', 'Facial Makeover', 'Manicure', 'Pedicure'];
  int selectedIndex = 0;
  final List<GlobalKey> serviceKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  void _onScroll() {
    final scrollPosition = _scrollController.position.pixels;
    final screenHeight = MediaQuery.of(context).size.height;

    // Check each section's position
    sectionKeys.forEach((title, key) {
      final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero).dy;
        if (position < screenHeight * 0.5 && position > 0) {
          setState(() {
            selectedIndex = filterTitles.indexOf(title);
          });
        }
      }
    });
  }

  Widget filterButton({
    required VoidCallback? onTap,
    required String? title,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        height: 34,
        width: 140,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey, // Change border color
          ),
          borderRadius: BorderRadius.circular(30),
          color: isSelected ? Colors.blue : Colors.transparent, // Change background color
        ),
        child: Center(
          child: Text(
            title ?? "",
            style: TextStyle(
              fontSize: 16.px.px,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black, // Change text color
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
                padding: EdgeInsets.all(8.px),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TopBarwidget(carouselImages: carouselImages),
                  appText("Women Salon and Spa", fontSize: 28, fontWeight: FontWeight.bold),
                  SizedBox(height: 12.px),
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
                                  padding: EdgeInsets.all(8.px),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(Icons.star, color: Colors.white, size: 18),
                                      SizedBox(width: 4.px),
                                      appText("4.82", color: Colors.white, fontWeight: FontWeight.bold),
                                    ],
                                  )))),
                      SizedBox(width: 10.px),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText("(1.4M Bookings)", color: Colors.black54),
                          SizedBox(width: width * 0.27, child: DottedLine(dashColor: Colors.grey.shade300)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.px),
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
                            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 6),
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
                                            color: AppColors.darkGreen,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.px.px)),
                                  ],
                                ),
                                SizedBox(height: 6.px),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    appText('Warranty, rate card, claim process..', fontSize: 18.px),
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
                        ),
                      ),
                      SizedBox(height: 10.px),
                      div(),
                    ],
                  ),
                  SizedBox(height: 10.px),
                  // Services Section
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(filterTitles.length, (index) {
                        return filterButton(
                          title: filterTitles[index],
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              _onScroll();
                              selectedIndex = index;
                            });
                          },
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 10.px),
                  // Super Saver Section
                  Container(
                      key: sectionKeys['Hair cutting'],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Super Saver Packages', fontSize: 20.px.px, fontWeight: FontWeight.bold),
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
                                          appText('Women Salon', fontSize: 18.px, fontWeight: FontWeight.bold),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                  SizedBox(width: 4.px),
                                                  appText('4.85', fontSize: 12.px.px, color: AppColors.hintGrey),
                                                  SizedBox(width: 4.px),
                                                  appText('(621K reviews)',
                                                      fontSize: 12.px.px, color: AppColors.hintGrey),
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
                                          const SizedBox(height: 30),
                                          serviceRow(serviceName: 'Hair cutting', serviceDesc: 'Cutting description'),
                                          SizedBox(height: 8.px),
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
                                                    return const ViewDetailBottomSheetScreen();
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
                                                  image: AssetImage('assets/images/air-conditioner.png'),
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
                                                          borderRadius: BorderRadius.circular(8.px),
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
                                                              fontSize: 16.px.px,
                                                              fontWeight: FontWeight.bold),
                                                          InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  itemCounts[index]++;
                                                                  checkAndPlayConfetti();
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
                          Divider(thickness: 8, color: AppColors.grey300),
                        ],
                      )),
                  SizedBox(height: 10.px),
                  // Repair & Gas Refill Section
                  Container(
                      key: sectionKeys['Manicure'],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Manicure & Pedicure', fontSize: 20.px.px, fontWeight: FontWeight.bold),
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
                                          appText('Rs. 120 PER Manicure', color: AppColors.greenColor),
                                          appText('Manicure', fontSize: 18.px, fontWeight: FontWeight.bold),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                  SizedBox(width: 4.px),
                                                  appText('4.85', fontSize: 12.px.px, color: AppColors.hintGrey),
                                                  SizedBox(width: 4.px),
                                                  appText('(621K reviews)',
                                                      fontSize: 12.px.px, color: AppColors.hintGrey),
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
                                              appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
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
                                          const SizedBox(height: 30),
                                          serviceRow(serviceName: 'Pedicure', serviceDesc: 'Pedicure description'),
                                          SizedBox(height: 8.px),
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
                                                    return const ViewDetailBottomSheetScreen();
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
                                                  image: AssetImage('assets/images/air-conditioner.png'),
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
                                                          borderRadius: BorderRadius.circular(8.px),
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
                                                              fontSize: 16.px.px,
                                                              fontWeight: FontWeight.bold),
                                                          InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  itemCounts[index]++;
                                                                  checkAndPlayConfetti();
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
                          Divider(thickness: 8, color: AppColors.grey300),
                        ],
                      )),
                  SizedBox(height: 10.px),
                  Container(
                      key: sectionKeys['Facial Makeover'],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Waxing', fontSize: 20.px.px, fontWeight: FontWeight.bold),
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
                                          appText('Facial and makeup', fontSize: 18.px, fontWeight: FontWeight.bold),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                  SizedBox(width: 4.px),
                                                  appText('4.85', fontSize: 12.px.px, color: AppColors.hintGrey),
                                                  SizedBox(width: 4.px),
                                                  appText('(621K reviews)',
                                                      fontSize: 12.px.px, color: AppColors.hintGrey),
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
                                          serviceRow(serviceName: 'Facial', serviceDesc: 'Facial description'),
                                          SizedBox(height: 8.px),
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
                                                    return const ViewDetailBottomSheetScreen();
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
                                                  image: AssetImage('assets/images/air-conditioner.png'),
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
                                                          borderRadius: BorderRadius.circular(8.px),
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
                                                              fontSize: 16.px.px,
                                                              fontWeight: FontWeight.bold),
                                                          InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  itemCounts[index]++;
                                                                  checkAndPlayConfetti();
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
                          Divider(thickness: 8, color: AppColors.grey300),
                        ],
                      )),
                  Container(
                      key: sectionKeys['Pedicure'],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Services', fontSize: 20.px.px, fontWeight: FontWeight.bold),
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
                                          appText('Rs. 120 PER FACIAL', color: AppColors.greenColor),
                                          appText('Bridal Grooming', fontSize: 18.px, fontWeight: FontWeight.bold),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.star, color: AppColors.hintGrey, size: 16.px),
                                                  SizedBox(width: 4.px),
                                                  appText('4.85', fontSize: 12.px.px, color: AppColors.hintGrey),
                                                  SizedBox(width: 4.px),
                                                  appText('(621K reviews)',
                                                      fontSize: 12.px.px, color: AppColors.hintGrey),
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
                                          const SizedBox(height: 30),
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
                                                    return const ViewDetailBottomSheetScreen();
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
                                                  image: AssetImage('assets/images/air-conditioner.png'),
                                                  fit: BoxFit.contain),
                                              child: const SizedBox()),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (itemCounts[index] == 0) {
                                                    itemCounts[index] = 1;
                                                    checkAndPlayConfetti();
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
                                                          borderRadius: BorderRadius.circular(8.px),
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
                                                              fontSize: 16.px.px,
                                                              fontWeight: FontWeight.bold),
                                                          InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  itemCounts[index]++;
                                                                  checkAndPlayConfetti();
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
                          Divider(thickness: 8, color: AppColors.grey300),
                        ],
                      )),
                ]))),
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: pi / 2,
            emissionFrequency: 0.5,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 10,
            gravity: 1,
            // shouldLoop: false,
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
                            Icon(Icons.local_offer, color: AppColors.whiteTheme, size: 16.px),
                            SizedBox(width: 6.px),
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
}

// Filter Widget



// 
