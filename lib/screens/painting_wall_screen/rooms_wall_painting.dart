import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:doorstep_company_app/app_controllers/ac_repair_scroll_controller.dart';
import 'package:doorstep_company_app/components/dotted_line_widget.dart';
import 'package:doorstep_company_app/components/edit_package/edit_your_package.dart';
import 'package:doorstep_company_app/components/edit_package_button.dart';
import 'package:doorstep_company_app/components/view_detail_button.dart';
import 'package:doorstep_company_app/screens/ac_screens/components/ac_view_detail_sheet.dart';
import 'package:doorstep_company_app/screens/ac_screens/components/add_item_button.dart';
import 'package:doorstep_company_app/screens/ac_screens/components/price_bottom_sheet.dart';
import 'package:doorstep_company_app/screens/ac_screens/components/product_description_detail_widget.dart';
import 'package:doorstep_company_app/screens/ac_screens/components/rating_row_section.dart';
import 'package:doorstep_company_app/screens/ac_screens/components/services.dart';
import 'package:doorstep_company_app/screens/cart_screen/summary_screen.dart';
import 'package:doorstep_company_app/screens/painting_wall_screen/components/add_button.dart';
import 'package:doorstep_company_app/screens/painting_wall_screen/components/painting_view_detail_sheet.dart';
import 'package:doorstep_company_app/screens/salon_for_women/components/offers_section.dart';
import 'package:doorstep_company_app/screens/subcategory_screens/Widgets/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/app_text.dart';
import '../../../components/dc_cover_button.dart';
import '../../../components/divider.dart';
import '../../theme/colors.dart';
import '../../app_controllers/price_controller.dart';
import '../subcategory_screens/Widgets/app_bar_search_button.dart';
import '../subcategory_screens/Widgets/app_bar_share_button.dart';
import 'components/floating_action_button.dart';
import 'controller/painting_controller.dart';

class RoomsWallPaintingScreen extends StatefulWidget {
  const RoomsWallPaintingScreen({super.key});

  @override
  State<RoomsWallPaintingScreen> createState() => _RoomsWallPaintingScreenState();
}

