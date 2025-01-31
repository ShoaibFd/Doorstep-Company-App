import 'package:doorstep_company_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import '../screens/subcategory_screens/uc_cover_screen.dart';
import 'custom_container.dart';

class DcCoverButton extends StatelessWidget {
  const DcCoverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UcCoverScreen()));
        },
        height: 80.px,
        width: double.maxFinite,
        color: AppColors.grey300.withOpacity(0.6),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 6.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.download_done_rounded, color: AppColors.greenColor.shade800),
                  SizedBox(width: 10.px),
                  Text('DC Cover',
                      style: GoogleFonts.aclonica(
                          color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 16.px)),
                ],
              ),
              SizedBox(height: 6.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Warranty, rate card, claim process..', fontSize: 16.px),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ],
          ),
        ));
  }
}
