import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/app_text.dart';
import '../../../theme/colors.dart';

class FAQsComponent extends StatelessWidget {
  final String? question;
  final String? answer;
  const FAQsComponent({super.key, this.question, this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            childrenPadding: EdgeInsets.symmetric(horizontal: 14.w),
            title: appText(question ?? '', fontSize: 14.sp, fontWeight: FontWeight.bold),
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: appText(answer ?? "", color: AppColors.lightBlack),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
