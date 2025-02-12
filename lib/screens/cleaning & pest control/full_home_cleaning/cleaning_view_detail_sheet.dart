import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import '../../../components/divider.dart';
import '../../../constants/colors.dart';
import '../../painting_wall_screen/components/reviews_widget.dart';
import '../../painting_wall_screen/components/share_btn.dart';
import '../../salon_for_women/spa_for_women/spa_view_detail_sheet.dart';

class HomeCleaningViewDetailSheet extends StatefulWidget {
  const HomeCleaningViewDetailSheet({super.key});

  @override
  _HomeCleaningViewDetailSheetState createState() => _HomeCleaningViewDetailSheetState();
}

class _HomeCleaningViewDetailSheetState extends State<HomeCleaningViewDetailSheet> {
  int itemCount = 0;
  final String urlToShare = 'https://flutter.dev';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * .9,
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.px),
                  appText('2 BHK Apartment Cleaning', fontSize: 24.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 16.px),
                  Row(
                    children: [
                      Icon(Icons.star, size: 18.px),
                      appText('4.80 (16k reviews)', color: AppColors.hintGrey, fontSize: 16.px),
                    ],
                  ),
                  SizedBox(height: 30.px),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Divider(color: AppColors.grey300),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30.px),
                                  appText('Classic', fontSize: 20.px, fontWeight: FontWeight.bold),
                                  SizedBox(height: 10.px),
                                  Row(
                                    spacing: 10.px,
                                    children: [
                                      Icon(Icons.star, size: 20.px),
                                      appText('4.80 (16k reviews)', color: AppColors.hintGrey, fontSize: 16.px),
                                    ],
                                  ),
                                  SizedBox(height: 10.px),
                                  Row(
                                    children: [
                                      appText('Rs. 5099', fontSize: 16.px, fontWeight: FontWeight.bold),
                                      SizedBox(width: 14.px),
                                      Icon(Icons.circle, size: 6.px, color: AppColors.hintGrey),
                                      appText('5h 20 mins', color: AppColors.hintGrey, fontSize: 16.px)
                                    ],
                                  ),
                                  SizedBox(height: 8.px),
                                  SizedBox(
                                    width: 200.px,
                                    child: DottedLine(
                                      dashColor: AppColors.grey300,
                                    ),
                                  ),
                                  SizedBox(height: 10.px),
                                  bestRow(text: 'Floor cleaning with\nscrub machine'),
                                  bestRow(text: 'Include cleaning chimney & \nutensil removal'),
                                  SizedBox(height: 30.px),
                                  Divider(color: AppColors.grey300),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Container(
                                    height: 100.px,
                                    width: 110.px,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey300,
                                      borderRadius: BorderRadius.circular(10.px),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://remaxinterlake.ca/wp-content/uploads/2023/12/kathy-kuo-guest-room.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.px),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (itemCount == 0) {
                                          itemCount = 1;
                                        }
                                      });
                                    },
                                    child: itemCount > 0
                                        ? Container(
                                            height: 34.px,
                                            width: 90.px,
                                            margin: EdgeInsets.only(bottom: 20.px),
                                            decoration: BoxDecoration(
                                                color: AppColors.whiteTheme,
                                                borderRadius: BorderRadius.circular(8.px),
                                                border: Border.all(color: AppColors.lightGrey)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      itemCount--;
                                                      if (itemCount < 0) {
                                                        itemCount = 0;
                                                      }
                                                    });
                                                  },
                                                  child: Icon(Icons.remove, size: 16.px, color: AppColors.lowPurple),
                                                ),
                                                appText(itemCount.toString(),
                                                    color: AppColors.lowPurple,
                                                    fontSize: 16.px,
                                                    fontWeight: FontWeight.bold),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      itemCount++;
                                                    });
                                                  },
                                                  child: Icon(Icons.add, size: 16.px, color: AppColors.lowPurple),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            height: 34.px,
                                            width: 90.px,
                                            margin: EdgeInsets.only(bottom: 20.px),
                                            decoration: BoxDecoration(
                                                color: AppColors.whiteTheme,
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: AppColors.lightGrey)),
                                            child: Center(
                                                child: appText('Add',
                                                    fontWeight: FontWeight.bold, color: AppColors.lowPurple))),
                                  ),
                                  SizedBox(height: 30.px),
                                  const Divider()
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 10.px),
                  appText('Please note', fontSize: 24, fontWeight: FontWeight.bold),
                  SizedBox(height: 20.px),
                  Row(
                    spacing: 20.px,
                    children: [
                      Icon(Icons.info, color: AppColors.hintGrey),
                      appText(
                          'Feel free to inform your therapist about\nspecific concerns or pressure preferences\nduring the massage',
                          fontSize: 16)
                    ],
                  ),
                  SizedBox(height: 10.px),
                  div(),
                  SizedBox(height: 10.px),
                  appText('Types of cleaning services', fontSize: 24, fontWeight: FontWeight.bold),
                  const SizedBox(height: 10),
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
                  SizedBox(height: 10.px),
                  div(),
                  appText('What we clean', fontSize: 24, fontWeight: FontWeight.bold),
                  SizedBox(height: 10.px),
                  appText(
                      'Inclusion for classic are listed below.\nRefer to the table above for Premium/Platinum or add-ons.',
                      color: AppColors.hintGrey,
                      fontSize: 15.px),
                  SizedBox(height: 10.px),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 20.px),
                          div(),
                          SizedBox(height: 20.px),
                          CustomContainer(
                              width: width,
                              color: AppColors.grey300,
                              borderRadius: 8.px,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomContainer(
                                          height: 100.px,
                                          width: 120.px,
                                          borderRadius: 0,
                                          color: AppColors.transparentColor,
                                          child: Center(
                                            child: appText('Living & \nbedroom',
                                                fontSize: 24, fontWeight: FontWeight.bold),
                                          )),
                                      CustomContainer(
                                          height: 130.px,
                                          width: 230.px,
                                          borderRadius: 0,
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://media.istockphoto.com/id/1188452511/photo/stylish-scandinavian-living-room-with-design-mint-sofa-furnitures-mock-up-poster-map-plants.jpg?s=612x612&w=0&k=20&c=yK0GV6EuqXc09xBFMcNdd7ZjFephsGgSTjPBsvvv630='),
                                              fit: BoxFit.cover),
                                          color: AppColors.transparentColor,
                                          child: const SizedBox())
                                    ],
                                  ),
                                  ListView.builder(
                                    itemCount: 3,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.px,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 20.px),
                                            CustomContainer(
                                                width: 100.px,
                                                color: AppColors.whiteTheme,
                                                borderRadius: 12.px,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.px),
                                                  child: Center(
                                                    child: appText('Dry dusting', fontWeight: FontWeight.bold),
                                                  ),
                                                )),
                                            SizedBox(height: 20.px),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                dustingWidget(
                                                    title: 'Ceiling',
                                                    imgUrl:
                                                        'https://cdn-icons-png.freepik.com/256/15848/15848371.png?semt=ais_hybrid'),
                                                dustingWidget(
                                                    title: 'Walls',
                                                    imgUrl:
                                                        'https://cdn-icons-png.freepik.com/256/15848/15848371.png?semt=ais_hybrid'),
                                                dustingWidget(
                                                    title: 'Corners',
                                                    imgUrl:
                                                        'https://cdn-icons-png.freepik.com/256/15848/15848371.png?semt=ais_hybrid'),
                                                dustingWidget(
                                                    title: 'Fixtures',
                                                    imgUrl:
                                                        'https://cdn-icons-png.freepik.com/256/15848/15848371.png?semt=ais_hybrid'),
                                              ],
                                            ),
                                            SizedBox(height: 16.px)
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              )),
                          SizedBox(height: 12.px)
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  appText("Includes", fontSize: 22, fontWeight: FontWeight.bold),
                  SizedBox(height: height * 0.02),
                  suggestinRow('1 carpet & a 5-seater sofa cleaning'),
                  SizedBox(height: height * 0.02),
                  suggestinRow('6 kitchen cleaning cabinet'),
                  SizedBox(height: height * 0.02),
                  suggestinRow('2 bathroom & 2 balcony cleaning'),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  appText("Excludes", fontSize: 22, fontWeight: FontWeight.bold),
                  SizedBox(height: 20.px),
                  avoidRow('Emptying & cleaning of cupboards interior'),
                  SizedBox(height: 10.px),
                  avoidRow('Glue & paint stain removal'),
                  SizedBox(height: 10.px),
                  avoidRow('Terrace and inaccessible area cleaning'),
                  SizedBox(height: 10.px),
                  avoidRow('Restoration, leakage fixes, painting or\ntouch-ups'),
                  SizedBox(height: 10.px),
                  avoidRow('Wet wiping of walls or ceiling'),
                  SizedBox(height: 10.px),
                  avoidRow('Chandelier, false ceiling cleaning, etc'),
                  SizedBox(height: 20.px),
                  div(),
                  SizedBox(height: 20.px),
                  appText("What we need from you", fontSize: 22, fontWeight: FontWeight.bold),
                  SizedBox(height: height * 0.02),
                  suggestinRow('Hot & cold water in two buckets'),
                  SizedBox(height: height * 0.02),
                  suggestinRow('Connnection to a plug point'),
                  SizedBox(height: height * 0.02),
                  div(),
                  SizedBox(height: 10.px),
                  Center(
                    child: appText('Share this service with your loved ones', fontSize: 16, color: AppColors.hintGrey),
                  ),
                  SizedBox(height: 6.px),
                  shareBtn(context, () {
                    Share.share('Check out the Flutter website: $urlToShare');
                  }),
                  SizedBox(height: 10.px),
                  div(),
                  SizedBox(height: 30.px),
                  const ReviewsWidget()
                ],
              ),
            ),
          ),
          Positioned(
            top: -50.px,
            right: 16.px,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                backgroundColor: AppColors.whiteTheme,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showHomeCleaningDetailSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    isDismissible: true,
    isScrollControlled: true,
    builder: (context) => const HomeCleaningViewDetailSheet(),
  );
}

// dustinWidget
Widget dustingWidget({required String title, required String imgUrl}) {
  return Column(
    spacing: 10.px,
    children: [Image.network(imgUrl, height: 40.px), appText(title, fontWeight: FontWeight.bold)],
  );
}
