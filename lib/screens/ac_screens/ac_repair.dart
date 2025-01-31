// import 'dart:math';
// import 'package:confetti/confetti.dart';
// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../constants/colors.dart';
// import '../../widgets/bottom_sheet/review_bottom_sheet.dart';
// import '../../widgets/custom_container.dart';
// import '../../widgets/custom_text.dart';
// import '../../widgets/description_add_button_widget.dart';
// import '../../widgets/divider.dart';
// import '../../widgets/dotted_line_widget.dart';
// import '../../widgets/list_view.dart';
// import '../../widgets/round_button.dart';
// import '../cart_screen/summary_screen.dart';
// import '../mens salon & massage/widgets/package_row.dart';
// import '../painting_wall_screen/rooms_wall_painting.dart';
// import '../salon_for_women/widgets/offers_section.dart';
// import '../subcategory_screens/Widgets/service_container_widget.dart';
// import '../subcategory_screens/Widgets/topbar_widget.dart';
// import '../subcategory_screens/uc_cover_screen.dart';
// import 'view_detail_sheet.dart';

// class AcRepairScreen extends StatefulWidget {
//   const AcRepairScreen({super.key});

//   @override
//   State<AcRepairScreen> createState() => _AcRepairScreenState();
// }

// class _AcRepairScreenState extends State<AcRepairScreen> {
//   final ScrollController _scrollController = ScrollController();

//   // GlobalKeys for scrolling to sections
//   final GlobalKey _superSaverKey = GlobalKey();
//   final GlobalKey _servicesKey = GlobalKey();
//   final GlobalKey _repairGasKey = GlobalKey();
//   final GlobalKey _installationKey = GlobalKey();

//   List<String> carouselImages = [
//     'assets/images/women.png',
//     'assets/images/men.png',
//     'assets/images/air-conditioner.png',
//   ];

// // Add ConfettiController
//   late ConfettiController _confettiController;

//   @override
//   void initState() {
//     super.initState();
//     _confettiController = ConfettiController(duration: const Duration(seconds: 2));
//   }

//   @override
//   void dispose() {
//     _confettiController.dispose();
//     _scrollController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

// // Single, clear function to check savings and play confetti
//   void _checkAndPlayConfetti() {
//     int savings = _calculateTotalSavings();
//     if (savings == 200 || savings == 400 || savings == 600) {
//       _confettiController.play();
//     }
//   }

// // Helper function to calculate total savings
//   int _calculateTotalSavings() {
//     int totalSavings = 0;
//     for (int i = 0; i < itemCounts.length; i++) {
//       totalSavings += (itemCounts[i] * 200); 
//     }
//     return totalSavings;
//   }

//   // Add this method to calculate savings
//   double _calculateSavings() {
//     return itemCounts.fold(0, (sum, count) => sum + (count * 200));
//   }

//   List<int> itemCounts = List.filled(4, 0);
//   int count = 0;
//   final List itemPrice = [300, 200, 400, 600];

