import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../screens/subcategory_screens/rate_card_screen.dart';
import '../app_text.dart';

void showDcVerifiedQuotes(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.px))),
    builder: (BuildContext context) {
      double height = MediaQuery.sizeOf(context).height;
      double width = MediaQuery.sizeOf(context).width;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RateCardScreen()));
            },
            child: Container(
              height: height * 0.9,
              width: width,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.px),
                    Row(
                      children: [
                        Icon(Icons.download_done_rounded, color: AppColors.greenColor.shade800, size: 40),
                        Text('DC Cover',
                            style: GoogleFonts.aclonica(
                                color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 30.px)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: appText('End-to-end service protection', fontSize: 15),
                    ),
                    SizedBox(height: height * 0.030),
                    Center(
                      child: Container(
                        height: height * 0.65,
                        width: width,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(18), color: const Color(0xfff4f2f7)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height * 0.040),
                              appText(
                                'Fixed rate card',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(height: 40),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.list_alt),
                                      const SizedBox(width: 20),
                                      appText(
                                        'All our prices are decided on the\nbasis of market standards',
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.030),
                              Row(
                                children: [
                                  Image.asset('assets/images/support.png', height: height * 0.030),
                                  const SizedBox(width: 20),
                                  appText(
                                    'If you are charged different\nfrom the rate card, you can reach\nout to our help center ',
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.030),
                              Center(
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => const RateCardScreen()));
                                    },
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'View Rate Card',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.darkGreen,
                                                decoration: TextDecoration.underline,
                                                decorationColor: AppColors.darkGreen)))),
                              ),
                              const Spacer(),
                              Container(
                                height: height * 0.2,
                                width: width * 0.8,
                                decoration: const BoxDecoration(
                                  color: Color(0xffe9e1f5),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/3rd.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
      );
    },
  );
}
