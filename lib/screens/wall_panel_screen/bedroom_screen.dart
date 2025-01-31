import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/round_button.dart';
import '../auth/authentication_screen.dart';
import 'bedroom_detail_screen.dart';
import 'wall_panel_screen.dart';

class BedroomScreen extends StatelessWidget {
  const BedroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          foregroundColor: AppColors.whiteTheme,
          backgroundColor: AppColors.blackColor,
          title: appText('Doorstep company', fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteTheme)),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
              child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  appText('Wall panels', fontSize: 24, fontWeight: FontWeight.bold),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthenticationScreen()));
                      },
                      icon: const Icon(Icons.person_2_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              appText('All Bedrooms - Lahore', fontSize: 24, fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              Row(
                spacing: 10,
                children: [
                  const Icon(Icons.filter_list_rounded),
                  appText('Filter'),
                  const Spacer(),
                  appText('143 looks')
                ],
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const BedroomDetailScreen()));
                        },
                        child: Container(
                          height: 400,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://www.coowinwpc.com/wp-content/uploads/2024/04/WPC-Decorative-Wall-with-Built-in-Lighting.jpg'),
                                  fit: BoxFit.cover)),
                        )),
                    const SizedBox(height: 20),
                    appText('Luxury Bedroom', fontSize: 20, fontWeight: FontWeight.w400),
                    const SizedBox(height: 40)
                  ]);
                },
              )
            ],
          ))),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: roundButton(
            color: AppColors.lowPurple,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WallPanelScreen()));
            },
            title: 'Book at-home consultation'),
      ),
    );
  }
}