//   void _scrollToSection(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   //scrollFunction for dialog
//   void _scrollSection(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null) {
//       Navigator.pop(context);
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void _showMenuDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: AppColors.whiteTheme,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)),
//           child: SizedBox(
//             height: 260.px,
//             width: MediaQuery.of(context).size.width,
//             child: Padding(
//               padding: EdgeInsets.all(10.px),
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           spacing: 30,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             ServiceContainerWidget(
//                               title: 'Packages',
//                               onTap: () => _scrollSection(_superSaverKey),
//                               image: 'assets/images/service.png',
//                             ),
//                             ServiceContainerWidget(
//                               title: 'Services',
//                               onTap: () => _scrollSection(_servicesKey),
//                               image: 'assets/images/service.png',
//                             ),
//                             ServiceContainerWidget(
//                               title: 'Repair &\ngas refill',
//                               onTap: () => _scrollSection(_repairGasKey),
//                               image: 'assets/images/service.png',
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         ServiceContainerWidget(
//                           title: 'Installation &\nUninstallation',
//                           onTap: () => _scrollSection(_installationKey),
//                           image: 'assets/images/service.png',
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 270.px,
//                     right: 140.px,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const CircleAvatar(
//                         backgroundColor: AppColors.whiteTheme,
//                         child: Icon(Icons.close),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Padding(
//         padding: EdgeInsets.only(bottom: 50.px),
//         child: SizedBox(
//           width: 100.px,
//           height: 36.px,
//           child: FloatingActionButton(
//             onPressed: () {
//               _showMenuDialog();
//             },
//             backgroundColor: AppColors.blackColor,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Icon(Icons.menu, size: 20.px, color: AppColors.whiteTheme),
//                 appText('Menu', color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
//               ],
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: AppColors.whiteTheme,
//       body: Stack(children: [
//         SingleChildScrollView(
//             controller: _scrollController,
//             child: Padding(
//                 padding: EdgeInsets.all(8.px),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   TopBarwidget(carouselImages: carouselImages),
//                   const SizedBox(height: 14),
//                   appText("AC Repair & Service", fontSize: 22.px, fontWeight: FontWeight.bold),
//                   SizedBox(height: 12.px),
//                   Row(
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             showReviewsBottomSheet(context);
//                           },
//                           child: Container(
//                               height: 26.px,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(4.px), color: Colors.green.shade900),
//                               child: Padding(
//                                   padding: EdgeInsets.all(4.px),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Icon(Icons.star, color: Colors.white, size: 18.px),
//                                       SizedBox(width: 4.px),
//                                       appText("4.82", color: Colors.white, fontWeight: FontWeight.bold),
//                                     ],
//                                   )))),
//                       SizedBox(width: 10.px),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           appText("(1.4M Bookings)", color: AppColors.lightBlack),
//                           SizedBox(width: width * 0.27, child: const DottedLine(dashColor: AppColors.greyColor)),
//                         ],
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 4.px),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 12.px),
//                       CustomContainer(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => const UcCoverScreen()));
//                           },
//                           height: 80.px,
//                           width: double.maxFinite,
//                           color: AppColors.grey300.withOpacity(0.6),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 6.px),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(Icons.download_done_rounded, color: AppColors.greenColor.shade800),
//                                     SizedBox(width: 10.px),
//                                     Text('DC Cover',
//                                         style: GoogleFonts.aclonica(
//                                             color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 16.px)),
//                                   ],
//                                 ),
//                                 SizedBox(height: 6.px),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     appText('Warranty, rate card, claim process..', fontSize: 16.px),
//                                     const Icon(Icons.chevron_right)
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )),
//                       SizedBox(height: 16.px),
//                       offerSection(),
//                       SizedBox(height: 10.px),
//                       div()
//                     ],
//                   ),
//                   // Services Section
//                   servicesContainerWidget(),
//                   SizedBox(height: 10.px),

//                   Container(
//                       key: _superSaverKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 10),
//                           appText('Super Saver Packages', fontSize: 20.px, fontWeight: FontWeight.bold),
//                           ListView.builder(
//                             itemCount: itemCounts.length,
//                             shrinkWrap: true,
//                             physics: const BouncingScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           DescriptionWidget(
//                                               discount: 'Rs.120 PER AC',
//                                               serviceName: 'Power saver srvices (2 ACs)',
//                                               rating: '4.85',
//                                               review: '(621k reviews)',
//                                               itemPrice: 'Rs. ${itemPrice[index]}',
//                                               itemDiscount: 'Rs.200',
//                                               duration: '1 hr 30 mins',
//                                               offText: 'Rs. 120 off 2nd items onward'),
//                                           dottedLine(width: width * .7),
//                                           SizedBox(height: 10.px),
//                                           packageRow(heading: 'Home Cleaning:', desc: 'Do Ac cleaning with discount'),
//                                           SizedBox(height: 6.px),
//                                           packageRow(heading: 'Home Service:', desc: 'Do Ac Service with discount'),
//                                           TextButton(
//                                               onPressed: () {
//                                                 showModalBottomSheet(
//                                                   context: context,
//                                                   isScrollControlled: true,
//                                                   builder: (BuildContext context) {
//                                                     return const ViewDetailBottomSheetScreen();
//                                                   },
//                                                 );
//                                               },
//                                               child: appText('View Details',
//                                                   color: AppColors.lowPurple, fontWeight: FontWeight.bold)),
//                                           const Divider(),
//                                         ],
//                                       ),
//                                       CustomItemWidget(
//                                         imagePath: 'assets/images/air-conditioner.png',
//                                         initialItemCount: count,
//                                         onDecrement: () {},
//                                         onIncrement: () {},
//                                         onOptionsTap: () {},
//                                         onTap: () {},
//                                         optionsText: '2 Options',
//                                       ),
//                                     ],
//                                   ),
//                                   index == 3 ? const SizedBox() : const Divider(),
//                                   const SizedBox(height: 20)
//                                 ],
//                               );
//                             },
//                           ),
//                           div()
//                         ],
//                       )),

