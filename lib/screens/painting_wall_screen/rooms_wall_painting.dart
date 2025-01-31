import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../ac_screens/view_detail_sheet.dart';
import '../home_screen/widgets/carousel_slider.dart';
import '../subcategory_screens/Widgets/offers_container_widget.dart';
import '../subcategory_screens/Widgets/service_container_widget.dart';
import 'Widgets/app_bar.dart';
import 'Widgets/painting_view_detail_sheet.dart';
import 'Widgets/rating_button.dart';
import 'Widgets/view_cart_button.dart';

class RoomsWallPaintingScreen extends StatefulWidget {
  const RoomsWallPaintingScreen({super.key});

  @override
  State<RoomsWallPaintingScreen> createState() => _RoomsWallPaintingScreenState();
}

class _RoomsWallPaintingScreenState extends State<RoomsWallPaintingScreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for scrolling to sections
  final GlobalKey _superSaverKey = GlobalKey();
  final GlobalKey _repairGasKey = GlobalKey();
  final GlobalKey _installationKey = GlobalKey();

  List<String> carouselImages = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
  ];

  List<int> itemCounts = List.filled(4, 0);
  final List itemPrice = [300.0, 200.0, 400.0, 600.0];

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

  void _showMenuDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: SizedBox(
              width: 400.px,
              height: 200.px,
              child: Padding(
                padding: EdgeInsets.all(10.px),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    appText('Select Services', fontSize: 20.px, fontWeight: FontWeight.bold),
                    Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ServiceContainerWidget(
                                onTap: () => _scrollToSection(_superSaverKey), image: 'assets/images/service.png'),
                            ServiceContainerWidget(
                                onTap: () => _scrollToSection(_repairGasKey), image: 'assets/images/service.png'),
                            ServiceContainerWidget(
                                onTap: () => _scrollToSection(_installationKey), image: 'assets/images/service.png'),
                          ],
                        )),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Service', style: TextStyle(fontSize: 12.px)),
                            Text('Repair &\ngas refill', style: TextStyle(fontSize: 12.px)),
                            Text('Installation &\nUninstallation', style: TextStyle(fontSize: 12.px)),
                          ],
                        )),
                    SizedBox(height: 10.px),
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
      appBar: appBar(),
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
      backgroundColor: AppColors.whiteTheme,
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const CarouselSliderWidget(
                  images: [
                    'assets/images/cs.jpeg',
                    'assets/images/cs2.jpeg',
                    'assets/images/a.jpeg',
                    'assets/images/aa.jpeg',
                    'assets/images/aaa.jpeg',
                    'assets/images/aaaa.jpeg',
                    'assets/images/aaaaa.jpeg',
                    'assets/images/aaaaaa.jpeg',
                  ],
                ),
                SizedBox(height: 30.px),
                appText("Rooms/walls painting", fontSize: 28.px, fontWeight: FontWeight.bold),
                SizedBox(height: 12.px),
                Row(
                  children: [
                    ratingButton(context),
                    SizedBox(width: 10.px),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText("1.4M Bookings", color: AppColors.lightBlack),
                        SizedBox(width: width * 0.27, child: DottedLine(dashColor: AppColors.grey300)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        OffersContainers(title: 'Amazon cashback upto Rs. 50', subtitle: 'Get cashback via Amazon pay'),
                        OffersContainers(title: 'Amazon cashback upto Rs. 50', subtitle: 'Get cashback via Amazon pay'),
                      ],
                    )),
                const SizedBox(height: 10),

                // Services Section
                servicesContainerWidget(),
                const SizedBox(height: 10),
                // Super Saver Section
                Container(
                    key: _superSaverKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Few walls', fontSize: 20, fontWeight: FontWeight.bold),
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
                                        const SizedBox(height: 10),
                                        appText('Walls painting', fontSize: 18, fontWeight: FontWeight.bold),
                                        Row(
                                          children: [
                                            Icon(Icons.star, color: AppColors.hintGrey, size: 16),
                                            const SizedBox(width: 4),
                                            appText('4.85', fontSize: 12, color: AppColors.hintGrey),
                                            const SizedBox(width: 4),
                                            appText('(621K reviews)', fontSize: 12, color: AppColors.hintGrey),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        appText('Next at Rs. 300 - 1hr 30 mins',
                                            color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                        const SizedBox(height: 6),
                                        appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(Icons.local_offer, color: AppColors.greenColor, size: 16),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                          ],
                                        ),
                                        const SizedBox(height: 30),
                                        serviceRow(serviceName: 'Pedicure', serviceDesc: 'Pedicure description'),
                                        const SizedBox(height: 6),
                                        serviceRow(serviceName: 'Manicure', serviceDesc: 'Manicure description'),
                                        const SizedBox(height: 6),
                                        serviceRow(serviceName: 'Pedicure', serviceDesc: 'Pedicure description'),
                                        const SizedBox(height: 8),
                                        const Text('Through cleaning of indoor \nunit with foam & jet spray',
                                            style: TextStyle(color: AppColors.lightBlack)),
                                        const SizedBox(height: 10),
                                        TextButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (BuildContext context) {
                                                  return const PaintingViewDetailBottomSheetScreen();
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
                                            height: 100,
                                            color: AppColors.grey300,
                                            width: 110,
                                            borderRadius: 10,
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
                                                    margin: const EdgeInsets.only(top: 80, left: 10),
                                                    height: 34,
                                                    width: 90,
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
                                                    margin: const EdgeInsets.only(top: 80, left: 10),
                                                    height: 34,
                                                    width: 90,
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
                        Divider(thickness: 8, color: AppColors.grey300),
                      ],
                    )),
                const SizedBox(height: 10),
                // Repair & Gas Refill Section
                Container(
                    key: _repairGasKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Bedroom painting', fontSize: 20, fontWeight: FontWeight.bold),
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
                                        appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                        const SizedBox(height: 10),
                                        appText('Wall painting', fontSize: 18, fontWeight: FontWeight.bold),
                                        Row(
                                          children: [
                                            Icon(Icons.star, color: AppColors.hintGrey, size: 16),
                                            const SizedBox(width: 4),
                                            appText('4.85', fontSize: 12, color: AppColors.hintGrey),
                                            const SizedBox(width: 4),
                                            appText('(621K reviews)', fontSize: 12, color: AppColors.hintGrey),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        appText('Next at Rs. 300 - 1hr 30 mins',
                                            color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(Icons.local_offer, color: AppColors.greenColor, size: 16),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                          ],
                                        ),
                                        const SizedBox(height: 30),
                                        serviceRow(serviceName: 'Pedicure', serviceDesc: 'Pedicure description'),
                                        const SizedBox(height: 6),
                                        serviceRow(serviceName: 'Manicure', serviceDesc: 'Manicure description'),
                                        const SizedBox(height: 6),
                                        serviceRow(serviceName: 'Pedicure', serviceDesc: 'Pedicure description'),
                                        const SizedBox(height: 8),
                                        appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                        const SizedBox(height: 10),
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
                                            height: 100,
                                            color: AppColors.grey300,
                                            width: 110,
                                            borderRadius: 10,
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
                                                    margin: const EdgeInsets.only(top: 80, left: 10),
                                                    height: 34,
                                                    width: 90,
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
                                                    margin: const EdgeInsets.only(top: 80, left: 10),
                                                    height: 34,
                                                    width: 90,
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
                        Divider(thickness: 8, color: AppColors.grey300),
                      ],
                    )),
                const SizedBox(height: 10),
                Container(
                    key: _installationKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Living & dining room', fontSize: 20, fontWeight: FontWeight.bold),
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
                                        appText('Rs. ${itemPrice[index]}', color: AppColors.greenColor),
                                        const SizedBox(height: 10),
                                        appText('Living room painting', fontSize: 18, fontWeight: FontWeight.bold),
                                        Row(
                                          children: [
                                            Icon(Icons.star, color: AppColors.hintGrey, size: 16),
                                            const SizedBox(width: 4),
                                            appText('4.85', fontSize: 12, color: AppColors.hintGrey),
                                            const SizedBox(width: 4),
                                            appText('(621K reviews)', fontSize: 12, color: AppColors.hintGrey),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        appText('Next at Rs. 300 - 1hr 30 mins',
                                            color: AppColors.hintGrey, fontWeight: FontWeight.w600),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(Icons.local_offer, color: AppColors.greenColor, size: 16),
                                            const SizedBox(width: 4),
                                            appText('Rs. 120 off  2nd items onward', color: AppColors.greenColor),
                                          ],
                                        ),
                                        const SizedBox(height: 30),
                                        serviceRow(serviceName: 'Pedicure', serviceDesc: 'Pedicure description'),
                                        const SizedBox(height: 6),
                                        serviceRow(serviceName: 'Manicure', serviceDesc: 'Manicure description'),
                                        const SizedBox(height: 6),
                                        serviceRow(serviceName: 'Pedicure', serviceDesc: 'Pedicure description'),
                                        const SizedBox(height: 8),
                                        appText('Through cleaning of indoor \nunit with foam & jet spray'),
                                        const SizedBox(height: 10),
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
                                            height: 100,
                                            color: AppColors.grey300,
                                            width: 110,
                                            borderRadius: 10,
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
                                                    margin: const EdgeInsets.only(top: 80, left: 10),
                                                    height: 34,
                                                    width: 90,
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
                                                    margin: const EdgeInsets.only(top: 80, left: 10),
                                                    height: 34,
                                                    width: 90,
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
              ]))),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [congratulationMessage(message: 'Congratulation, Rs.200 saved so far'), priceSheet(context)],
      ),
    );
  }

  Widget servicesContainerWidget() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            appText('Select Services', fontSize: 20, fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceContainerWidget(
                    onTap: () => _scrollToSection(_superSaverKey), image: 'assets/images/service.png'),
                ServiceContainerWidget(
                    onTap: () => _scrollToSection(_repairGasKey), image: 'assets/images/service.png'),
                ServiceContainerWidget(
                    onTap: () => _scrollToSection(_installationKey), image: 'assets/images/service.png'),
              ],
            ),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Packages', style: TextStyle(fontSize: 12)),
                Text('Make your Package', style: TextStyle(fontSize: 12)),
                Text('Few Walls', style: TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceContainerWidget(
                    onTap: () => _scrollToSection(_superSaverKey), image: 'assets/images/service.png'),
                ServiceContainerWidget(
                    onTap: () => _scrollToSection(_repairGasKey), image: 'assets/images/service.png'),
                ServiceContainerWidget(
                    onTap: () => _scrollToSection(_installationKey), image: 'assets/images/service.png'),
              ],
            ),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Bedroom', style: TextStyle(fontSize: 12)),
                Text('Living & Dining rooms', style: TextStyle(fontSize: 12)),
                Text('Few rooms', style: TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 10),
            Divider(thickness: 8, color: AppColors.lightGrey),
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  void _showBottomSheet(Widget sheet) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => sheet,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

// Services Row Widget
Widget serviceRow({
  required String serviceName,
  required String serviceDesc,
}) {
  return Row(
    spacing: 4,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const SizedBox(width: 8),
      const Icon(Icons.circle, size: 4),
      appText("$serviceName ", fontWeight: FontWeight.bold),
      appText(serviceDesc),
    ],
  );
}
