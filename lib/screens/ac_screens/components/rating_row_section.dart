import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/bottom_sheet/review_bottom_sheet.dart';
import '../../../components/app_text.dart';
import '../../../components/dotted_line_widget.dart';

class RatingRowSection extends StatelessWidget {
  final String ratingText;
  final String bookings;
  const RatingRowSection({super.key, required this.ratingText, required this.bookings});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        InkWell(
            onTap: () {
              showReviewsBottomSheet(context);
            },
            child: Container(
                height: 26.px,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.px), color: Colors.green.shade900),
                child: Padding(
                    padding: EdgeInsets.all(4.px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 18.px),
                        SizedBox(width: 4.px),
                        appText(ratingText, color: Colors.white, fontWeight: FontWeight.bold),
                      ],
                    )))),
        SizedBox(width: 10.px),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [appText(bookings, color: AppColors.lightBlack), dottedLine(width: width * .26)],
        ),
      ],
    );
  }
}


//
  // Expanded(
  //                                   child: Column(
  //                                     crossAxisAlignment: CrossAxisAlignment.start,
  //                                     children: [
  //                                       appText('Cut & Clear:', fontWeight: FontWeight.bold, fontSize: 13),
  //                                       Text(
  //                                         'This is the description of product and detail is given in the next page.',
  //                                         softWrap: true,
  //                                         style: TextStyle(fontSize: 14),
  //                                       ),
  //                                       SizedBox(
  //                                         height: 4,
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ),