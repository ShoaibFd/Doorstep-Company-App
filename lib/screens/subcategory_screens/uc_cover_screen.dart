import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/bottom_sheet/30_day_warranty.dart';
import '../../widgets/bottom_sheet/claim_order.dart';
import '../../widgets/bottom_sheet/dc_verified_quotes.dart';
import '../../widgets/bottom_sheet/no_question_asked_bottom_sheet.dart';
import '../../widgets/custom_text.dart';
import 'dc_container.dart';

class UcCoverScreen extends StatefulWidget {
  const UcCoverScreen({super.key});

  @override
  State<UcCoverScreen> createState() => _UcCoverScreenState();
}

class _UcCoverScreenState extends State<UcCoverScreen> {
  void _showBottomSheet(Widget sheet) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => sheet,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('DC Covers', fontSize: 18, fontWeight: FontWeight.w400)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => showClaimOrderModal(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                height: 55,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.lightGrey),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appText('Learn About Claim Process', fontSize: 16, fontWeight: FontWeight.w500),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_right_alt, size: 28),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
