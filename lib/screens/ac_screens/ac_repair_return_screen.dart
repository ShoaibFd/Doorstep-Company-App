import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:doorstep_company_app/app_controllers/price_controller.dart';
import 'package:doorstep_company_app/screens/ac_screens/add_item_button.dart';
import 'package:doorstep_company_app/screens/ac_screens/price_bottom_sheet.dart';
import 'package:doorstep_company_app/screens/ac_screens/product_description_detail_widget.dart';
import 'package:doorstep_company_app/screens/ac_screens/rating_row_section.dart';
import 'package:doorstep_company_app/screens/ac_screens/services.dart';
import 'package:doorstep_company_app/screens/ac_screens/view_detail_sheet.dart';
import 'package:doorstep_company_app/screens/cart_screen/summary_screen.dart';
import 'package:doorstep_company_app/screens/painting_wall_screen/Widgets/add_button.dart';
import 'package:doorstep_company_app/screens/salon_for_women/widgets/offers_section.dart';
import 'package:doorstep_company_app/screens/subcategory_screens/Widgets/topbar_widget.dart';
import 'package:doorstep_company_app/widgets/dotted_line_widget.dart';
import 'package:doorstep_company_app/widgets/edit_package/edit_your_package.dart';
import 'package:doorstep_company_app/widgets/edit_package_button.dart';
import 'package:doorstep_company_app/widgets/view_detail_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/dc_cover_button.dart';
import '../../widgets/divider.dart';
import 'floating_action_button_widget.dart';

class AcRepairScreen extends StatefulWidget {
  const AcRepairScreen({super.key});

  @override
  State<AcRepairScreen> createState() => _AcRepairScreenState();
}

