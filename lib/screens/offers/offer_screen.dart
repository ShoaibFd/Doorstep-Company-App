import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../home_screen/widgets/carousel_slider.dart';
import 'ac/ac_detail_screen.dart';
import 'ac/ac_screen.dart';
import 'fridge/fridge_screen.dart';
import 'geyser/geyser_screen.dart';
import 'washing_machine/washing_machine_screen.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  List images = [
    'https://pngimg.com/d/air_conditioner_PNG24.png',
    'https://www.pngarts.com/files/18/Geyser-PNG-Photo-HQ.png',
    'https://freepngimg.com/save/19053-refrigerator-png-file/1500x1500',
    'https://pngimg.com/d/washing_machine_PNG15589.png',
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
  List<String> text = ["AC", "Geyser", "Fridge", "Washing Machine"];
  final List<String> videoUrls = [
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

// Search controller
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.px),
              child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey300), borderRadius: BorderRadius.circular(10.px)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey300), borderRadius: BorderRadius.circular(10.px)),
                      hintText: 'Search For Service',
                      prefixIcon: Icon(Icons.search_rounded, color: AppColors.hintGrey, size: 24.px)))),
          SizedBox(height: 20.px),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSliderWidget(
                    height: 240.px,
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Shop by category', fontSize: 20.px, fontWeight: FontWeight.bold),
                        SizedBox(height: 30.px),
                        GridView.builder(
                          itemCount: images.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.px,
                              mainAxisSpacing: 10.px,
                              mainAxisExtent: 145.px),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const ACScreen(),
                                        ),
                                      );
                                    } else if (index == 1) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const GeyserScreen(),
                                        ),
                                      );
                                    } else if (index == 2) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const FridgesScreen(),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const WashingMachineScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 6.px, right: 6.px),
                                    height: 110.px,
                                    width: 110.px,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.px),
                                      color: AppColors.whiteTheme,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.grey300,
                                          offset: const Offset(0, 1),
                                          blurRadius: 3,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      spacing: 10.px,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          images[index],
                                          height: 80.px,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.px),
                                appText('Air-conditioner', fontWeight: FontWeight.bold)
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 10.px),
                        const Divider(),
                        SizedBox(height: 20.px),
                        appText('Top Selling', fontSize: 20.px, fontWeight: FontWeight.bold),
                        SizedBox(height: 20.px),
                        SizedBox(
                          height: 210.px,
                          width: double.maxFinite,
                          child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const AcDetailScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10.px, left: 6.px, top: 2.px),
                                      height: 110.px,
                                      width: 110.px,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.px),
                                        color: AppColors.whiteTheme,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.grey300,
                                            offset: const Offset(0, 1),
                                            blurRadius: 3,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            'https://pngimg.com/d/air_conditioner_PNG24.png',
                                            height: 80.px,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.px),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      appText('Air Conditioner', fontWeight: FontWeight.bold),
                                      SizedBox(height: 4.px),
                                      Row(
                                        children: [
                                          Icon(Icons.star, size: 14.px, color: AppColors.hintGrey),
                                          SizedBox(width: 4.px),
                                          appText('4.88 (491K)', color: AppColors.hintGrey)
                                        ],
                                      ),
                                      SizedBox(height: 4.px),
                                      appText('Rs.300',
                                          decoration: TextDecoration.lineThrough, color: AppColors.hintGrey),
                                      SizedBox(height: 4.px),
                                      appText('Rs.200', color: AppColors.greenColor, fontWeight: FontWeight.bold),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10.px),
                        const Divider(),
                        SizedBox(height: 16.px),
                        appText('Learn more with Doorstep', fontSize: 20.px, fontWeight: FontWeight.bold),
                        SizedBox(height: 20.px),
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
                                width: 150.px,
                                margin: EdgeInsets.only(right: 6.px),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: controller.value.isInitialized
                                            ? VideoPlayer(controller)
                                            : const Center(child: CircularProgressIndicator()),
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
                                              controller.value.isPlaying ? controller.pause() : controller.play();
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
                        SizedBox(height: 40.px),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
