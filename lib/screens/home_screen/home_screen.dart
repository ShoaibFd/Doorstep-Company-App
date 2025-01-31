import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../account_screen/reward_screen.dart';
import '../cart_screen/cart_screen.dart';
import '../notification_screen/notification_screen.dart';
import 'professional_rating_bottom_sheet.dart';
import 'widgets/carousel_slider.dart';
import 'widgets/category_widget.dart';
import 'widgets/most_booked_services.dart';
import 'widgets/package_and_products_widgets.dart';
import 'widgets/search_bar.dart';
import 'widgets/social_plateform_widget.dart';
import 'widgets/suggestion_section.dart';

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
  final List<VideoPlayerController> _controllers = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showProfessionalRatingBottomSheet(context);
    });
    if ((widget.latitude != 0.0 || widget.latitude != null) && (widget.longitude != 0.0 || widget.longitude != null)) {
      getAddressFromLatLng(widget.latitude ?? 0, widget.longitude ?? 0);
    }
    super.initState();
    for (var url in videoUrls) {
      _controllers.add(VideoPlayerController.network(url)
        ..initialize().then((_) {
          setState(() {});
        }));
    }
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
          floatingActionButton: Container(
            margin: EdgeInsets.only(left: 40.px),
            height: 110.px,
            width: 60.px,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      height: 45.px,
                      width: 45.px,
                      decoration: const BoxDecoration(color: AppColors.greenColor, shape: BoxShape.circle),
                      child: const Icon(Icons.call, color: AppColors.whiteTheme)),
                  SizedBox(height: 10.px),
                  Container(
                    height: 45.px,
                    width: 45.px,
                    decoration: const BoxDecoration(
                        color: AppColors.greenColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/images/WhatsApp.png'), fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: AppColors.whiteTheme,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.px),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 8.px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('$city', fontWeight: FontWeight.w600, fontSize: 15),
                          SizedBox(height: 2.px),
                          SizedBox(
                              width: width * 0.55,
                              child: appText('$address',
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.hintGrey))
                        ],
                      ),
                      SizedBox(width: width * 0.07),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                          },
                          child: Container(
                              height: 36.px,
                              width: 36.px,
                              decoration:
                                  BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.grey300)),
                              child:
                                  Badge.count(count: 2, child: Center(child: Icon(Icons.notifications, size: 21.px))))),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                          },
                          child: Container(
                              height: 36.px,
                              width: 36.px,
                              decoration:
                                  BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.grey300)),
                              child:
                                  Badge.count(count: 3, child: Center(child: Icon(Icons.shopping_cart, size: 20.px))))),
                    ],
                  )),

              // Search Bar Section
              searchBarSection(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.010),
                      // Carousel Slider Section
                      CarouselSliderWidget(
                        height: height * .3,
                        images: const [
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
                      // Grid View of Categories
                      categoryWidget(context),
                      div(),
                      SizedBox(height: 20.px),
                      // Packages and Projects Section
                      packagesAndProjects(context),
                      SizedBox(height: 16.px),
                      div(),
                      SizedBox(height: 20.px),
                      SizedBox(height: height * 0.0160),
                      // Second Carousel Slider
                      CarouselSliderWidget(
                        height: height * .3,
                        images: const [
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
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      // The Most Book Services Section
                      mostBookedServices(context),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      // Celebrating Professional Section
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
                                SizedBox(
                                  height: height * 0.32,
                                  child: ListView.builder(
                                    itemCount: videoUrls.length,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final controller = _controllers[index];
                                      return Container(
                                        width: width * .38,
                                        margin: EdgeInsets.only(right: 10.px),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: controller.value.isInitialized
                                                    ? VideoPlayer(controller)
                                                    : Center(child: appText('Loading..')),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                  icon: Icon(
                                                    controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                                    color: AppColors.whiteTheme,
                                                    size: 30.px,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      controller.value.isPlaying
                                                          ? controller.pause()
                                                          : controller.play();
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )),

                      div(),
                      // Refer and Get Reward Section
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RewardScreen()));
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
                                        height: 140.px),
                                  ],
                                ),
                                SizedBox(height: 20.px),
                              ],
                            ),
                          ),
                        ),
                      ),
                      div(),
                      // Social Plateform Section
                      socialPlateformsWidgets(),
                      div(),
                      // Suggestion Section
                      suggestionSection(context),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      // Share Section
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
                                  SizedBox(width: 110.px),
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
              )
            ],
          )),
    );
  }
}
