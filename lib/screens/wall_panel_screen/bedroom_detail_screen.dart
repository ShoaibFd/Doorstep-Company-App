import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/round_button.dart';
import '../auth/authentication_screen.dart';
import 'wall_panel_screen.dart';

class BedroomDetailScreen extends StatelessWidget {
  const BedroomDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          foregroundColor: AppColors.whiteTheme,
          backgroundColor: AppColors.blackColor,
          title: appText('Doorstep company', fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.whiteTheme)),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
              child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  appText('Wall panels', fontSize: 20, fontWeight: FontWeight.bold),
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
              GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                          'https://www.coowinwpc.com/wp-content/uploads/2024/04/WPC-Decorative-Wall-with-Built-in-Lighting.jpg'))),
              const SizedBox(height: 10),
              appText('Minimalist Living room', fontSize: 24, fontWeight: FontWeight.w400),
              const SizedBox(height: 30),
              appText('Charcol chevron'),
              CustomContainer(
                  color: AppColors.blackColor,
                  borderRadius: 40,
                  height: 44,
                  width: 120,
                  child: Center(
                    child: appText('Default Title', color: AppColors.whiteTheme),
                  )),
              appText(
                  'Simply your space with our minimalist wall panels, the perfect addition for those who love clean, simple design. These panels provide a streamlined look that enhances the natural beauty of your home.With their subtle elegance, they add a modern touch without taking away from the essence of your space.',
                  fontSize: 16),
              const SizedBox(height: 20),
              Row(spacing: 10, children: [const Icon(Icons.ios_share_rounded), appText('Share')]),
              const SizedBox(height: 30),
              appText('Similar looks', fontSize: 24, fontWeight: FontWeight.w400),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        const CustomContainer(
                            margin: EdgeInsets.only(right: 8),
                            borderRadius: 10,
                            height: 200,
                            width: 185,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.coowinwpc.com/wp-content/uploads/2024/04/WPC-Decorative-Wall-with-Built-in-Lighting.jpg'),
                                fit: BoxFit.cover),
                            child: SizedBox()),
                        appText('TV Unit', fontSize: 18)
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        const CustomContainer(
                            margin: EdgeInsets.only(right: 8),
                            borderRadius: 10,
                            height: 200,
                            width: 185,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.coowinwpc.com/wp-content/uploads/2024/04/WPC-Decorative-Wall-with-Built-in-Lighting.jpg'),
                                fit: BoxFit.cover),
                            child: SizedBox()),
                        appText('TV Unit', fontSize: 18)
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),
              appText('How it works', fontSize: 24, fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                      'https://images.pexels.com/photos/2422280/pexels-photo-2422280.jpeg?cs=srgb&dl=pexels-jopwell-2422280.jpg&fm=jpg')),
              const SizedBox(height: 10),
              appText('01', color: AppColors.lightBlack),
              appText('At home consultation', fontSize: 24, fontWeight: FontWeight.w400),
              appText('Our pro helps you finalize the looks,\nmeasures and creates quotes for your wall'),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    'https://5.imimg.com/data5/SELLER/Default/2023/2/VF/NV/RX/685825/decorative-pvc-wall-panel-500x500.jpg'),
              ),
              // Second
              const SizedBox(height: 10),
              appText('02', color: AppColors.lightBlack),
              appText('Delivery of panels', fontSize: 24, fontWeight: FontWeight.w400),
              appText('After finalising the panel we deliver the\npanels within 48 hours'),
              const SizedBox(height: 10),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network('https://i.pinimg.com/originals/08/62/ab/0862ab490ae447e4a9fd0bd56afadb9a.jpg')),
              appText('03', color: AppColors.lightBlack),
              appText('Panel Installation', fontSize: 24, fontWeight: FontWeight.w400),
              appText('Professional install the panels, followed by\nsite clean up and hand-off.'),
              SizedBox(height: 70.h)
            ],
          ))),
      bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: roundButton(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WallPanelScreen()));
              },
              height: 50,
              width: double.maxFinite,
              title: 'Book at-home consultation')),
    );
  }
}