//                   SizedBox(height: 10.px),
//                   // Repair & Gas Refill Section
//                   Container(
//                       key: _repairGasKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 10),
//                           appText('Super Saver Packages', fontSize: 20.px, fontWeight: FontWeight.bold),
//                           ListView.builder(
//                             itemCount: itemCounts.length,
//                             shrinkWrap: true,
//                             physics: const BouncingScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           DescriptionWidget(
//                                               discount: 'Rs.120 PER AC',
//                                               serviceName: 'Power saver srvices (2 ACs)',
//                                               rating: '4.85',
//                                               review: '(621k reviews)',
//                                               itemPrice: 'Rs. ${itemPrice[index]}',
//                                               itemDiscount: 'Rs.200',
//                                               duration: '1 hr 30 mins',
//                                               offText: 'Rs. 120 off 2nd items onward'),
//                                           dottedLine(width: width * .7),
//                                           SizedBox(height: 10.px),
//                                           appText('Through cleaning of indoor \nunit with foam & jet spray'),
//                                           SizedBox(height: 10.px),
//                                           TextButton(
//                                               onPressed: () {
//                                                 showModalBottomSheet(
//                                                   context: context,
//                                                   isScrollControlled: true,
//                                                   builder: (BuildContext context) {
//                                                     return const ViewDetailBottomSheetScreen();
//                                                   },
//                                                 );
//                                               },
//                                               child: appText('View Details',
//                                                   color: AppColors.lowPurple, fontWeight: FontWeight.bold)),
//                                           const Divider(),
//                                         ],
//                                       ),
//                                       CustomItemWidget(
//                                         imagePath: 'assets/images/air-conditioner.png',
//                                         initialItemCount: count,
//                                         onDecrement: () {},
//                                         onIncrement: () {},
//                                         onOptionsTap: () {},
//                                         onTap: () {},
//                                         optionsText: '2 Options',
//                                       ),
//                                     ],
//                                   ),
//                                   index == 3 ? const SizedBox() : const Divider(),
//                                   const SizedBox(height: 30)
//                                 ],
//                               );
//                             },
//                           ),
//                           div()
//                         ],
//                       )),