class _AcRepairScreenState extends State<AcRepairScreen> {
  double totalPrice = 0;
  double savings = 0;
  bool showConfetti = false;
  late ConfettiController _confettiController;
  // Global Keys
  final GlobalKey packagesKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey repairGasKey = GlobalKey();
  final GlobalKey installationKey = GlobalKey();
  int count = 0;
  List services = [
    'Packages',
    'Services',
    'Repair & gas refill',
    'Installation/Uninstallation',
  ];
  // Scroll To Section Function
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    }
  }

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

  late ScrollController _scrollController;
  List<String> carouselImages = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _confettiController = ConfettiController(duration: Duration(seconds: 2));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void updatePrices(bool isIncrement) {
    setState(() {
      if (isIncrement) {
        totalPrice += 300;
        savings += 100;
        if (savings >= 100 && !showConfetti) {
          showConfetti = true;
          _confettiController.play();
        }
      } else {
        totalPrice -= 300;
        savings -= 100;
        if (savings < 100) {
          showConfetti = false;
        }
      }
    });
  }

  final ScrollControllerX scrollController = Get.put((ScrollControllerX()));

  void _onScroll() {
    final packagesPosition = _getPosition(packagesKey);
    final servicesPosition = _getPosition(servicesKey);
    final repairGasPosition = _getPosition(repairGasKey);
    final installationPosition = _getPosition(installationKey);

    // Account for the header height (AppBar + category container)
    const headerHeight = 100.0;
    double offset = _scrollController.offset;

    // Check conditions in reverse order for proper category selection
    if (installationPosition != null && offset >= installationPosition - headerHeight) {
      scrollController.updateCategory('Installation/Uninstallation');
    } else if (repairGasPosition != null && offset >= repairGasPosition - headerHeight) {
      scrollController.updateCategory('Repair & Gas Refill');
    } else if (servicesPosition != null && offset >= servicesPosition - headerHeight) {
      scrollController.updateCategory('Services');
    } else if (packagesPosition != null && offset >= packagesPosition - headerHeight) {
      scrollController.updateCategory('Packages');
    } else {
      scrollController.updateCategory('');
    }

    // Show/hide header based on scroll position
    scrollController.updateHeaderVisibility(offset > 100);
  }

  double? _getPosition(GlobalKey key) {
    final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    return box?.localToGlobal(Offset.zero).dy;
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.sizeOf(context).width;
    List<GlobalKey> keys = [
      packagesKey,
      servicesKey,
      repairGasKey,
      installationKey,
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButtonWidget(
        keys: keys,
        onTap: (index) {
          _scrollSection(keys[index]);
        },
      ),
      body: Stack(children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                TopBarwidget(carouselImages: carouselImages),
                SizedBox(height: 20),
                appText("AC Repair & Service", fontSize: 22.px, fontWeight: FontWeight.bold),
                SizedBox(height: 12.px),
                // Rating Section
                RatingRowSection(ratingText: '4.82', bookings: '(1.4M Bookings)'),
                SizedBox(height: 16),
                // DC Cover Button
                DcCoverButton(),

                SizedBox(height: 16),
                // Offers section
                offerSection(),
                SizedBox(height: 16),
                div(),
                SizedBox(
                  height: 160.px,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 130,
                    ),
                    itemCount: keys.length,
                    itemBuilder: (context, index) {
                      return Services(
                        onTap: () {
                          _scrollToSection(keys[index]);
                        },
                        serviceName: services[index],
                        image:
                            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
                      );
                    },
                  ),
                ),

                SizedBox(height: 10),
                div(),
                SizedBox(height: 20),
                appText('Packages', fontWeight: FontWeight.bold, fontSize: 18.px),
                SizedBox(
                  key: packagesKey,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductDescriptionDetailWidget(
                                offer: 'Rs. 120 PER AC',
                                serviceName: 'Power saver services (2ACs)',
                                rating: '4.55',
                                review: '(621k reviews)',
                                price: 'Rs. 400',
                                discountPrice: 'Rs. 100',
                                duration: '1 hr 30 mins',
                                offText: 'Rs. 120 OFF onward this offer',
                              ),
                              AddItemButton(
                                margin: EdgeInsets.only(top: 20, left: 3),
                                image:
                                    'https://nadeemacservice.pk/wp-content/uploads/2022/11/Air-Conditioning-lahore-1024x818.jpg',
                                addButton: AddButton(
                                  color: AppColors.whiteTheme,
                                  onIncrement: () {
                                    setState(() {
                                      count++;
                                      updatePrices(true);
                                    });
                                  },
                                  onDecrement: () {
                                    if (count > 0) {
                                      setState(() {
                                        count--;
                                        updatePrices(false);
                                      });
                                    }
                                  },
                                  count: count.toString(),
                                ),
                                optionWidget: GestureDetector(
                                  onTap: () {},
                                  child: appText('2 Options'),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          dottedLine(width: double.maxFinite, color: AppColors.grey300),
                          const SizedBox(height: 10),
                          ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: const Icon(Icons.circle, size: 6),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      'Through cleaning of indoor unit with foan jet-spray',
                                      softWrap: true,
                                      style: TextStyle(color: AppColors.hintGrey),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          ViewDetailButton(onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                constraints: BoxConstraints(),
                                context: context,
                                builder: (context) {
                                  return ViewDetailBottomSheetScreen();
                                });
                          }),
                          const SizedBox(height: 20),
                          index == 3 ? div() : Divider(color: Colors.grey.shade200),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                appText('Services', fontWeight: FontWeight.bold, fontSize: 18.px),
                const SizedBox(height: 10),
                Container(
                  height: 200.px,
                  decoration: BoxDecoration(
                      color: AppColors.grey300,
                      borderRadius: BorderRadius.circular(10.px),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://nadeemacservice.pk/wp-content/uploads/2022/11/Air-Conditioning-lahore-1024x818.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  key: servicesKey,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductDescriptionDetailWidget(
                                  offer: 'Rs. 120 PER AC',
                                  serviceName: 'Power saver AC services',
                                  rating: '4.55',
                                  review: '(621k reviews)',
                                  price: 'Rs. 400',
                                  discountPrice: 'Rs. 100',
                                  duration: '1 hr 30 mins',
                                  offText: 'Rs. 120 OFF onward this offer'),
                              AddItemButton(
                                margin: EdgeInsets.only(top: 20, left: 3),
                                image:
                                    'https://nadeemacservice.pk/wp-content/uploads/2022/11/Air-Conditioning-lahore-1024x818.jpg',
                                addButton: AddButton(
                                  color: AppColors.whiteTheme,
                                  onIncrement: () {
                                    setState(() {
                                      count++;
                                      updatePrices(true);
                                    });
                                  },
                                  onDecrement: () {
                                    if (count > 0) {
                                      setState(() {
                                        count--;
                                        updatePrices(false);
                                      });
                                    }
                                  },
                                  count: count.toString(),
                                ),
                                optionWidget: GestureDetector(
                                  onTap: () {},
                                  child: appText('2 Options'),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          dottedLine(width: double.maxFinite, color: AppColors.grey300),
                          const SizedBox(height: 10),
                          ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Expanded(
                                child: Text(
                                  'Through cleaning of indoor unit with foan jet-spray',
                                  softWrap: true,
                                  style: TextStyle(color: AppColors.hintGrey),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          ViewDetailButton(onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                constraints: BoxConstraints(),
                                context: context,
                                builder: (context) {
                                  return ViewDetailBottomSheetScreen();
                                });
                          }),
                          const SizedBox(height: 20),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                appText('Repair & gas refill', fontSize: 18.px, fontWeight: FontWeight.bold),
                SizedBox(
                  key: repairGasKey,
                  child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductDescriptionDetailWidget(
                                  offer: 'Rs. 120 PER AC',
                                  serviceName: 'AC less/no cooling repair',
                                  rating: '4.55',
                                  review: '(621k reviews)',
                                  price: 'Rs. 400',
                                  discountPrice: 'Rs. 100',
                                  duration: '1 hr 30 mins',
                                  offText: 'Rs. 120 OFF onward this offer'),
                              AddItemButton(
                                margin: EdgeInsets.only(top: 20, left: 3),
                                image:
                                    'https://nadeemacservice.pk/wp-content/uploads/2022/11/Air-Conditioning-lahore-1024x818.jpg',
                                addButton: AddButton(
                                  color: AppColors.whiteTheme,
                                  onIncrement: () {
                                    setState(() {
                                      count++;
                                      updatePrices(true);
                                    });
                                  },
                                  onDecrement: () {
                                    if (count > 0) {
                                      setState(() {
                                        count--;
                                        updatePrices(false);
                                      });
                                    }
                                  },
                                  count: count.toString(),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          dottedLine(width: double.maxFinite, color: AppColors.grey300),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText('Cut & Clear:', fontWeight: FontWeight.bold, fontSize: 13),
                              Text(
                                'This is the description of product and detail is given in the next page.',
                                softWrap: true,
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          ViewDetailButton(onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                constraints: BoxConstraints(),
                                context: context,
                                builder: (context) {
                                  return ViewDetailBottomSheetScreen();
                                });
                          }),
                          const SizedBox(height: 20),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.px),
                appText('Installation/Uninstallation', fontWeight: FontWeight.bold, fontSize: 18.px),
                SizedBox(
                  key: installationKey,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductDescriptionDetailWidget(
                                offer: 'Rs. 120 PER AC',
                                serviceName: 'Split Ac Installation',
                                rating: '4.55',
                                review: '(621k reviews)',
                                price: 'Rs. 400',
                                discountPrice: 'Rs. 100',
                                duration: '1 hr 30 mins',
                                offText: 'Rs. 120 OFF onward this offer',
                              ),
                              AddItemButton(
                                margin: EdgeInsets.only(top: 20, left: 3),
                                addButton: AddButton(
                                  color: AppColors.whiteTheme,
                                  onIncrement: () {
                                    setState(() {
                                      count++;
                                      updatePrices(true);
                                    });
                                  },
                                  onDecrement: () {
                                    if (count > 0) {
                                      setState(() {
                                        count--;
                                        updatePrices(false);
                                      });
                                    }
                                  },
                                  count: count.toString(),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          dottedLine(width: double.maxFinite, color: AppColors.grey300),
                          const SizedBox(height: 10),
                          ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: const Icon(Icons.circle, size: 6),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      'Through cleaning of indoor unit with foan jet-spray',
                                      softWrap: true,
                                      style: TextStyle(color: AppColors.hintGrey),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          EditPackageButton(onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return EditPackageBottomSheet();
                                });
                          }),
                          const SizedBox(height: 20),
                          index == 3 ? div() : Divider(color: Colors.grey.shade200),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          return scrollController.showHeader.value
              ? Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade500),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: appText(scrollController.currentCategory.value),
                  ),
                )
              : SizedBox();
        })
      ]),
      bottomNavigationBar: count != 0
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    PriceBottomSheet(
                      savingText: 'Congratulation! You saved Rs.${savings.toStringAsFixed(0)} on this',
                      onViewCartTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SummaryScreen(onChecked: false),
                            ));
                      },
                      price: 'Rs. ${totalPrice.toStringAsFixed(0)}',
                      discount: 'Rs.${savings.toStringAsFixed(0)}',
                    ),
                    if (showConfetti)
                      Align(
                        alignment: Alignment.center,
                        child: ConfettiWidget(
                          confettiController: _confettiController,
                          blastDirection: -pi / 2,
                          maxBlastForce: 5,
                          minBlastForce: 1,
                          emissionFrequency: 0.06,
                          numberOfParticles: 20,
                          gravity: 0.2,
                        ),
                      ),
                  ],
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
