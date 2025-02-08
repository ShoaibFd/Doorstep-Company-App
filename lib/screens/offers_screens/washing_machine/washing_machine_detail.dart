import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/bottom_sheet/review_bottom_sheet.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/custom_text.dart';
import '../../../components/divider.dart';
import '../../home_screen/components/carousel_slider.dart';
import '../ac/custom_app_bar.dart';
import '../ac/custom_row.dart';
import '../ac/delivery_bottom_sheet.dart';
import '../ac/images.dart';

class WashingMachineDetailScreen extends StatefulWidget {
  // double height ;
  // double width ;
  const WashingMachineDetailScreen({super.key});

  @override
  State<WashingMachineDetailScreen> createState() => _WashingMachineDetailScreenState();
}

class _WashingMachineDetailScreenState extends State<WashingMachineDetailScreen> {
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
  bool ischecked = false;
  bool _isTextFieldVisible = false;
  bool _isTextFieldVisible2 = false;
  bool _isTextFieldVisible3 = false;
  bool _isTextFieldVisible4 = false;
  bool _isTextFieldVisible5 = false;
  bool _isTextFieldVisible6 = false;

  void _toggleTextField() {
    setState(() {
      _isTextFieldVisible = !_isTextFieldVisible;
    });
  }

  void _toggleTextField2() {
    setState(() {
      _isTextFieldVisible2 = !_isTextFieldVisible2;
    });
  }

  void _toggleTextField3() {
    setState(() {
      _isTextFieldVisible3 = !_isTextFieldVisible3;
    });
  }

  void _toggleTextField4() {
    setState(() {
      _isTextFieldVisible4 = !_isTextFieldVisible4;
    });
  }

  void _toggleTextField5() {
    setState(() {
      _isTextFieldVisible5 = !_isTextFieldVisible5;
    });
  }