//                   SizedBox(height: 10.px),
//                   Container(
//                       key: _installationKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 10),
//                           appText('Super Saver Packages', fontSize: 20.px, fontWeight: FontWeight.bold),
//                           ListView.builder(
//                             itemCount: itemCounts.length,
//                             shrinkWrap: true,
//                             physics: const BouncingScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           DescriptionWidget(
//                                               discount: 'Rs.120 PER AC',
//                                               serviceName: 'Power saver srvices (2 ACs)',
//                                               rating: '4.85',
//                                               review: '(621k reviews)',
//                                               itemPrice: 'Rs. ${itemPrice[index]}',
//                                               itemDiscount: 'Rs.200',
//                                               duration: '1 hr 30 mins',
//                                               offText: 'Rs. 120 off 2nd items onward'),
//                                           dottedLine(width: width * .7),
//                                           const SizedBox(height: 20),
//                                           serviceRow(serviceName: 'Ac repair:', serviceDesc: 'Ac repair description'),
//                                           const SizedBox(height: 4),
//                                           serviceRow(serviceName: 'Ac repair:', serviceDesc: 'Ac repair description'),
//                                           SizedBox(height: 10.px),
//                                           CustomContainer(
//                                               onTap: () {},
//                                               height: 40.px,
//                                               width: 140.px,
//                                               borderColor: AppColors.grey300,
//                                               borderRadius: 6.px,
//                                               color: AppColors.transparentColor,
//                                               child: Padding(
//                                                   padding: EdgeInsets.all(4.px),
//                                                   child: Center(
//                                                       child:
//                                                           appText('Edit your package', fontWeight: FontWeight.bold)))),
//                                           const Divider(),
//                                         ],
//                                       ),
//                                       CustomItemWidget(
//                                         imagePath: 'assets/images/air-conditioner.png',
//                                         initialItemCount: count,
//                                         onDecrement: () {
//                                           setState(() {
//                                             itemCounts[index]--;
//                                             if (itemCounts[index] < 0) {
//                                               itemCounts[index] = 0;
//                                             }
//                                           });
//                                         },
//                                         onIncrement: () {
//                                           setState(() {
//                                             itemCounts[index]++;
//                                             _checkAndPlayConfetti();
//                                           });
//                                         },
//                                         onOptionsTap: () {},
//                                         onTap: () {
//                                           setState(() {
//                                             if (itemCounts[index] == 0) {
//                                               itemCounts[index] = 1;
//                                               _checkAndPlayConfetti();
//                                             }
//                                           });
//                                         },
//                                         optionsText: '',
//                                       ),
//                                     ],
//                                   ),
//                                   index == 3 ? const SizedBox() : const Divider(),
//                                   const SizedBox(height: 20)
//                                 ],
//                               );
//                             },
//                           ),
//                           div()
//                         ],
//                       )),

