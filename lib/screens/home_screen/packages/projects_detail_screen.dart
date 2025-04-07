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
import 'package:doorstep_company_app/screens/ac_screens/controllers/ac_packages_controller.dart';
import 'package:doorstep_company_app/screens/cart_screen/summary_screen.dart';
import 'package:doorstep_company_app/screens/painting_wall_screen/components/add_button.dart';
import 'package:doorstep_company_app/screens/salon_for_women/components/offers_section.dart';
import 'package:doorstep_company_app/screens/subcategory_screens/Widgets/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app_controllers/price_controller.dart';
import '../../../components/app_text.dart';
import '../../../components/dc_cover_button.dart';
import '../../../components/divider.dart';
import '../../../theme/colors.dart';
import '../../ac_screens/components/floating_action_button_widget.dart';
import '../../subcategory_screens/Widgets/app_bar_search_button.dart';
import '../../subcategory_screens/Widgets/app_bar_share_button.dart';

class ProjectsDetailScreen extends StatefulWidget {
  const ProjectsDetailScreen({super.key});

  @override
  State<ProjectsDetailScreen> createState() => _ProjectsDetailScreenState();
}

class _ProjectsDetailScreenState extends State<ProjectsDetailScreen> {
  late ConfettiController _confettiController;
  // Global Keys
  final GlobalKey packagesKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey repairGasKey = GlobalKey();
  final GlobalKey installationKey = GlobalKey();
  List services = [
    'Packages',
    'Services',
    'Repair & gas refill',
    'Installation/Uninstallation',
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

  final PriceController priceController = Get.put(PriceController());
  final ScrollControllerX scrollController = Get.put((ScrollControllerX()));
  final AcPackagesController acPackagesController = Get.put(AcPackagesController());
  final AcServicesController acServicesController = Get.put(AcServicesController());
  final AcRepairController acRepairController = Get.put(AcRepairController());
  final AcInstallationController acInstallationController = Get.put(AcInstallationController());

// OnScroll Function
  void onScroll() {
    final scrollPosition = _scrollController.offset;
    final headerHeight = MediaQuery.of(context).padding.top + 60;
    const categoryHeight = 40.0;
    double offset = scrollPosition + headerHeight + categoryHeight;

    // To Calculate position section
    final packagesPosition = getPosition(packagesKey);
    final servicesPosition = getPosition(servicesKey);
    final repairGasPosition = getPosition(repairGasKey);
    final installationPosition = getPosition(installationKey);

    // To Show Current Section
    String currentCategory = '';
    bool shouldShowHeader = false;

    if (installationPosition != null && offset >= installationPosition) {
      currentCategory = 'Installation/Uninstallation';
      shouldShowHeader = true;
    } else if (repairGasPosition != null && offset >= repairGasPosition) {
      currentCategory = 'Repair & Gas Refill';
      shouldShowHeader = true;
    } else if (servicesPosition != null && offset >= servicesPosition) {
      currentCategory = 'Services';
      shouldShowHeader = true;
    } else if (packagesPosition != null && offset >= packagesPosition) {
      currentCategory = 'Packages';
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
      packagesKey,
      servicesKey,
      repairGasKey,
      installationKey,
    ];
    return Scaffold(
      floatingActionButton: AcFloatingActionButton(
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
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.px),
                  TopBarwidget(carouselImages: carouselImages),
                  SizedBox(height: 20.px),
                  appText("AC Repair & Service", fontSize: 22.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 12.px),
                  // Rating Section
                  const RatingRowSection(ratingText: '4.82', bookings: '(1.4M Bookings)'),
                  SizedBox(height: 16.px),
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
                  appText('Packages', fontWeight: FontWeight.bold, fontSize: 18.px),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ProductDescriptionDetailWidget(
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
                                  margin: const EdgeInsets.only(top: 20, left: 3),
                                  image:
                                      'https://nadeemacservice.pk/wp-content/uploads/2022/11/Air-Conditioning-lahore-1024x818.jpg',
                                  addButton: AddButton(
                                    color: AppColors.whiteTheme,
                                    onIncrement: () => acPackagesController.increment(),
                                    onDecrement: () => acPackagesController.decrement(),
                                    count: acPackagesController.count.value.toString(),
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
                              padding: const EdgeInsets.all(0),
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
                            const SizedBox(height: 25),
                            ViewDetailButton(onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  constraints: const BoxConstraints(),
                                  context: context,
                                  builder: (context) {
                                    return const ACViewDetailBottomSheet();
                                  });
                            }),
                            const SizedBox(height: 20),
                            index == 3 ? div() : Divider(color: Colors.grey.shade200),
                            SizedBox(height: 25.px)
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  appText('Services', fontWeight: FontWeight.bold, fontSize: 20.px),
                  const SizedBox(height: 20),

                  SizedBox(
                    key: servicesKey,
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
                                  serviceName: 'Power saver AC services',
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
                                    onIncrement: () => acServicesController.increment(),
                                    onDecrement: () => acServicesController.decrement(),
                                    count: acServicesController.count.value.toString(),
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
                  appText('Repair & gas refill', fontSize: 18.px, fontWeight: FontWeight.bold),
                  const SizedBox(height: 20),
                  SizedBox(
                    key: repairGasKey,
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
                                  serviceName: 'AC less/no cooling repair',
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
                                    onIncrement: () => acRepairController.increment(),
                                    onDecrement: () => acRepairController.decrement(),
                                    count: acRepairController.count.value.toString(),
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
                                padding: const EdgeInsets.all(0),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Icon(Icons.circle, size: 6),
                                        ),
                                        SizedBox(width: 4.px),
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Cut & clear: ',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold, color: AppColors.blackColor),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'This is the description of product and detail is given in the next page.',
                                                  style: TextStyle(
                                                      color: AppColors.hintGrey,
                                                      fontWeight: FontWeight.normal,
                                                      height: 1.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            SizedBox(height: 15.px),
                            EditPackageButton(onTap: () {
                              showEditPackageBottomSheet(context);
                            }),
                            SizedBox(height: 20.px),
                            const Divider(),
                            SizedBox(height: 25.px),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.px),
                  appText('Installation/Uninstallation', fontWeight: FontWeight.bold, fontSize: 18.px),
                  SizedBox(height: 20.px),
                  SizedBox(
                    key: installationKey,
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
                                    onIncrement: () => acInstallationController.increment(),
                                    onDecrement: () => acInstallationController.decrement(),
                                    count: acInstallationController.count.value.toString(),
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
                              padding: const EdgeInsets.all(0),
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
                            SizedBox(height: 25.px),
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
                            SizedBox(height: 25.px)
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
                        IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Get.back()),
                        appText('AC Repair & Services', fontWeight: FontWeight.bold, fontSize: 18),
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
        bool shouldShowBottomBar = acInstallationController.count.value > 0 ||
            acServicesController.count.value > 0 ||
            acPackagesController.count.value > 0 ||
            acRepairController.count.value > 0;
        // Price Calculation
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
                          Get.to(const SummaryScreen(onChecked: false));
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
                                gravity: 0.2)),
                    ],
                  )
                ],
              )
            : const SizedBox.shrink();
      }),
    );
  }
}
