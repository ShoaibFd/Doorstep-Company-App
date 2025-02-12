import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/colors.dart';
import '../../../components/bottom_sheet/review_bottom_sheet.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/app_text.dart';
import '../../../components/divider.dart';
import '../../home_screen/components/carousel_slider.dart';
import '../../order_place_screen/order_screen.dart';
import '../../painting_wall_screen/components/frequently_asked_questions_widget.dart';
import '../ac/custom_app_bar.dart';
import '../ac/custom_row.dart';
import '../ac/delivery_bottom_sheet.dart';
import '../ac/images.dart';

class FridgesDetailScreen extends StatefulWidget {
  // double height ;
  // double width ;
  const FridgesDetailScreen({super.key});

  @override
  State<FridgesDetailScreen> createState() => _FridgesDetailScreenState();
}

class _FridgesDetailScreenState extends State<FridgesDetailScreen> {
  // final CarouselController _carouselController = CarouselController();

  // final int _currentSlide = 0;
  Widget _buildVideoPlayer(VideoPlayerController controller) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: controller.value.isInitialized ? controller.value.aspectRatio : 16 / 9,
          child: controller.value.isInitialized
              ? VideoPlayer(controller)
              : const Center(child: CircularProgressIndicator()),
        ),
        Align(
          alignment: Alignment.center,
          child: IconButton(
            icon: Icon(
              controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                controller.value.isPlaying ? controller.pause() : controller.play();
              });
            },
          ),
        ),
      ],
    );
  }

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
  bool isChecked = true;
  //
  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  final List<VideoPlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each video
    for (var url in videoUrls) {
      _controllers.add(VideoPlayerController.network(url)
        ..initialize().then((_) {
          setState(() {});
        }));
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
  //

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: myAppBar(context),
      floatingActionButton: Transform.translate(
          offset: const Offset(0, -50),
          child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: AppColors.blackColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
              },
              child: const Icon(Icons.shopping_cart, color: AppColors.lowPurple))),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText('Samsung Investors',
                          fontWeight: FontWeight.bold, fontSize: 21, color: AppColors.redColor),
                          
                      Row(
                        children: [
                          SizedBox(width: width * 0.01),
                          appText("PKR 108,000", fontWeight: FontWeight.w700),
                          SizedBox(width: width * 0.01),
                          appText("PKR 115,000", color: AppColors.greyColor, decoration: TextDecoration.lineThrough),
                          SizedBox(width: 20.px),
                          InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.px), color: AppColors.lowPurple),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: Center(child: appText("15% Discount", color: AppColors.whiteTheme)),
                                  ))),
                          SizedBox(width: 10.px),
                          InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.px), color: AppColors.lowPurple),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: Center(child: appText("15% OFF", color: AppColors.whiteTheme)),
                                  ))),
                        ],
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        children: [
                          const Text('Hall',
                              style: TextStyle(color: AppColors.whiteTheme, backgroundColor: AppColors.lowPurple)),
                          SizedBox(width: width * 0.01),
                          appText("Dawalance Atomos Cool Inverter 15/ 1 Ton/",
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ],
                      ),
                      appText("Split AC/ 12000 BTU / 12 Years Compressor",
                          fontWeight: FontWeight.w500, fontSize: 15.px),
                      appText("Warranty", fontWeight: FontWeight.w500, fontSize: 15.px),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      appText("100% Authentic", fontWeight: FontWeight.w400, fontSize: 15.px),
                      const Spacer(),
                      const Icon(Icons.favorite, color: AppColors.redColor),
                      SizedBox(width: width * 0.02),
                      const Icon(Icons.share, color: AppColors.blueColor),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            showReviewsBottomSheet(context);
                          },
                          child: Container(
                              width: width * 0.20,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.px),
                                  color: AppColors.darkGreen,
                                  border: Border.all(color: AppColors.lightGrey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.star, color: AppColors.whiteTheme, size: 18.px),
                                  appText("4.5(42)", color: AppColors.whiteTheme),
                                ],
                              ))),
                      SizedBox(width: width * 0.02),
                      appText("200 sold", fontWeight: FontWeight.w400),
                    ],
                  ),
                  SizedBox(height: 20.px),
                  const Divider(),
                  SizedBox(height: 10.px),
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return DeliveryBottomSheet(height: height * 0.7, width: width);
                          },
                        );
                      },
                      child: appText("Delivery Details", fontWeight: FontWeight.w600)),
                  SizedBox(height: 10.px),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: appText("Product Details", fontWeight: FontWeight.w700, fontSize: 18.px)),
                      appText("Highlights", color: AppColors.greyColor, fontSize: 17.px),
                      const CustomRow(title: "Indoor Unit Cooling Operating Range 17-32"),
                      const CustomRow(title: "Condenser Fin: Gold Fin"),
                      const CustomRow(title: "EER:32"),
                      const CustomRow(title: "Coole Liquid; R32"),
                      const CustomRow(title: "Energy in Heating(W):3664"),
                      const CustomRow(title: "Noise Level DB: 55"),
                      const CustomRow(title: "Outdoor DB: 55"),
                      const CustomRow(title: "Air Flow rate m3/hr: 600"),
                      const CustomRow(title: "Removeable/ Washable Filter: Yes"),
                      const CustomRow(title: "Turbo Mode: Yes"),
                      const CustomRow(title: "Memory Funtion: Yes"),
                      const CustomRow(title: "AntiD Rust Outdoor Casing: Yes"),
                      const CustomRow(title: "Cooling Capacit(Btu / h): 12000BTU/h"),
                      const CustomRow(title: "Voltage Range: 220-240V"),
                      const CustomRow(title: "Minimum Energy Mode(Inverter): Yes"),
                    ],
                  ),
                  div(),
                  SizedBox(height: 10.px),
                  appText("Description", fontWeight: FontWeight.bold, fontSize: 18.px),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ImagesScreen()));
                      },
                      child: Container(
                          height: height * 0.3,
                          width: width * 0.8,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/air-conditioner.png"), fit: BoxFit.cover)),
                          child: appText("1/16", fontSize: 16.px, fontWeight: FontWeight.bold))),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 10.px),
                  appText('Top Selling', fontSize: 20, fontWeight: FontWeight.bold),
                  SizedBox(height: 10.px),
                  SizedBox(
                    height: 110.px,
                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 6.px),
                          height: 100.px,
                          width: 100.px,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/w/4/3/large-bridal-poster-for-beauty-parlour-shop-waterproof-vinyl-original-imah2245jfrhz2fj.jpeg?q=90&crop=false'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.darkGreen),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 10.px),
                  appText('Learn more with Doorstep', fontSize: 20, fontWeight: FontWeight.bold),
                  SizedBox(height: 10.px),
                  SizedBox(
                      height: 100.px,
                      child: ListView.builder(
                        itemCount: videoUrls.length,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final controller = _controllers[index];
                          return Container(
                              margin: EdgeInsets.only(right: 6.px),
                              height: 100.px,
                              width: 100.px,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8), child: _buildVideoPlayer(controller)));
                        },
                      )),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  const FrequentlyAskedQuestionsWidget(),
                  Divider(thickness: 4.px),
                ],
              ))),
            ],
          )),
      bottomSheet: Material(
          elevation: 1,
          child: Container(
              height: 80.px,
              width: double.maxFinite,
              color: AppColors.whiteTheme,
              child: Padding(
                  padding: EdgeInsets.all(8.px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomContainer(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
                          },
                          height: 40.px,
                          width: 160.px,
                          color: AppColors.transparentColor,
                          borderColor: AppColors.blueShade,
                          borderRadius: 8.px,
                          child: Center(child: appText('View cart'))),
                      CustomContainer(
                          onTap: () {
                            showSuccessSnackbar(context, 'Added to cart successfully');
                          },
                          height: 40.px,
                          width: 160.px,
                          color: AppColors.blueColor,
                          borderRadius: 8.px,
                          child: Center(child: appText('Add to cart', color: AppColors.whiteTheme))),
                    ],
                  )))),
    );
  }
}
