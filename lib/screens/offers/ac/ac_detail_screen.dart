import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constants/colors.dart';
import '../../../widgets/bottom_sheet/review_bottom_sheet.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/divider.dart';
import '../../chat/chat_screen.dart';
import '../../cleaning & pest control/bath_cleaning_bottom_sheet.dart';
import '../../home_screen/widgets/carousel_slider.dart';
import '../../order_place_screen/order_screen.dart';
import '../../painting_wall_screen/Widgets/frequently_asked_questions_widget.dart';
import 'custom_row.dart';
import 'return_and_refund_screen.dart';

class AcDetailScreen extends StatefulWidget {
  const AcDetailScreen({super.key});

  @override
  State<AcDetailScreen> createState() => _AcDetailScreenState();
}

class _AcDetailScreenState extends State<AcDetailScreen> {
  bool isChecked = true;
  bool isLiked = false;
  bool isAdded = false;
  final String urlToShare = 'https://flutter.dev';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        title: appText('Product Details', fontSize: 20, fontWeight: FontWeight.bold),
      ),
      floatingActionButton: Transform.translate(
          offset: const Offset(0, -30),
          child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: AppColors.blackColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
              },
              child: Badge.count(count: 1, child: const Icon(Icons.shopping_cart, color: AppColors.whiteTheme)))),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Or any predefined location

      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText('Samsung Invertors',
                              fontWeight: FontWeight.bold, fontSize: 21.px, color: AppColors.redColor),
                          appText('NEW/USED', fontSize: 16.px, color: AppColors.darkGreen, fontWeight: FontWeight.bold)
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: width * 0.01),
                          appText("PKR 115,000", decoration: TextDecoration.lineThrough),
                          const SizedBox(width: 10),
                          appText("PKR 108,000", fontWeight: FontWeight.w700),
                          SizedBox(width: 10.px),
                        ],
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        children: [
                          appText("Dawalance Atomos Cool Inverter 15/ 1 Ton/",
                              fontWeight: FontWeight.w600, fontSize: 15.px),
                        ],
                      ),
                      appText("Split AC/ 12000 BTU / 12 Years Compressor",
                          fontWeight: FontWeight.bold, fontSize: 15.px),
                      appText("Warranty", fontWeight: FontWeight.bold, fontSize: 15.px),
                      SizedBox(height: 10.px),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                showReviewsBottomSheet(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.star, color: AppColors.orangeColor, size: 20.px),
                                  appText("4.5 (42)"),
                                ],
                              )),
                          SizedBox(width: width * 0.02),
                          appText("200 sold", fontWeight: FontWeight.w400, fontSize: 16.px),
                          const Spacer(),
                          CustomContainer(
                            borderRadius: 4.px,
                            color: AppColors.greenColor,
                            child: Padding(
                              padding: EdgeInsets.all(2.px),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/delivery.png', color: AppColors.whiteTheme, height: 26.px),
                                  SizedBox(width: 4.px),
                                  appText('Rs. 120', color: AppColors.whiteTheme, fontWeight: FontWeight.bold)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          CustomContainer(
                            borderRadius: 4,
                            color: AppColors.redColor,
                            child: Padding(
                              padding: EdgeInsets.all(6.px),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  appText('10% OFF', color: AppColors.whiteTheme, fontWeight: FontWeight.bold)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.px),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: AppColors.blueShade,
                            value: isChecked,
                            onChanged: (bool? value) {},
                          ),
                          appText("100% Authentic", fontWeight: FontWeight.w400, fontSize: 15.px.px),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                              },
                              icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
                                  color: isLiked ? AppColors.redColor : AppColors.blackColor)),
                          SizedBox(width: width * 0.02),
                          IconButton(
                              onPressed: () {
                                Share.share('Check out the Flutter website: $urlToShare');
                              },
                              icon: const Icon(
                                Icons.share,
                                color: AppColors.blueColor,
                              ))
                        ],
                      ),
                      SizedBox(height: 6.px),
                      const Divider(),
                      SizedBox(height: 10.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText('Shipping time & Return policy', fontSize: 18, fontWeight: FontWeight.bold),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const ReturnAndRefundScreen()));
                            },
                            child: appText('Read More', color: AppColors.blueShade),
                          )
                        ],
                      ),
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText('Estimated delivery time', fontSize: 16.px, fontWeight: FontWeight.w400),
                          appText('3 to 5 Days')
                        ],
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText('Return Policy', fontSize: 16.px, fontWeight: FontWeight.w400),
                          appText('Contact our customer\nsupport team for help with\nyour order')
                        ],
                      ),
                      SizedBox(height: 10.px),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: appText("Product Details", fontWeight: FontWeight.w700, fontSize: 18)),
                          appText("Highlights",
                              color: AppColors.darkGreen, fontSize: 17.px, fontWeight: FontWeight.bold),
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
                      appText("Description", fontWeight: FontWeight.bold, fontSize: 18),
                      SizedBox(height: 10.px),
                      suggestinRow('Long lasting and reliable'),
                      SizedBox(height: 6.px),
                      suggestinRow('Long lasting and reliable'),
                      SizedBox(height: 10.px),
                      const CarouselSliderWidget(images: [
                        'assets/images/air-conditioner.png',
                        'assets/images/air-conditioner.png',
                        'assets/images/air-conditioner.png',
                        'assets/images/air-conditioner.png',
                      ]),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 10.px),
                      appText('Top Selling', fontSize: 20, fontWeight: FontWeight.bold),
                      SizedBox(height: 10.px),
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
                                          context, MaterialPageRoute(builder: (context) => const AcDetailScreen()));
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
                                                  spreadRadius: 2)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.network('https://pngimg.com/d/air_conditioner_PNG24.png',
                                                height: 80.px),
                                          ],
                                        )),
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
                          )),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      const FrequentlyAskedQuestionsWidget(),
                      const Divider(thickness: 4),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
          height: 80.px,
          width: double.maxFinite,
          decoration: BoxDecoration(color: AppColors.whiteTheme, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, -2),
            ),
          ]),
          child: Padding(
              padding: EdgeInsets.all(8.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
                      },
                      child: Container(
                          height: 40.px,
                          width: 40.px,
                          decoration: BoxDecoration(
                              color: AppColors.lowPurple.withOpacity(0.2),
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.lowPurple, width: 2)),
                          child: Center(
                              child:
                                  Image.asset('assets/images/chat.png', height: 20.px, color: AppColors.lowPurple)))),
                  CustomContainer(
                      onTap: () {
                        if (!isAdded) {
                          setState(() {
                            isAdded = true;
                          });
                          showSuccessSnackbar(context, 'Item added to cart successfully!');
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderPage(),
                            ),
                          );
                        }
                      },
                      height: 40.px,
                      width: 130.px,
                      color: AppColors.transparentColor,
                      borderColor: AppColors.blueShade,
                      borderRadius: 8.px,
                      child:
                          Center(child: appText(isAdded ? "View cart" : 'Add to cart', fontWeight: FontWeight.bold))),
                  CustomContainer(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
                      },
                      height: 40.px,
                      width: 130.px,
                      color: AppColors.blueColor,
                      borderRadius: 8.px,
                      child:
                          Center(child: appText('Buy now', color: AppColors.whiteTheme, fontWeight: FontWeight.bold))),
                ],
              ))),
    );
  }
}
