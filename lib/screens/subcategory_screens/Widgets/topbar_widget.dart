import 'package:doorstep_company_app/screens/subcategory_screens/Widgets/app_bar_search_button.dart';
import 'package:doorstep_company_app/screens/subcategory_screens/Widgets/app_bar_share_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../carousel+widget.dart';

class TopBarwidget extends StatelessWidget {
  const TopBarwidget({
    super.key,
    required this.carouselImages,
  });

  final List<String> carouselImages;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 30.px),
            child: CustomCarousel(height: height * .80, width: width, carouselImages: carouselImages)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: width * 0.080),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40.px,
                  width: 40.px,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteTheme,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Center(child: Icon(Icons.arrow_back)),
                ),
              ),
              const Spacer(),
              AppBarSearchButton(),
              SizedBox(width: 10.px),
              AppBarShareButton()
            ],
          ),
        ),
      ],
    );
  }
}
