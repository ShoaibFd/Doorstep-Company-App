import 'package:doorstep_company_app/utils/enum/reel_enum.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../api/controllers/banner/banners_controller.dart';
import '../../api/controllers/categories/category_controller.dart';
import '../../api/controllers/categories/sub_category_controller.dart';
import '../../api/controllers/categories/subscription_package_controller.dart';
import '../../api/controllers/home_screen_controller.dart';
import '../../utils/enum/banner_enums.dart';
import '../../components/app_text.dart';
import '../../components/custom_container.dart';
import '../../components/divider.dart';
import '../../components/show_loading.dart';
import '../../theme/colors.dart';
import '../account_screen/reward_screen.dart';
import '../cart_screen/cart_screen.dart';
import '../notification_screen/notification_screen.dart';
import 'components/carousel_slider.dart';
import 'components/category_widget.dart';
import 'components/floating_action_button.dart';
import 'components/most_booked_services.dart';
import 'packages/package_and_products_widgets.dart';
import 'components/search_bar.dart';
import 'components/social_plateform_widget.dart';
import 'components/suggestion_section.dart';
import 'components/video_player_section.dart';

class HomeScreen extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  const HomeScreen({super.key, this.latitude, this.longitude});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  bool isbottomSheet = false;
  String? address;
  String? city;
  final String urlToShare = 'https://flutter.dev';
  final List<String> videoUrls = [
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // showProfessionalRatingBottomSheet(context);
    });

    // Simplified null/zero check
    if (widget.latitude != null && widget.longitude != null && widget.latitude != 0.0 && widget.longitude != 0.0) {
      getAddressFromLatLng(widget.latitude!, widget.longitude!);
    }
  }

  final HomeController homeController = Get.put(HomeController());

  Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          address = '${place.subLocality}, ${place.locality},${place.postalCode} ${place.country}';
          city = '${place.locality} , ${place.country}';
        });
        return address;
      }
    } catch (e) {
      debugPrint('Error getting address: $e');
    }
    return null;
  }

  final CategoryController categoryController = Get.put(CategoryController());
  final bannersController = Get.put(BannersController(BannerType.home));

  final subCategoryController = Get.put(SubCategoryController());
  final subscriptionController = Get.put(SubscriptionPackageController());

  Future<void> refreshPage() async {
    await Future.wait([
      homeController.fetchAllData(),
      bannersController.fetchBanners(),
      subscriptionController.fetchSubscriptionPackages()
    ]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            floatingActionButton: const HomeFloatingButtons(),
            backgroundColor: AppColors.whiteTheme,
            body: LiquidPullToRefresh(
              onRefresh: refreshPage,
              color: AppColors.blackColor,
              height: 70.px,
              backgroundColor: AppColors.whiteTheme,
              animSpeedFactor: 3,
              showChildOpacityTransition: false,
              child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                          automaticallyImplyLeading: false,
                          expandedHeight: 60.px,
                          floating: false,
                          pinned: false,
                          backgroundColor: AppColors.whiteTheme,
                          flexibleSpace: FlexibleSpaceBar(
                              background: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 16.px),
                                          appText('$city', fontWeight: FontWeight.w600, fontSize: 15),
                                          SizedBox(height: 2.px),
                                          SizedBox(
                                            width: width * 0.55,
                                            child: appText('$address',
                                                maxLines: 1,
                                                textOverflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.hintGrey),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: width * 0.07),
                                      GestureDetector(
                                          onTap: () {
                                            Get.to(const NotificationScreen());
                                          },
                                          child: Container(
                                              height: 36.px,
                                              width: 36.px,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle, border: Border.all(color: AppColors.grey300)),
                                              child: Badge.count(
                                                  count: 2,
                                                  child: Center(child: Icon(Icons.notifications, size: 21.px))))),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(const CartScreen());
                                        },
                                        child: Container(
                                            height: 36.px,
                                            width: 36.px,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle, border: Border.all(color: AppColors.grey300)),
                                            child: Badge.count(
                                                count: 3,
                                                child: Center(child: Icon(Icons.shopping_cart, size: 20.px)))),
                                      ),
                                    ],
                                  )))),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(
                          minHeight: 70.px,
                          maxHeight: 70.px,
                          child: Container(
                            color: AppColors.whiteTheme,
                            child: searchBarSection(context),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First Carousel Slider
                      Obx(() {
                        if (bannersController.isLoading.value) {
                          return Center(child: showLoading());
                        }
                        if (bannersController.bannerImages.isEmpty) {
                          return const SizedBox();
                        }
                        return CarouselSliderWidget(
                          height: height * .3,
                          images: bannersController.bannerImages,
                        );
                      }),

                      categoryWidget(context),
                      // This will remove the divider if the category heading is empty
                      if (categoryController.categories.value != null) div() else const SizedBox(),
                      // Packages and Projects
                      packagesAndProjects(context),
                      div(),
                      // Second Carousel Slider
                      Obx(() {
                        if (bannersController.isLoading.value) {
                          return Center(child: showLoading());
                        }
                        if (bannersController.bannerImages.isEmpty) {
                          return const SizedBox();
                        }
                        return CarouselSliderWidget(
                          height: height * .3,
                          images: bannersController.bannerImages,
                        );
                      }),
                      // This will remove the divider if the banner images are empty
                      bannersController.bannerImages.isEmpty ? const SizedBox() : div(),
                      // Most Booked Services
                      mostBookedServices(context),

                      // Celebrating Professionals Section
                      Container(
                        height: height * 0.43,
                        color: AppColors.whiteTheme,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText('Celebrating Professionals', fontSize: 20.px, fontWeight: FontWeight.bold),
                              SizedBox(height: 8.px),
                              appText('Real lives , real Impact', fontSize: 16.px),
                              SizedBox(height: 16.px),
                              // Video Player Section
                              const VideoPlayerSection(reelType: ReelType.home),
                            ],
                          ),
                        ),
                      ),
                      div(),
                      // Refer and get free service Section
                      GestureDetector(
                        onTap: () {
                          Get.to(const RewardScreen());
                        },
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                SizedBox(height: 20.px),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText("Refer and get\nfree service",
                                            fontSize: 20.px, fontWeight: FontWeight.bold),
                                        SizedBox(height: 10.px),
                                        appText("Invite and get Rs.100*", color: AppColors.blackColor, fontSize: 16.px),
                                        SizedBox(height: 10.px),
                                      ],
                                    ),
                                    Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSANVqC0bj72i2eBsoY_Z-54DGv23wf-AHMVA&s',
                                      height: 140.px,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.px),
                              ],
                            ),
                          ),
                        ),
                      ),
                      div(),
                      // Social Plateforms Section
                      socialPlatformsWidgets(),
                      div(),
                      // Suggestion Section
                      suggestionSection(context),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      SizedBox(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.px),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appText("Share DC Mobile App", fontSize: 20.px, fontWeight: FontWeight.bold),
                                  SizedBox(height: 10.px),
                                  Row(
                                    children: [
                                      appText("With your loved ones", fontSize: 16, color: AppColors.hintGrey),
                                      SizedBox(width: 70.px),
                                      CustomContainer(
                                          onTap: () {
                                            Share.share('Check out the Flutter website: $urlToShare');
                                          },
                                          height: 34.px,
                                          width: 90.px,
                                          borderColor: AppColors.lowPurple,
                                          color: AppColors.lowPurple.withOpacity(0.03),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              appText('Share', color: AppColors.lowPurple, fontSize: 18.px),
                                              Image.asset('assets/images/share.png',
                                                  height: 20.px, color: AppColors.lowPurple)
                                            ],
                                          ))
                                    ],
                                  ),
                                ],
                              ))),
                      SizedBox(height: height * 0.015),
                    ],
                  ))),
            )));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
