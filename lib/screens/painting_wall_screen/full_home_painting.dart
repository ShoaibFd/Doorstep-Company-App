import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../theme/colors.dart';
import '../../components/app_text.dart';
import '../../components/divider.dart';
import '../../components/round_button.dart';
import '../subcategory_screens/Widgets/topbar_widget.dart';
import '../summary_screen/paint_summary_screen.dart';
import 'components/add_button.dart';
import 'components/how_it_works_widget.dart';
import 'components/painting_view_detail_sheet.dart';
import 'components/reviews_widget.dart';
import 'explore_bottom_sheet.dart';
import 'rewiew.dart';

class FullHomeScreen extends StatefulWidget {
  const FullHomeScreen({super.key});

  @override
  _FullHomeScreenState createState() => _FullHomeScreenState();
}

class _FullHomeScreenState extends State<FullHomeScreen> {
  //

  List title = [
    'End-to-end\nmanagement',
    'Accurate quotations\nNo hidden charges',
    'On-time\ncompletion',
    '1-year-DC\nwarranty'
  ];
  List images = [
    'assets/images/management.png',
    'assets/images/quotation.png',
    'assets/images/complete.png',
    'assets/images/warranty.png'
  ];
  void increment(int index) {
    setState(() {
      selectedCounts[index] = (selectedCounts[index] ?? 0) + 1;
    });
  }

//
  void decrement(int index) {
    setState(() {
      if (selectedCounts[index] != null && selectedCounts[index]! > 0) {
        selectedCounts[index] = selectedCounts[index]! - 1;
        if (selectedCounts[index]! <= 0) {
          selectedCounts.remove(index);
        }
      }
    });
  }

// Toggle function
  void toggleAdded(int index) {
    setState(() {
      if (selectedCounts.containsKey(index)) {
        selectedCounts.remove(index);
      } else {
        selectedCounts[index] = 1;
      }
    });
  }

  List<String> text = ["Dishant Sharma"];
  List<IconData> icons = [Icons.star];
  List<String> rating5 = ['5'];

  List<String> photos = [
    "assets/images/ac.jpeg",
    "assets/images/ac.jpeg",
    "assets/images/ac.jpeg",
    "assets/images/ac.jpeg",
  ];
  final List<ReviewItem> reviews = [
    ReviewItem(
      name: 'Pawan Kaushik',
      amount: 'pkr11,928',
      paintType: 'Royale Aspira paint',
      rating: 5.0,
      comment: 'Excellent work, my walls look refreshed, the professional did really good work.',
      // image: 'assets/images/ac.jpeg',
    ),
    ReviewItem(
      name: 'Chetan',
      amount: 'pkr5,480',
      paintType: 'Apcolite emulsion paint',
      rating: 4.5,
      comment: 'Completed the job on time and the best part he cleaned the area at the same time. Great service.',
      // image: 'assets/images/ac.jpeg',
    ),
    ReviewItem(
      name: 'Monica',
      amount: '₹7,499',
      paintType: 'Royale paint',
      rating: 5.0,
      comment: 'Result looks fantastic and completely transformed the space.',
      // image: 'assets/images/ac.jpeg',
    ),
  ];

