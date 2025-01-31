import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import 'ac_detail_screen.dart';

class ACScreen extends StatefulWidget {
  const ACScreen({super.key});

  @override
  State<ACScreen> createState() => _ACScreenState();
}

class _ACScreenState extends State<ACScreen> {
  final List<bool> selectedFilters = List.generate(4, (index) => false);

  bool isLiked = false;
// Search controller
  final searchController = TextEditingController();
  // Sample filter categories
  final List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
  ];

  void toggleFilter(int index) {
    setState(() {
      selectedFilters[index] = !selectedFilters[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
          backgroundColor: AppColors.whiteTheme,
          title: Container(
            margin: EdgeInsets.only(right: 30.px, top: 4.px),
            child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.whiteTheme,
                    isDense: true,
                    hintText: 'Start searching..',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.px)))),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.px),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Badge.count(
                          count: selectedFilters.where((element) => element).length,
                          child: const Icon(Icons.filter_alt_rounded))),
                  SizedBox(
                    height: 40.px,
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final isSelected = selectedFilters[index];
                        return CustomContainer(
                            onTap: () => toggleFilter(index),
                            height: 34.px,
                            width: 115.px,
                            borderRadius: 40.px,
                            margin: EdgeInsets.only(right: 8.px),
                            color: isSelected ? AppColors.blueColor : AppColors.transparentColor,
                            borderColor: isSelected ? AppColors.blueColor : AppColors.hintGrey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 6.px,
                              children: [
                                appText(categories[index],
                                    color: isSelected ? AppColors.whiteTheme : AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.px),
                              ],
                            ));
                      },
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AcDetailScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.all(10.px),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey300), borderRadius: BorderRadius.circular(8.px)),
                        child: Row(
                          children: [
                            Container(
                                height: 120.px,
                                width: 120.px,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.px),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://www.zameen.com/blog/wp-content/uploads/2020/03/Inverter-AC-vs-Normal-AC-D-11-03-1024x640.jpg'),
                                        fit: BoxFit.cover))),
                            SizedBox(width: 10.px),
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: Column(
                                      spacing: 4.px,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('Samsung Inverter Ac', fontSize: 16.px, fontWeight: FontWeight.bold),
                                        Row(
                                          children: [
                                            Icon(Icons.star, size: 16.px),
                                            SizedBox(width: 6.px),
                                            appText('4.8(12)', color: AppColors.hintGrey),
                                            SizedBox(width: 8.px),
                                            appText('142 sold', color: AppColors.hintGrey),
                                          ],
                                        ),
                                        SizedBox(height: 10.px),
                                        Row(
                                          spacing: 10.px,
                                          children: [
                                            appText("Rs.55,000", decoration: TextDecoration.lineThrough),
                                            appText("Rs.50,000", fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        appText("Model: SAM123IN"),
                                        appText("Capacity: 1 ton"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomContainer(
                                                borderRadius: 4.px,
                                                color: AppColors.greenColor,
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.px),
                                                  child: Row(
                                                    children: [
                                                      Image.asset('assets/images/delivery.png',
                                                          color: AppColors.whiteTheme, height: 26.px),
                                                      SizedBox(width: 4.px),
                                                      appText('Rs. 120',
                                                          color: AppColors.whiteTheme, fontWeight: FontWeight.bold)
                                                    ],
                                                  ),
                                                )),
                                            CustomContainer(
                                                borderRadius: 4.px,
                                                color: AppColors.redColor,
                                                child: Padding(
                                                  padding: EdgeInsets.all(6.px),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      appText('10% OFF',
                                                          color: AppColors.whiteTheme, fontWeight: FontWeight.bold)
                                                    ],
                                                  ),
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isLiked = !isLiked;
                                                  });
                                                },
                                                icon: Icon(isLiked ? Icons.favorite : Icons.favorite_outline,
                                                    size: 28.px,
                                                    color: isLiked ? AppColors.redColor : AppColors.blackColor))
                                          ],
                                        )
                                      ],
                                    )))
                          ],
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
