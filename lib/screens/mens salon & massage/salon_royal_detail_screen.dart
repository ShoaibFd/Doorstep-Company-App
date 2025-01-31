import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
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
import '../cart_screen/summary_screen.dart';
import '../home_screen/widgets/carousel_slider.dart';
import '../painting_wall_screen/Widgets/add_button.dart';
import '../salon_for_women/widgets/offers_section.dart';
import '../subcategory_screens/Widgets/service_container_widget.dart';
import 'widgets/mens_salon_view_detail_sheet.dart';
import 'widgets/package_row.dart';

class SalonRoyalDetailScreen extends StatefulWidget {
  const SalonRoyalDetailScreen({super.key});

  @override
  State<SalonRoyalDetailScreen> createState() => _SalonRoyalDetailScreenState();
}

class _SalonRoyalDetailScreenState extends State<SalonRoyalDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for scrolling to sections
  final GlobalKey _superSaverKey = GlobalKey();
  final GlobalKey _repairGasKey = GlobalKey();
  final GlobalKey _installationKey = GlobalKey();

  List<int> itemCounts = List.filled(4, 0);
  int count = 0;
  final List itemPrice = [300.0, 200.0, 400.0, 600.0];

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 300),
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
              height: 150.px,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
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
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Grooming', style: TextStyle(fontSize: 12.px)),
                          Text('Glow better', style: TextStyle(fontSize: 12.px)),
                          Text('Cut & clear', style: TextStyle(fontSize: 12.px)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.px),
                    Positioned(
                        top: 160.px,
                        right: 140.px,
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
      appBar: AppBar(title: appText('Salon Royal', fontSize: 18.px, fontWeight: FontWeight.w400)),
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
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const CarouselSliderWidget(images: [
                  'assets/images/aaa.jpeg',
                  'assets/images/aa.jpeg',
                  'assets/images/aaaa.jpeg',
                  'assets/images/aaaaa.jpeg',
                  'assets/images/aaaaaa.jpeg',
                  'assets/images/a.jpeg',
                ]),
                appText("Salon Royal", fontSize: 28.px, fontWeight: FontWeight.bold),
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
                    offerSection(),
                    SizedBox(height: 10.px),
                    div(),
                  ],
                ),
                // Services Section
                servicesContainerWidget(),
                SizedBox(height: 10.px),
                // Super Saver Section
                Container(
                    key: _superSaverKey,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.px),
                                        appText('Rs. 120 PER Essential',
                                            color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                                        const SizedBox(height: 6),
                                        appText('Grooming essential', fontSize: 18.px, fontWeight: FontWeight.bold),
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
                                                width: width * 0.38,
                                                child: const DottedLine(dashColor: AppColors.greyColor)),
                                          ],
                                        ),
                                        SizedBox(height: 10.px),
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
                                        SizedBox(height: 10.px),
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
                                                  return const MenSalonViewDetailBottomSheet();
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
                                            margin: const EdgeInsets.only(bottom: 140),
                                            height: 90.px,
                                            width: 100.px,
                                            color: AppColors.grey300,
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
                                index == 3 ? const SizedBox() : const Divider()
                              ],
                            );
                          },
                        ),
                        div(),
                      ],
                    )),
                SizedBox(height: 10.px),
                // Glow getter Section
                Container(
                    key: _repairGasKey,
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
                                        appText('Glow getter', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        SizedBox(height: 6.px),
                                        appText('Rs. 120 PER Essential',
                                            color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                                        const SizedBox(height: 6),
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
                                                width: width * 0.38,
                                                child: const DottedLine(dashColor: AppColors.greyColor)),
                                          ],
                                        ),
                                        SizedBox(height: 10.px),
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
                                        SizedBox(height: 10.px),
                                        packageRow(heading: '', desc: 'Haircut for men'),
                                        packageRow(heading: '', desc: 'Beared trimming '),
                                        packageRow(heading: '', desc: '15 mins head massage'),
                                        SizedBox(height: 10.px),
                                        EditPackageButton(onTap: () {
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
                SizedBox(height: 10.px),
                Container(
                    key: _installationKey,
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
                                        appText('Cut & color', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        SizedBox(height: 6.px),
                                        appText('Rs. 120 PER Essential',
                                            color: AppColors.darkGreen, fontSize: 12.px, fontWeight: FontWeight.bold),
                                        const SizedBox(height: 6),
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
                                                width: width * 0.38,
                                                child: const DottedLine(dashColor: AppColors.greyColor)),
                                          ],
                                        ),
                                        SizedBox(height: 10.px),
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
                                        SizedBox(height: 10.px),
                                        appText('Through cleaning of indoor unit with\nfoam & jet spray'),
                                        SizedBox(height: 10.px),
                                        EditPackageButton(onTap: () {
                                          showEditPackageBottomSheet(context);
                                        }),
                                        const Divider(),
                                      ],
                                    ),
                                    AddButton(onIncrement: () {}, onDecrement: () {}, count: count.toString())
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
                      padding: EdgeInsets.all(4.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_offer, color: AppColors.whiteTheme, size: 16.px),
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
          children: [
            appText('Select services', fontSize: 18.px, fontWeight: FontWeight.bold),
            const Icon(Icons.arrow_downward)
          ],
        ),
        SizedBox(height: 10.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ServiceContainerWidget(onTap: () => _scrollToSection(_superSaverKey), image: 'assets/images/service.png'),
            ServiceContainerWidget(onTap: () => _scrollToSection(_repairGasKey), image: 'assets/images/service.png'),
            ServiceContainerWidget(onTap: () => _scrollToSection(_installationKey), image: 'assets/images/service.png'),
          ],
        ),
        // SizedBox(height: 4.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            appText('Grooming', fontSize: 12),
            appText('Glow better', fontSize: 12),
            appText('Cut & clear', fontSize: 12)
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
