import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/bottom_sheet/30_day_warranty.dart';
import '../../../components/bottom_sheet/dc_verified_quotes.dart';
import '../../../components/bottom_sheet/no_question_asked_bottom_sheet.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import '../../subcategory_screens/dc_container.dart';

class AcDcCoverSection extends StatelessWidget {
  const AcDcCoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.download_done_rounded, color: AppColors.greenColor.shade800),
            SizedBox(width: 8.px),
            Text('dc cover',
                style: GoogleFonts.aclonica(color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 28)),
          ],
        ),
        SizedBox(height: 10.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DcContainer(
              image: 'assets/images/warranty.png',
              title: '30-day\nwarranty',
              onTap: () => showWarrantyBottomSheet(context),
            ),
            DcContainer(
                image: 'assets/images/refund.png',
                title: 'No Questions\nasked claimed',
                onTap: () => showNoQuestionAskedClaimedSheet(context)),
            DcContainer(
                image: 'assets/images/warranty.png',
                title: 'DC verified\nquotes',
                onTap: () => showDcVerifiedQuotes(context)),
          ],
        ),
        SizedBox(height: 20.px),
        CustomContainer(
            onTap: () {
              showNoQuestionAskedClaimedSheet(context);
            },
            color: AppColors.grey300,
            height: 55.px,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                appText('Learn about claim process', fontSize: 18.px),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.px,
                )
              ],
            )),
      ],
    );
  }
}
