import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../components/custom_container.dart';
import '../../components/custom_text.dart';
import '../../components/divider.dart';
import '../../constants/colors.dart';
import '../account_screen/reward_screen.dart';
import '../cart_screen/cart_screen.dart';
import '../notification_screen/notification_screen.dart';
import 'components/carousel_slider.dart';
import 'components/category_widget.dart';
import 'components/floating_action_button.dart';
import 'components/most_booked_services.dart';
import 'components/package_and_products_widgets.dart';
import 'components/search_bar.dart';
import 'components/social_plateform_widget.dart';
import 'components/suggestion_section.dart';
import 'components/video_player_section.dart';
import 'professional_rating_bottom_sheet.dart';

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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showProfessionalRatingBottomSheet(context);
    });
    if ((widget.latitude != 0.0 || widget.latitude != null) && (widget.longitude != 0.0 || widget.longitude != null)) {
      getAddressFromLatLng(widget.latitude ?? 0, widget.longitude ?? 0);
    }
    super.initState();
  }

  List<String> images = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
    'assets/images/pest-control.png',
    'assets/images/drill.png',
    'assets/images/water.jpg',
    'assets/images/smartphone.png',
    'assets/images/paintingwater.png',
    'assets/images/bricks.png',
  ];

  List<String> carouselImages = [
    'assets/images/cs.jpeg',
    'assets/images/cs2.jpeg',
    'assets/images/a.jpeg',
    'assets/images/aa.jpeg',
    'assets/images/aaa.jpeg',
    'assets/images/aaaa.jpeg',
    'assets/images/aaaaa.jpeg',
    'assets/images/aaaaaa.jpeg',
  ];

  List<String> addimages = [
    'assets/images/a.jpeg',
    'assets/images/aa.jpeg',
    'assets/images/a.jpeg',
    'assets/images/aa.jpeg',
    'assets/images/aaa.jpeg',
    'assets/images/aaaa.jpeg',
    'assets/images/aaaaa.jpeg',
    'assets/images/aaaaaa.jpeg',
  ];

  Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    setState(() {
      address = '${place.subLocality}, ${place.locality},${place.postalCode} ${place.country}';
      city = '${place.locality} , ${place.country}';
    });
    return address;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const HomeFloatingButtons(),
          backgroundColor: AppColors.whiteTheme,
          body: NestedScrollView(
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
                                            count: 2, child: Center(child: Icon(Icons.notifications, size: 21.px))))),
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
                                          count: 3, child: Center(child: Icon(Icons.shopping_cart, size: 20.px)))),
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
                  SizedBox(height: height * 0.010),
                  CarouselSliderWidget(
                    height: height * .3,
                    images: carouselImages,
                  ),
                  categoryWidget(context),
                  div(),
                  SizedBox(height: 20.px),
                  packagesAndProjects(context),
                  SizedBox(height: 16.px),
                  div(),
                  SizedBox(height: 20.px),
                  SizedBox(height: height * 0.0160),
                  CarouselSliderWidget(
                    height: height * .3,
                    images: carouselImages,
                  ),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  mostBookedServices(context),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
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
                          const VideoPlayerSection(),
                        ],
                      ),
                    ),
                  ),
                  div(),
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
                  socialPlateformsWidgets(),
                  div(),
                  suggestionSection(context),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  Container(
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
                                      Image.asset(
                                        'assets/images/share.png',
                                        height: 20.px,
                                        color: AppColors.lowPurple,
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                ],
              ),
            ),
          )),
    );
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
