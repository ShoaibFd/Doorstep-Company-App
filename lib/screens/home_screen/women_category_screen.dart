import 'package:doorstep_company_app/screens/salon_for_women/hair_studio/hair_studio_for_women_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/app_text.dart';
import '../../constants/colors.dart';
import '../salon_for_women/hair_studio/hair_studio_screen.dart';
import '../salon_for_women/hair_studio/salon_category_screen.dart';
import '../salon_for_women/spa_for_women/spa_for_women_category_screen.dart';

class WomenCategoryScreen extends StatefulWidget {
  const WomenCategoryScreen({
    super.key,
  });

  @override
  State<WomenCategoryScreen> createState() => _WomenCategoryScreenState();
}

class _WomenCategoryScreenState extends State<WomenCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    navigateToServiceDetailAndPaintingScreen(int index) {
      switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SalonForWomenCategoryScreen()));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SpaForWomenCategoryScreen()));

          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HairStudioScreen()));

          break;
        case 3:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HairStudioForWomenScreen()));
        default:
          break;
      }
    }

    final List<Map<String, dynamic>> subcategories = [
      {
        'icon': Icons.face,
        'title': 'Salon for Women',
        'route': const WomenSaloonSubcategoryTwo(),
      },
      {
        'icon': Icons.spa,
        'title': 'Spa for Women',
        'route': const WomenSaloonSubcategoryTwo(),
      },
      {
        'icon': Icons.dry,
        'title': 'Hair Studio for Women',
        'route': const WomenSaloonSubcategoryTwo(),
      },
      {
        'icon': Icons.brush,
        'title': 'Makeup & Styling Studio',
        'route': const WomenSaloonSubcategoryTwo(),
      },
    ];

    return Stack(clipBehavior: Clip.none, children: [
      SizedBox(
        height: 250.px,
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.all(16.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.px),
              appText("Women's Salon & Spa", fontSize: 20.px, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
              SizedBox(height: 12.px),
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subcategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, crossAxisSpacing: 3.px, mainAxisSpacing: 3.px, mainAxisExtent: 200.px),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navigateToServiceDetailAndPaintingScreen(index);
                      },
                      child: WomenSubcategoryScreen(
                        iconData: subcategories[index]['icon'],
                        title: subcategories[index]['title'],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: -50.px,
        right: 16.px,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CircleAvatar(
            backgroundColor: AppColors.whiteTheme,
            child: Icon(Icons.close),
          ),
        ),
      ),
    ]);
  }
}

class WomenSubcategoryScreen extends StatelessWidget {
  final IconData iconData;
  final String title;

  const WomenSubcategoryScreen({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 80.px,
                width: 80.px,
                decoration: BoxDecoration(color: AppColors.grey300, borderRadius: BorderRadius.circular(10.px)),
                child: Icon(iconData, size: 40.px, color: Colors.cyan)),
            SizedBox(height: 12.px),
            appText(title, textAlign: TextAlign.center),
          ],
        ),
      ],
    );
  }
}

// Dummy page for the subcategory navigation
class WomenSaloonSubcategoryTwo extends StatelessWidget {
  const WomenSaloonSubcategoryTwo({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(title: appText('Salon for Women')),
      body: Column(
        children: [
          Image.asset("assets/images/womensaloon.jpeg", width: width, height: height * 0.25, fit: BoxFit.cover),
          SizedBox(height: height * 0.030),
          Stack(
            children: [
              const Image(image: AssetImage("assets/images/www.jpeg")),
              Container(
                  margin: EdgeInsets.only(left: 135.px, top: 66.px),
                  height: height * 0.030,
                  width: width * 0.10,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.px), color: AppColors.lightGreen),
                  child: Center(child: appText('PKR', fontSize: 15, color: AppColors.darkGreen)))
            ],
          ),
          const Divider(),
          Stack(
            children: [
              const Image(image: AssetImage("assets/images/women2.jpeg")),
              Container(
                  margin: EdgeInsets.only(left: 131.px, top: 82.px),
                  height: height * 0.030,
                  width: width * 0.10,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.px), color: AppColors.lightGreen),
                  child: Center(child: appText('PKR', fontSize: 15.px, color: AppColors.darkGreen)))
            ],
          ),
        ],
      ),
    );
  }
}
