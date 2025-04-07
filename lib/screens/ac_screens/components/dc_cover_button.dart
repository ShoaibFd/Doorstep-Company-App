import 'package:doorstep_company_app/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/custom_container.dart';
import '../../subcategory_screens/rate_card_screen.dart';

class DcCoverButton extends StatelessWidget {
  const DcCoverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RateCardScreen()));
        },
        height: 55.px,
        width: double.maxFinite,
        color: AppColors.grey300.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.download_done_rounded, color: AppColors.greenColor.shade800),
            Text('dc cover',
                style: GoogleFonts.aclonica(color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 20.px)),
            appText('Standard rate Card', fontSize: 18.px),
            const Icon(Icons.chevron_right)
          ],
        ));
  }
}