  void _toggleTextField6() {
    setState(() {
      _isTextFieldVisible6 = !_isTextFieldVisible6;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar(context),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.px),
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
                            SizedBox(height: height * 0.01),
                            appText('Washing Machine',
                                fontWeight: FontWeight.bold, fontSize: 21.px, color: AppColors.redColor),
                            appText('AC', fontWeight: FontWeight.w500),
                            Row(
                              children: [
                                SizedBox(width: width * 0.01),
                                appText("PKR 108,000", fontWeight: FontWeight.w700),
                                SizedBox(width: width * 0.01),
                                appText("PKR 115,000",
                                    color: Colors.grey.shade400, decoration: TextDecoration.lineThrough),
                                SizedBox(width: width * 0.1),
                                InkWell(
                                    onTap: () {},
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.px), color: AppColors.lowPurple),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.px),
                                          child: Center(child: appText("15% Discount", color: AppColors.whiteTheme)),
                                        ))),
                              ],
                            ),
                            SizedBox(height: 12.px),
                            Row(
                              children: [
                                const Text('Hall',
                                    style:
                                        TextStyle(color: AppColors.whiteTheme, backgroundColor: AppColors.lowPurple)),
                                SizedBox(width: width * 0.01),
                                appText("Dawalance Atomos Cool Inverter 15/ 1 Ton/",
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ],
                            ),
                            appText("Split AC/ 12000 BTU / 12 Years Compressor",
                                fontWeight: FontWeight.w500, fontSize: 15),
                            SizedBox(height: 10.px),
                            appText("Warranty", fontWeight: FontWeight.w500, fontSize: 15),
                            Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: ischecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          ischecked = value ?? false;
                                        });
                                      },
                                    ),
                                    appText("100% Authentic", fontWeight: FontWeight.w400, fontSize: 15),
                                    const Spacer(),
                                    Icon(Icons.favorite, color: Colors.grey.shade600),
                                    SizedBox(width: width * 0.02),
                                    Icon(Icons.share, color: Colors.grey.shade600),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(left: 14.0, bottom: 8.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          showReviewsBottomSheet(context);
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: AppColors.lightGreen,
                                                border: Border.all(color: AppColors.grey300)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  const Icon(Icons.star, color: Colors.white, size: 17),
                                                  appText("4.5(42)", color: Colors.white),
                                                ],
                                              )),
                                            ))),
                                    SizedBox(width: width * 0.02),
                                    appText("200 sold", fontWeight: FontWeight.w400),
                                  ],
                                )),
                            Divider(color: Colors.grey.shade200),
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
                            Divider(color: Colors.grey.shade200),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: appText("Product Details", fontWeight: FontWeight.w700, fontSize: 18)),
                                appText("Highlights", color: AppColors.greyColor, fontSize: 17),
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
                            SizedBox(height: 20.px),
                            appText("Description", fontWeight: FontWeight.bold, fontSize: 18),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const ImagesScreen()));
                                },
                                child: Container(
                                    height: height * 0.3,
                                    width: width * 0.8,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/air-conditioner.png"), fit: BoxFit.cover)),
                                    child: appText("1/16", fontSize: 16.px, fontWeight: FontWeight.w400))),
                            SizedBox(height: 10.px),
                            div(),
                            SizedBox(height: 10.px),
                            appText('Frequently asked questions', fontSize: 20.px, fontWeight: FontWeight.bold),
                            ListTile(
                                title: appText('Will the professional bring the tool needed\nfor the service',
                                    fontWeight: FontWeight.w400),
                                trailing: Icon(_isTextFieldVisible ? Icons.keyboard_arrow_up : Icons.chevron_right),
                                onTap: _toggleTextField),
                            if (_isTextFieldVisible) appText('Yes, the professional will bring all necessary tools.'),
                            const Divider(),
                            ListTile(
                                title: Text('Will the professional bring the tool needed\nfor the service',
                                    style: TextStyle(fontSize: 14.px, fontWeight: FontWeight.w400)),
                                trailing: Icon(_isTextFieldVisible2 ? Icons.keyboard_arrow_up : Icons.chevron_right),
                                onTap: _toggleTextField2),
                            if (_isTextFieldVisible2) appText('Yes, the professional will bring all necessary tools.'),
                            const Divider(),
                            ListTile(
                                title: appText('Will the professional bring the tool needed\nfor the service',
                                    fontWeight: FontWeight.w400),
                                trailing: Icon(_isTextFieldVisible3 ? Icons.keyboard_arrow_up : Icons.chevron_right),
                                onTap: _toggleTextField3),
                            if (_isTextFieldVisible3) appText('Yes, the professional will bring all necessary tools.'),
                            const Divider(),
                            ListTile(
                                title: appText('Will the professional bring the tool needed\nfor the service',
                                    fontWeight: FontWeight.w400),
                                trailing: Icon(_isTextFieldVisible4 ? Icons.keyboard_arrow_up : Icons.chevron_right),
                                onTap: _toggleTextField4),
                            if (_isTextFieldVisible4)
                              Padding(
                                  padding: EdgeInsets.all(8.px),
                                  child: appText('Yes, the professional will bring all necessary tools.')),
                            const Divider(),
                            ListTile(
                                title: appText('Will the professional bring the tool neededfor the service',
                                    fontSize: 15.px, fontWeight: FontWeight.w400),
                                trailing: Icon(_isTextFieldVisible5 ? Icons.keyboard_arrow_up : Icons.chevron_right),
                                onTap: _toggleTextField5),
                            if (_isTextFieldVisible5) appText('Yes, the professional will bring all necessary tools.'),
                            const Divider(),
                            ListTile(
                                title: appText('Will the professional bring the tool needed\nfor the service',
                                    fontWeight: FontWeight.w400),
                                trailing: Icon(_isTextFieldVisible6 ? Icons.keyboard_arrow_up : Icons.chevron_right),
                                onTap: _toggleTextField6),
                            if (_isTextFieldVisible6) appText('Yes, the professional will bring all necessary tools.'),
                            Divider(thickness: 4.px),
                          ],
                        )))),
            Row(
              children: [
                Container(
                    width: width * 0.19,
                    height: height * 0.08,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(1), color: AppColors.whiteTheme),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.store_outlined, color: Colors.orangeAccent),
                        appText("Store"),
                      ],
                    )),
                Container(
                    width: width * 0.19,
                    height: height * 0.08,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(1), color: AppColors.whiteTheme),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.chat_outlined, color: Colors.orangeAccent),
                        appText("Chat"),
                      ],
                    )),
                Container(
                    width: width * 0.31,
                    height: height * 0.08,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(1), color: AppColors.blueColor),
                    child: Center(child: appText("Buy now", color: Colors.white))),
                GestureDetector(
                    onTap: () {
                      showSuccessSnackbar(context, 'Added to cart successfully!');
                    },
                    child: Container(
                        width: width * 0.31,
                        height: height * 0.08,
                        color: AppColors.orangeAccentColor,
                        child: Center(child: appText("Add to Cart", color: Colors.white))))
              ],
            )
          ],
        ));
  }
}