class _RoomsWallPaintingScreenState extends State<RoomsWallPaintingScreen> {
  late ConfettiController _confettiController;
  // Global Keys
  final GlobalKey packagesKey = GlobalKey();
  final GlobalKey fewWallsKey = GlobalKey();
  final GlobalKey bedroomKey = GlobalKey();
  final GlobalKey livingAndDiningKey = GlobalKey();
  List services = [
    'Packages',
    'Few walls',
    'Bedroom',
    'Living & dining',
  ];
  // Scroll To Section Function
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    }
  }

  void scrollSection(GlobalKey key) {
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
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  final ScrollControllerX scrollController = Get.put((ScrollControllerX()));
  final PriceController priceController = Get.put(PriceController());
  final PaintingPackagesController paintingPackagesController = Get.put(PaintingPackagesController());
  final PaintingWallController paintingWallController = Get.put(PaintingWallController());
  final PaintingBedroomController paintingBedroomController = Get.put(PaintingBedroomController());
  final PaintingDiningController paintingDiningController = Get.put(PaintingDiningController());

// OnScroll Function
  void onScroll() {
    final scrollPosition = _scrollController.offset;
    final headerHeight = MediaQuery.of(context).padding.top + 60;
    const categoryHeight = 40.0;
    double offset = scrollPosition + headerHeight + categoryHeight;

    // To Calculate position section
    final fewWallsPosition = getPosition(fewWallsKey);
    final bedroomPosition = getPosition(bedroomKey);
    final livingAndDiningPosition = getPosition(livingAndDiningKey);
    final packagesPosition = getPosition(packagesKey);

    // To Show Current Section
    String currentCategory = '';
    bool shouldShowHeader = false;

    if (packagesPosition != null && offset >= packagesPosition) {
      currentCategory = 'Packages';
      shouldShowHeader = true;
    } else if (livingAndDiningPosition != null && offset >= livingAndDiningPosition) {
      currentCategory = 'Living & dining';
      shouldShowHeader = true;
    } else if (bedroomPosition != null && offset >= bedroomPosition) {
      currentCategory = 'Bedroom painting';
      shouldShowHeader = true;
    } else if (fewWallsPosition != null && offset >= fewWallsPosition) {
      currentCategory = 'Few walls';
      shouldShowHeader = true;
    }

    // To Update Header and Category
    if (shouldShowHeader) {
      scrollController.updateHeaderVisibility(true);
      scrollController.updateCategory(currentCategory);
    } else {
      scrollController.updateHeaderVisibility(false);
      scrollController.updateCategory('');
    }
  }

// To Get Position
  double? getPosition(GlobalKey key) {
    final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return null;
    final position = box.localToGlobal(Offset.zero);
    return position.dy;
  }

  @override
  Widget build(BuildContext context) {
    List<GlobalKey> keys = [
      fewWallsKey,
      bedroomKey,
      livingAndDiningKey,
      packagesKey,
    ];
    return Scaffold(
      floatingActionButton: PaintingFloatingActionButton(
        keys: keys,
        onTap: (index) {
          scrollSection(keys[index]);
        },
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TopBarwidget(carouselImages: carouselImages),
                  const SizedBox(height: 20),
                  appText("Rooms/walls painting", fontSize: 22.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 12.px),
                  // Rating Section
                  const RatingRowSection(ratingText: '4.82', bookings: '(1.4M Bookings)'),
                  const SizedBox(height: 16),
                  // DC Cover Button
                  const DcCoverButton(),
                  const SizedBox(height: 16),
                  // Offers section
                  offerSection(),
                  const SizedBox(height: 16),
                  div(),
                  SizedBox(height: 10.px),
                  appText('Select your service', fontSize: 18.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 10.px),
                  SizedBox(
                    height: 130.px,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(0.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisExtent: 130.px,
                      ),
                      itemCount: keys.length,
                      itemBuilder: (context, index) {
                        return Services(
                          onTap: () {
                            scrollToSection(keys[index]);
                          },
                          serviceName: services[index],
                          image:
                              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 10.px),
                  div(),
                  SizedBox(height: 20.px),
                  appText('Few walls', fontWeight: FontWeight.bold, fontSize: 18.px),
                  SizedBox(height: 20.px),
                  SizedBox(
                    key: fewWallsKey,
                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0.0),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ProductDescriptionDetailWidget(
                                  offer: 'PACKAGE',
                                  serviceName: 'Walls painting',
                                  rating: '4.55',
                                  review: '(621k reviews)',
                                  price: 'Rs. 400',
                                  discountPrice: 'Rs. 100',
                                  duration: '1 hr 30 mins',
                                  offText: 'Rs. 120 OFF onward this offer',
                                ),
                                AddItemButton(
                                  margin: const EdgeInsets.only(top: 20, left: 3),
                                  image:
                                      'https://nadeemacservice.pk/wp-content/uploads/2022/11/Air-Conditioning-lahore-1024x818.jpg',
                                  addButton: AddButton(
                                    color: AppColors.whiteTheme,
                                    onIncrement: () => paintingWallController.increment(),
                                    onDecrement: () => paintingWallController.decrement(),
                                    count: paintingWallController.count.value.toString(),
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
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Icon(Icons.circle, size: 6),
                                    ),
                                    const SizedBox(width: 6),
                                    Flexible(
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
                                  constraints: const BoxConstraints(),
                                  context: context,
                                  builder: (context) {
                                    return const PaintingViewDetailBottomSheetScreen();
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
                  appText('Bedroom painting', fontWeight: FontWeight.bold, fontSize: 18.px),
                  const SizedBox(height: 20),

                  SizedBox(
                    key: bedroomKey,
                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0.0),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ProductDescriptionDetailWidget(
                                  offer: 'Rs. 120 PER AC',
                                  serviceName: 'Wall painting',
                                  rating: '4.55',
                                  review: '(621k reviews)',
                                  price: 'Rs. 400',
                                  discountPrice: 'Rs. 100',
                                  duration: '1 hr 30 mins',
                                  offText: 'Rs. 120 OFF onward this offer',
                                ),
                                AddItemButton(
                                  margin: const EdgeInsets.only(top: 30, left: 3),
                                  image:
                                      'https://nadeemacservice.pk/wp-content/uploads/2022/11/Air-Conditioning-lahore-1024x818.jpg',
                                  addButton: AddButton(
                                    color: AppColors.whiteTheme,
                                    onIncrement: () => paintingBedroomController.increment(),
                                    onDecrement: () => paintingBedroomController.decrement(),
                                    count: paintingBedroomController.count.value.toString(),
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
                            const SizedBox(width: 6),
                            Text('Through cleaning of indoor unit with foan jet-spray',
                                style: TextStyle(color: AppColors.hintGrey)),
                            const SizedBox(height: 10),
                            ViewDetailButton(onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                constraints: const BoxConstraints(),
                                context: context,
                                builder: (context) => const ACViewDetailBottomSheet(),
                              );
                            }),
                            const SizedBox(height: 20),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  appText('Living & dining room', fontSize: 18.px, fontWeight: FontWeight.bold),
                  const SizedBox(height: 20),
                  SizedBox(
                    key: livingAndDiningKey,
                    child: ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0.0),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ProductDescriptionDetailWidget(
                                  offer: 'Rs. 120 PER AC',
                                  serviceName: 'Living room painting',
                                  rating: '4.55',
                                  review: '(621k reviews)',
                                  price: 'Rs. 400',
                                  discountPrice: 'Rs. 100',
                                  duration: '1 hr 30 mins',
                                  offText: 'Rs. 120 OFF onward this offer',
                                ),
                                AddItemButton(
                                  margin: const EdgeInsets.only(top: 20, left: 3),
                                  addButton: AddButton(
                                    color: AppColors.whiteTheme,
                                    onIncrement: () => paintingDiningController.increment(),
                                    onDecrement: () => paintingDiningController.decrement(),
                                    count: paintingDiningController.count.value.toString(),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            dottedLine(width: double.maxFinite, color: AppColors.grey300),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.circle, size: 6),
                                      SizedBox(width: 4.px),
                                      appText('Cut & Clear : ', fontWeight: FontWeight.bold, fontSize: 13),
                                    ],
                                  ),
                                  appText(
                                    'This is the description of product and detail is given in the next page.',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            EditPackageButton(onTap: () {
                              showEditPackageBottomSheet(context);
                            }),
                            const SizedBox(height: 20),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.px),
                  appText('Installation/Uninstallation', fontWeight: FontWeight.bold, fontSize: 18.px),
                  SizedBox(height: 20.px),
                  SizedBox(
                    key: packagesKey,
                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0.0),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.px),
                            Container(
                              height: 200.px,
                              decoration: BoxDecoration(
                                  color: AppColors.grey300,
                                  borderRadius: BorderRadius.circular(10.px),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://nadeemacservice.pk/wp-content/uploads/2022/11/Air-Conditioning-lahore-1024x818.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 20.px),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ProductDescriptionDetailWidget(
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
                                  margin: const EdgeInsets.only(top: 20, left: 3),
                                  addButton: AddButton(
                                    color: AppColors.whiteTheme,
                                    onIncrement: () => paintingBedroomController.increment(),
                                    onDecrement: () => paintingBedroomController.decrement(),
                                    count: paintingBedroomController.count.value.toString(),
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
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Flexible(
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
                                constraints: const BoxConstraints(),
                                context: context,
                                builder: (context) => const ACViewDetailBottomSheet(),
                              );
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
            return AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: scrollController.showHeader.value ? 0 : -60,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      left: 0,
                      right: 10,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
                        appText('Bathroom cleaning', fontWeight: FontWeight.bold, fontSize: 18),
                        const Spacer(),
                        AppBarShareButton(),
                        const SizedBox(width: 10),
                        const AppBarSearchButton()
                      ],
                    ),
                  ),
                  // Category indicator
                  if (scrollController.currentCategory.value.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border(top: BorderSide(color: Colors.grey.shade200))),
                      child:
                          appText(scrollController.currentCategory.value, fontWeight: FontWeight.bold, fontSize: 16.px),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Obx(() {
        bool shouldShowBottomBar = paintingBedroomController.count.value > 0 ||
            paintingDiningController.count.value > 0 ||
            paintingPackagesController.count.value > 0 ||
            paintingWallController.count.value > 0;

        double totalPrice = shouldShowBottomBar ? priceController.totalPrice.value : 0;
        double discount = shouldShowBottomBar ? priceController.savings.value : 0;

        return shouldShowBottomBar
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      PriceBottomSheet(
                        savingText: 'Congratulation! You saved Rs.${discount.toString()} on this',
                        onViewCartTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SummaryScreen(onChecked: false),
                            ),
                          );
                        },
                        price: 'Rs. ${totalPrice.toStringAsFixed(0)}',
                        discount: 'Rs.${discount.toStringAsFixed(0)}',
                      ),
                      if (priceController.showConfetti.value)
                        Align(
                          alignment: Alignment.center,
                          child: ConfettiWidget(
                            confettiController: priceController.confettiController,
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
            : const SizedBox.shrink();
      }),
    );
  }
}

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
