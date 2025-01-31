import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import 'full_home_painting.dart';
import 'rooms_wall_painting.dart';

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
                PaintingWidget(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FullHomeScreen()));
                    },
                    title: 'Full home painting',
                    subTitle: '1/2/3/4 BHK & above',
                    image: 'assets/images/fullroom.jpeg'),
                const Divider(),
                PaintingWidget(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomsWallPaintingScreen()));
                    },
                    title: 'Rooms/walls painting',
                    subTitle: '1/2/3 rooms or individual',
                    image: 'assets/images/fullroom.jpeg')
              ],
            )));
  }
}

class PaintingWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final String image;
  const PaintingWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
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
      ),
    );
  }
}
