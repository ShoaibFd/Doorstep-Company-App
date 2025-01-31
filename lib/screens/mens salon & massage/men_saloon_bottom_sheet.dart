import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import 'salon_type_screen.dart';

class MenSaloonBottomSheet extends StatelessWidget {
  const MenSaloonBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * .24,
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 10.px),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.px),
              child: appText("Men's Salon & Massage",
                  fontSize: 20.px, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SalonTypeScreen()));
                    },
                    child: Container(
                        height: 66.px,
                        width: width * .42,
                        margin: EdgeInsets.only(top: 80.px),
                        decoration: BoxDecoration(
                          color: AppColors.grey300.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8.px),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(8.px),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                appText('Salon for Kids\n& Men'),
                                SizedBox(width: 6.px),
                                Image.asset('assets/images/men.png', height: 50.px)
                              ],
                            )))),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SalonTypeScreen()));
                  },
                  child: Container(
                    height: 66.px,
                    width: width * .42,
                    margin: EdgeInsets.only(top: 80.px),
                    decoration: BoxDecoration(
                      color: AppColors.grey300.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8.px),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          appText('Massage for\nMen'),
                          SizedBox(width: 6.px),
                          Image.asset('assets/images/men.png', height: 50.px)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                top: -60.px,
                right: 10.px,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: AppColors.whiteTheme,
                    child: Icon(Icons.close),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
