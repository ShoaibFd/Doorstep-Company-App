import 'package:doorstep_company_app/screens/painting_wall_screen/rooms_wall_painting.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/app_text.dart';
import 'full_home_painting.dart';

class PaintingWaterproofingScreen extends StatefulWidget {
  const PaintingWaterproofingScreen({super.key});

  @override
  State<PaintingWaterproofingScreen> createState() => _PaintingWaterproofingScreenState();
}

class _PaintingWaterproofingScreenState extends State<PaintingWaterproofingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appText('Painting & Waterproofing', fontSize: 20.px, fontWeight: FontWeight.w400),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: 20))],
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                appText('Painting & Waterproofing', fontSize: 22, fontWeight: FontWeight.bold),
                SizedBox(height: 10.px),
                appText('Select your scope', color: AppColors.lightBlack, fontSize: 18),
                SizedBox(height: 20.px),
                const Divider(),
                SizedBox(height: 30.px),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FullHomeScreen()));
                  },
                  child: Container(
                    child: PaintingWidget(
                        title: 'Full home painting',
                        subTitle: '1/2/3/4 BHK & above',
                        image: 'assets/images/fullroom.jpeg'),
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomsWallPaintingScreen()));
                  },
                  child: Container(
                    child: PaintingWidget(
                        title: 'Rooms/walls painting',
                        subTitle: '1/2/3 rooms or individual',
                        image: 'assets/images/fullroom.jpeg'),
                  ),
                )
              ],
            )));
  }
}

class PaintingWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const PaintingWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10.px),
            height: 180.px,
            width: 130.px,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                color: AppColors.grey300,
                borderRadius: BorderRadius.circular(8.px))),
        SizedBox(width: 10.px),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                appText(title, fontSize: 18.px, fontWeight: FontWeight.bold),
                SizedBox(width: 10.px),
                appText(subTitle, color: AppColors.lightBlack, textOverflow: TextOverflow.fade)
              ],
            ),
            SizedBox(width: 30.px),
            const Icon(Icons.chevron_right)
          ],
        ),
      ],
    );
  }
}