  late VideoPlayerController _controller;
  Map<int, int> selectedCounts = {};

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  void _initVideoPlayer() {
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _toggleVideo() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  List<String> carouselImages = [
    'assets/images/women.png',
    'assets/images/men.png',
    'assets/images/air-conditioner.png',
  ];

  bool isPressed = false;
  int count = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // videoPlayerSection(height, width),
                TopBarwidget(carouselImages: carouselImages),
                _buildServiceDetails(height, width),
                howItWorks(context: context),
                SizedBox(height: 10.px),
                div(),
                SizedBox(height: 10.px),
                const ReviewsWidget(),
                // Add extra padding at bottom to account for the bottom sheet
                if (count > 0) const SizedBox(height: 80),
              ],
            ),
          ),
          if (count > 0)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: roundButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaintSummaryScreen(),
                        ),
                      );
                    },
                    title: 'Proceed',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget videoPlayerSection(double height, double width) {
    return Stack(
      children: [
        Center(
            child: _controller.value.isInitialized
                ? AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller))
                : Container()),
        Padding(
            padding: EdgeInsets.only(top: width * 0.2),
            child: Center(
                child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: FloatingActionButton(
                        backgroundColor: Colors.black54,
                        onPressed: _toggleVideo,
                        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                            color: AppColors.whiteTheme, size: 30.px))))),
      ],
    );
  }

  Widget _buildServiceDetails(double height, double width) {
    return Padding(
      padding: EdgeInsets.all(8.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          appText('At-home consultation', fontSize: 20.px, fontWeight: FontWeight.bold),
          Row(
            children: [
              Icon(Icons.star, size: 18.px),
              SizedBox(width: 6.px),
              appText('4.79', fontSize: 16.px, color: AppColors.hintGrey),
              SizedBox(width: 6.px),
              appText('30k reviews', fontSize: 16.px, color: AppColors.hintGrey),
              Spacer(),
              AddButton(
                count: count.toString(),
                onDecrement: () {
                  setState(() {
                    if (count > 0) {
                      count--;
                    }
                  });
                },
                onIncrement: () {
                  setState(() {
                    count++;
                  });
                },
              ),
              SizedBox(width: 10.px)
            ],
          ),
          SizedBox(height: 10.px),
          appText('Rs. 49', fontWeight: FontWeight.bold),
          SizedBox(height: 20.px),
          div(),
          SizedBox(height: 10.px),
          appText('Wall makeovers,\nmade simple', fontSize: 20, fontWeight: FontWeight.bold),
          //  SizedBox(height: 20.px),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  explorePaintingSheet(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 6.px),
                  height: 300.px,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.blueAccentColor,
                      image: const DecorationImage(image: AssetImage('assets/images/water.jpg'), fit: BoxFit.cover)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 55.px,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: AppColors.lightBlack,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.px), bottomRight: Radius.circular(10.px))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.px),
                        child: Row(
                          children: [
                            appText('Wall painting',
                                fontSize: 18.px, fontWeight: FontWeight.w400, color: AppColors.whiteTheme),
                            const Spacer(),
                            appText('Explore', fontSize: 16.px, color: AppColors.whiteTheme),
                            SizedBox(width: 10.px),
                            const Icon(Icons.chevron_right, color: AppColors.whiteTheme)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 10.px),
          div(),
          SizedBox(height: 10.px),
          appText("Please note", fontSize: 22, fontWeight: FontWeight.bold),
          SizedBox(height: height * 0.02),
          suggestinRow('1 year unconditional warranty'),
          SizedBox(height: height * 0.03),
          suggestinRow('Expert home makeover consultation'),
          SizedBox(height: height * 0.03),
          suggestinRow('End to end project management'),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              Icon(Icons.cancel, color: AppColors.hintGrey, size: 20.px),
              SizedBox(width: 20.px),
              appText('Pay after completion', fontSize: 16.px)
            ],
          ),
          SizedBox(height: 12.px),
          div(),
          SizedBox(height: 12.px),
          appText('Top-quality products,\n affordable prices', fontSize: 20.px, fontWeight: FontWeight.bold),
          SizedBox(height: 30.px),
          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/cs2.jpeg')),
          SizedBox(height: 10.px),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 200.px,
                  width: 180.px,
                  decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      image: const DecorationImage(image: AssetImage('assets/images/cs2.jpeg'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8.px))),
              Container(
                  height: 200.px,
                  width: 180.px,
                  decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      image: const DecorationImage(image: AssetImage('assets/images/cs2.jpeg'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8.px))),
            ],
          ),
          SizedBox(height: 12.px),
          div(),
          SizedBox(height: 12.px),
          appText('Our promises', fontSize: 20.px, fontWeight: FontWeight.bold),
          SizedBox(height: 10.px),
          SizedBox(
            height: 320.px,
            child: GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 14, mainAxisExtent: 130.px),
              itemBuilder: (context, index) {
                return Container(
                  width: 120.px,
                  decoration:
                      BoxDecoration(color: AppColors.grey300.withOpacity(0.3), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        images[index],
                        height: 55.px,
                      ),
                      SizedBox(height: 20.px),
                      appText(title[index], textAlign: TextAlign.center)
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.px),
          Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(3),
            },
            children: [
              commonRow(' ', 'UC power saver', 'Local servicing', isHeader: true),
              commonRow('Energy savings', 'High', 'Low'),
              commonRow('Savings report', '✔', '✖'),
              commonRow('Technique', 'Foam-jet technology', 'Manual'),
              commonRow('Service warranty', '30 days', '✖'),
            ],
          ),
          SizedBox(height: 30.px),
          appText('Our painting process', fontSize: 20.px, fontWeight: FontWeight.bold),
          SizedBox(height: 30.px),
          SizedBox(
            height: 300.px,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.px),
                  height: 200.px,
                  width: 150.px,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://artriva.com/media/k2/items/cache/c889234799e865bbe90cee71f6cd2e53_XL.jpg'),
                          fit: BoxFit.cover),
                      color: AppColors.grey300,
                      borderRadius: BorderRadius.circular(10.px)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        appText('Shoaib', color: AppColors.whiteTheme),
                        appText('Multan', color: AppColors.whiteTheme, fontSize: 8.px),
                        SizedBox(height: 10.px)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          div(),
        ],
      ),
    );
  }

  Widget countControls(double height, double width, int index, String s) {
    return selectedCounts.containsKey(index)
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.px),
                height: 50.px,
                width: 50.px,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/tiktok.jpg"),
                  fit: BoxFit.contain,
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => decrement(index),
                      child: countButton(height, width, Icons.remove, AppColors.redColor)),
                  SizedBox(width: width * 0.02),
                  Text(
                    "${selectedCounts[index]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.px),
                  ),
                  SizedBox(width: width * 0.02),
                  GestureDetector(
                    onTap: () => increment(index),
                    child: countButton(height, width, Icons.add, AppColors.greenColor),
                  ),
                ],
              ),
            ],
          )
        : addButton(height, width, index);
  }

  Widget addButton(double height, double width, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.px),
      child: InkWell(
          onTap: () {
            toggleAdded(index);
          },
          child: Container(
              height: height * 0.040,
              width: width * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.px),
                  border: Border.all(color: AppColors.lightGrey),
                  color: AppColors.whiteTheme),
              child:
                  Center(child: appText("Add", fontSize: 17.px, color: Colors.purple, fontWeight: FontWeight.bold)))),
    );
  }

  Widget countButton(double height, double width, IconData icon, Color color) {
    return Container(
      height: height * 0.030,
      width: width * 0.06,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Icon(icon, color: Colors.white),
    );
  }
}
