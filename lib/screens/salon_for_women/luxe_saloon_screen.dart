import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/bottom_sheet/review_bottom_sheet.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../../widgets/edit_package/edit_your_package.dart';
import '../../widgets/edit_package_button.dart';
import '../../widgets/round_button.dart';
import '../ac_screens/view_detail_sheet.dart';
import '../cart_screen/cart_screen.dart';
import '../painting_wall_screen/Widgets/add_button.dart';
import '../painting_wall_screen/rooms_wall_painting.dart';
import '../subcategory_screens/Widgets/service_container_widget.dart';
import '../subcategory_screens/Widgets/topbar_widget.dart';
import '../subcategory_screens/uc_cover_screen.dart';
import 'widgets/offers_section.dart';

class LuxeSaloonScreen extends StatefulWidget {
  const LuxeSaloonScreen({super.key});

  @override
  State<LuxeSaloonScreen> createState() => _LuxeSaloonScreenState();
}

class _LuxeSaloonScreenState extends State<LuxeSaloonScreen> {
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
              padding: EdgeInsets.all(8.px),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TopBarwidget(carouselImages: carouselImages),
                SizedBox(height: 20.px),
                appText("Salon Luxe", fontSize: 20.px, fontWeight: FontWeight.bold),
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
                    // Offers Section
                    offerSection(),
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
                SizedBox(height: 20.px),
                div(),
                SizedBox(height: 20.px),
                // Super Saver Section
                Container(
                    key: _packagesKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Packages', fontSize: 20.px, fontWeight: FontWeight.bold),
                        ListView.builder(
                          itemCount: itemCounts.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                index == 3
                                    ? CustomContainer(
                                        height: 200.px,
                                        width: double.maxFinite,
                                        borderRadius: 10,
                                        color: AppColors.grey300,
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                'https://primemassagecenter.com/wp-content/uploads/2017/06/aroma-therapy-massage-for-men-in-dubai.jpg'),
                                            fit: BoxFit.cover),
                                        child: const SizedBox())
                                    : const SizedBox(),
                                SizedBox(height: 10.px),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('PACKAGE',
                                            color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 12),
                                        SizedBox(height: 6.px),
                                        appText('Waxing and facial', fontSize: 16.px, fontWeight: FontWeight.bold),
                                        SizedBox(height: 6.px),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.star, color: AppColors.lightBlack, size: 16),
                                                SizedBox(width: 4.px),
                                                appText('4.85', fontSize: 12.px, color: AppColors.hintGrey),
                                                SizedBox(width: 4.px),
                                                appText('(621K reviews)', fontSize: 12.px, color: AppColors.hintGrey),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 6.px),
                                        Row(
                                          spacing: 10.px,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', fontWeight: FontWeight.bold),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            const Icon(Icons.circle, size: 4),
                                            appText('1hr 30 mins', color: AppColors.hintGrey),
                                          ],
                                        ),
                                        SizedBox(height: 6.px),
                                        Row(
                                          children: [
                                            Icon(Icons.local_offer, color: AppColors.darkGreen, size: 16),
                                            SizedBox(width: 4.px),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.darkGreen),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                            width: width * 0.6, child: DottedLine(dashColor: Colors.grey.shade300)),
                                        const SizedBox(height: 10),
                                        serviceRow(serviceName: 'Waxing', serviceDesc: 'Waxing description'),
                                        const SizedBox(height: 8),
                                        serviceRow(serviceName: 'Waxing', serviceDesc: 'Waxing description'),
                                        const SizedBox(height: 8),
                                        SizedBox(height: 10.px),
                                        EditPackageButton(onTap: (){
                                          showEditPackageBottomSheet(context);
                                        }),
                                        const Divider(),
                                      ],
                                    ),
                                    AddButton(
                                        height: 32.px,
                                        width: 90,
                                        onIncrement: () {
                                          if (itemCounts[index] == 0) {
                                            itemCounts[index] = 1;
                                          }
                                        },
                                        onDecrement: () {},
                                        count: count.toString())
                                  ],
                                ),
                                index == 3 ? const SizedBox() : const Divider(),
                                SizedBox(height: 20.px),
                              ],
                            );
                          },
                        ),
                        div(),
                      ],
                    )),
                SizedBox(height: 10.px),
                //Manicure and pedicure
                Container(
                    key: _waxingKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Manicure & pedicure', fontSize: 20.px, fontWeight: FontWeight.bold),
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
                                        appText('Rs. 120 PER Waxing',
                                            color: AppColors.darkGreen, fontWeight: FontWeight.bold),
                                        SizedBox(height: 8.px),
                                        appText('Manicure and Waxing', fontSize: 16.px, fontWeight: FontWeight.bold),
                                        const SizedBox(height: 10),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.star, color: AppColors.lightBlack, size: 16),
                                                SizedBox(width: 4.px),
                                                appText('4.85', fontSize: 12.px, color: AppColors.hintGrey),
                                                SizedBox(width: 4.px),
                                                appText('(621K reviews)', fontSize: 12.px, color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.27,
                                                child: DottedLine(dashColor: Colors.grey.shade300)),
                                          ],
                                        ),
                                        SizedBox(height: 6.px),
                                        Row(
                                          spacing: 10.px,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            const Icon(Icons.circle, size: 4),
                                            appText('1hr 30 mins', color: AppColors.hintGrey),
                                          ],
                                        ),
                                        SizedBox(height: 6.px),
                                        Row(
                                          children: [
                                            Icon(Icons.local_offer, color: AppColors.darkGreen, size: 16),
                                            SizedBox(width: 4.px),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.darkGreen),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                            width: width * 0.6, child: DottedLine(dashColor: Colors.grey.shade300)),
                                        const SizedBox(height: 10),
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
                                              margin: EdgeInsets.only(top: 120.px, left: 24.px),
                                              child: appText('6 Options')),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                index == 3 ? const SizedBox() : const Divider(),
                              ],
                            );
                          },
                        ),
                        div(),
                      ],
                    )),
                SizedBox(height: 10.px),
                Container(
                    key: _facialKey,
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
                                        appText('Rs. 120 PER AC',
                                            color: AppColors.darkGreen, fontWeight: FontWeight.bold),
                                        SizedBox(height: 8.px),
                                        appText('Massage & threading', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        const SizedBox(height: 10),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: AppColors.hintGrey, size: 16),
                                                SizedBox(width: 4.px),
                                                appText('4.85', fontSize: 12.px, color: AppColors.hintGrey),
                                                SizedBox(width: 4.px),
                                                appText('(621K reviews)', fontSize: 12.px, color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.27,
                                                child: DottedLine(dashColor: Colors.grey.shade300)),
                                          ],
                                        ),
                                        SizedBox(height: 6.px),
                                        Row(
                                          spacing: 10.px,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            const Icon(Icons.circle, size: 4),
                                            appText(' 1hr 30 mins', color: AppColors.hintGrey),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.local_offer, color: AppColors.darkGreen, size: 16),
                                            SizedBox(width: 4.px),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.darkGreen),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                            width: width * 0.57, child: DottedLine(dashColor: Colors.grey.shade300)),
                                        const SizedBox(height: 10),
                                        serviceRow(serviceName: '', serviceDesc: 'massage & threading'),
                                        const SizedBox(height: 8),
                                        EditPackageButton(onTap: (){
                                          showEditPackageBottomSheet(context);
                                        }),
                                        const Divider(),
                                      ],
                                    ),
                                    AddButton(onIncrement: () {}, onDecrement: () {}, count: count.toString())
                                  ],
                                ),
                                index == 3 ? const SizedBox() : const Divider(),
                              ],
                            );
                          },
                        ),
                        div(),
                      ],
                    )),
                const SizedBox(height: 10),
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
                                        appText('Rs. 120 PER AC',
                                            color: AppColors.darkGreen, fontSize: 12, fontWeight: FontWeight.bold),
                                        appText('Complete care', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        const SizedBox(height: 10),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star, color: AppColors.hintGrey, size: 16),
                                                SizedBox(width: 4.px),
                                                appText('4.85', fontSize: 12.px, color: AppColors.hintGrey),
                                                SizedBox(width: 4.px),
                                                appText('(621K reviews)', fontSize: 12.px, color: AppColors.hintGrey),
                                              ],
                                            ),
                                            SizedBox(
                                                width: width * 0.27,
                                                child: DottedLine(dashColor: Colors.grey.shade300)),
                                          ],
                                        ),
                                        SizedBox(height: 6.px),
                                        Row(
                                          spacing: 10.px,
                                          children: [
                                            appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                            appText('Rs. 200',
                                                color: AppColors.hintGrey, decoration: TextDecoration.lineThrough),
                                            const Icon(Icons.circle, size: 4),
                                            appText(' 1hr 30 mins', color: AppColors.hintGrey),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(Icons.local_offer, color: AppColors.darkGreen, size: 16),
                                            SizedBox(width: 4.px),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.darkGreen),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                            width: width * 0.57, child: DottedLine(dashColor: Colors.grey.shade300)),
                                        const SizedBox(height: 10),
                                        appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                        SizedBox(height: 10.px),
                                        EditPackageButton(onTap: (){
                                          showEditPackageBottomSheet(context);
                                        }),
                                        index == 3 ? const SizedBox() : const Divider(),
                                      ],
                                    ),
                                    AddButton(onIncrement: () {}, onDecrement: () {}, count: count.toString())
                                  ],
                                ),
                                const Divider(),
                                index == 3
                                    ? Container(
                                        height: 200.px,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: AppColors.grey300,
                                            borderRadius: BorderRadius.circular(10),
                                            image: const DecorationImage(
                                                image: NetworkImage(
                                                    'https://images.all-free-download.com/images/thumbjpg/hair_salon_discount_landing_page_template_realistic_dark_6929979.jpg'),
                                                fit: BoxFit.cover)),
                                      )
                                    : const SizedBox(),
                              ],
                            );
                          },
                        ),
                        div(),
                        SizedBox(height: 100.px),
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
                          SizedBox(width: 6.px),
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
                        SizedBox(width: 10.px),
                        appText('Rs. 200',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.hintGrey),
                        const Spacer(),
                        CustomContainer(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
