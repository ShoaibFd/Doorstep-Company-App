import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../app_text.dart';

void showWarrantyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
              padding: EdgeInsets.all(8.px),
              child: Container(
                  height: height * 0.9,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.whiteTheme,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(18.px), topRight: Radius.circular(18.px))),
                  child: Padding(
                      padding: EdgeInsets.all(8.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.010),
                          Row(
                            children: [
                              Icon(Icons.download_done_rounded, color: AppColors.darkGreen, size: 40.px),
                              Text('DC Cover',
                                  style: GoogleFonts.aclonica(
                                      color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 30.px)),
                            ],
                          ),
                          appText('End-to-end service protection', fontSize: 16.px),
                          SizedBox(height: height * 0.030),
                          Center(
                              child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10.px),
                                  height: height * 0.65,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.px), color: Colors.green.shade50),
                                  child: Padding(
                                      padding: EdgeInsets.all(8.px),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: height * 0.040),
                                          appText('30 day warranty on repairs',
                                              textAlign: TextAlign.center,
                                              fontSize: 22.px,
                                              fontWeight: FontWeight.bold),
                                          SizedBox(height: 20.px),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/wrench.png', height: 30.px),
                                                  SizedBox(width: 20.px),
                                                  appText(
                                                    'Free repair if the same issue arises',
                                                    fontSize: 16.px,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: height * 0.030),
                                          Row(
                                            children: [
                                              const Icon(Icons.electric_bolt_outlined),
                                              const SizedBox(width: 20),
                                              appText('One click hassle-free claims', fontSize: 16),
                                            ],
                                          ),
                                          SizedBox(height: height * 0.030),
                                          Row(
                                            children: [
                                              Image.asset('assets/images/broken.png', height: 30.px),
                                              const SizedBox(width: 20),
                                              appText(
                                                'Up to PKR 10,000 cover if anything\nis damaged during the repair',
                                                fontSize: 16,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          const Image(
                                              image: AssetImage(
                                                  'assets/images/WhatsApp Image 2024-10-08 at 11.26.45 PM.jpeg'))
                                        ],
                                      ))))
                        ],
                      )))),
          Positioned(
              top: -50,
              right: 16,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.close))))
        ],
      );
    },
  );
}