//                   Container(
//                       key: _servicesKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           appText('Services', fontSize: 20.px, fontWeight: FontWeight.bold),
//                           ListView.builder(
//                             itemCount: itemCounts.length,
//                             shrinkWrap: true,
//                             physics: const BouncingScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           SizedBox(height: 10.px),
//                                           DescriptionWidget(
//                                               discount: 'Rs.120 PER AC',
//                                               serviceName: 'Power saver srvices (2 ACs)',
//                                               rating: '4.85',
//                                               review: '(621k reviews)',
//                                               itemPrice: 'Rs. ${itemPrice[index]}',
//                                               itemDiscount: 'Rs.200',
//                                               duration: '1 hr 30 mins',
//                                               offText: 'Rs. 120 off 2nd items onward'),
//                                           dottedLine(width: width * .7),
//                                           appText('Through cleaning of indoor \nunit with foam & jet spray'),
//                                           SizedBox(height: 10.px),
//                                           TextButton(
//                                               onPressed: () {
//                                                 showModalBottomSheet(
//                                                   context: context,
//                                                   isScrollControlled: true,
//                                                   builder: (BuildContext context) {
//                                                     return const ViewDetailBottomSheetScreen();
//                                                   },
//                                                 );
//                                               },
//                                               child: appText('View Details',
//                                                   color: AppColors.lowPurple, fontWeight: FontWeight.bold)),
//                                           const Divider(),
//                                         ],
//                                       ),
//                                       CustomItemWidget(
//                                         imagePath: 'assets/images/air-conditioner.png',
//                                         initialItemCount: count,
//                                         onDecrement: () {
//                                           setState(() {
//                                             itemCounts[index]--;
//                                             if (itemCounts[index] < 0) {
//                                               itemCounts[index] = 0;
//                                             }
//                                           });
//                                         },
//                                         onIncrement: () {
//                                           setState(() {
//                                             itemCounts[index]++;
//                                             _checkAndPlayConfetti();
//                                           });
//                                         },
//                                         onOptionsTap: () {},
//                                         onTap: () {
//                                           setState(() {
//                                             if (itemCounts[index] == 0) {
//                                               itemCounts[index] = 1;
//                                               _checkAndPlayConfetti();
//                                             }
//                                           });
//                                         },
//                                         optionsText: '',
//                                       ),
//                                     ],
//                                   ),
//                                   const Divider(),
//                                 ],
//                               );
//                             },
//                           ),
//                           div()
//                         ],
//                       )),
//                 ]))),
//         Align(
//           alignment: Alignment.center,
//           child: ConfettiWidget(
//             confettiController: _confettiController,
//             blastDirection: pi / 2,
//             emissionFrequency: 0.20,
//             blastDirectionality: BlastDirectionality.explosive,
//             numberOfParticles: 30,
//             gravity: 0.2,
//             shouldLoop: false,
//             colors: [AppColors.darkGreen, AppColors.blueShade, Colors.pink, Colors.orange, AppColors.lowPurple],
//           ),
//         ),
//       ]),
//       bottomSheet: count > 0
//           ? Align(alignment: Alignment.bottomCenter, child: roundButton(title: 'Done'))
//           : Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 if (_calculateSavings() > 0)
//                   CustomContainer(
//                       borderRadius: 0,
//                       color: AppColors.darkGreen,
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(Icons.local_offer, color: AppColors.whiteTheme, size: 16),
//                             const SizedBox(width: 6),
//                             appText('Congratulation, Rs.${_calculateSavings()} saved so far',
//                                 color: AppColors.whiteTheme)
//                           ],
//                         ),
//                       )),
//                 Container(
//                   height: 70.px,
//                   width: double.infinity,
//                   color: AppColors.whiteTheme,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         appText('Rs. 1200', fontWeight: FontWeight.bold),
//                         const SizedBox(width: 10),
//                         appText('Rs. 200',
//                             fontWeight: FontWeight.w400,
//                             decoration: TextDecoration.lineThrough,
//                             color: AppColors.hintGrey),
//                         const Spacer(),
//                         CustomContainer(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const SummaryScreen(
//                                             onChecked: false,
//                                           )));
//                             },
//                             color: AppColors.lowPurple,
//                             borderRadius: 8,
//                             height: 45.px,
//                             width: 150.px,
//                             child: Center(
//                                 child: appText('View Cart', fontWeight: FontWeight.w400, color: AppColors.whiteTheme))),
//                       ],
//                     ),
//                   ),
//                 ),
//                 count > 0
//                     ? Align(alignment: Alignment.bottomCenter, child: roundButton(title: 'Done'))
//                     : const SizedBox(),
//               ],
//             ),
//     );
//   }

//   Widget servicesContainerWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 10.px),
//         Row(
//           spacing: 10.px,
//           children: [
//             appText('Select Your Services', fontSize: 18.px, fontWeight: FontWeight.bold),
//             const Icon(Icons.arrow_downward_rounded)
//           ],
//         ),
//         SizedBox(height: 20.px),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ServiceContainerWidget(
//                 title: 'Super saver\npackages',
//                 onTap: () => _scrollToSection(_superSaverKey),
//                 image: 'assets/images/service.png'),
//             ServiceContainerWidget(
//                 title: 'Services\n', onTap: () => _scrollToSection(_servicesKey), image: 'assets/images/service.png'),
//             ServiceContainerWidget(
//                 title: 'Repair &\ngas refill',
//                 onTap: () => _scrollToSection(_repairGasKey),
//                 image: 'assets/images/service.png'),
//             ServiceContainerWidget(
//                 title: 'Installation &\nUninstallation',
//                 onTap: () => _scrollToSection(_installationKey),
//                 image: 'assets/images/service.png'),
//           ],
//         ),
//         SizedBox(height: 10.px),
//         div()
//       ],
//     );
//   }
// }
