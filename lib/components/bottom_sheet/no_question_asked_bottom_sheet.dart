import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../custom_text.dart';

void showNoQuestionAskedClaimedSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
    ),
    builder: (BuildContext context) {
      double height = MediaQuery.sizeOf(context).height;
      double width = MediaQuery.sizeOf(context).width;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height * 0.9,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.whiteTheme,
            ),
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
                  appText('End-to-end service protection', fontSize: 16.px),
                  SizedBox(height: height * 0.030),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.px),
                      height: height * 0.65,
                      width: width,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(18), color: const Color(0xffe9e1f5)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.px),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.040),
                            appText(
                              'Expert verified repair quotes',
                              fontSize: 22.px,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 20.px),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.list_alt),
                                    const SizedBox(width: 20),
                                    appText(
                                      'We will verify the repair quote\nshared by the professionals',
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.030),
                            Row(
                              children: [
                                const Icon(Icons.videocam_rounded),
                                const SizedBox(width: 20),
                                appText(
                                  'If you are still unsure, you can\nask an expert for a second opinion ',
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.030),
                            const Spacer(),
                            const Image(image: AssetImage('assets/images/2nd.jpeg')),
                          ],
                        ),
                      ),
                    ),
                  ),
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
      );
    },
  );
}
