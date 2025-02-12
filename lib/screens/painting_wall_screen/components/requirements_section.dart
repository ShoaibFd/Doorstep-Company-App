import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import '../../../components/round_button.dart';

class RequirementSection extends StatefulWidget {
  const RequirementSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RequirementSectionState createState() => _RequirementSectionState();
}

class _RequirementSectionState extends State<RequirementSection> {
  bool areaSelecting = true;
  bool areaSelected = false;
  bool paintType = false;
  bool paintSelected = false;
  bool isDamaged = false;
  bool isSeepaged = false;
  bool isAddOn = false;
  Map<int, bool> isAddedMap = {};
  Map<int, int> numMap = {};

  String selectedArea = '';
  String selectedPaintType = '';
  double totalPrice = 0.0;
  int count = 0;

  List<Map<String, dynamic>> dataList = [
    {'walls': 1, 'count': 1, 'price': 1399},
    {'walls': 2, 'count': 2, 'price': 2598},
    {'walls': 3, 'count': 3, 'price': 3897},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText("Select Requirements", fontSize: 22.px, fontWeight: FontWeight.bold),
        SizedBox(height: 10.px),
        // Area to paint section
        Row(
          children: [
            CircleAvatar(radius: 11.px, backgroundColor: AppColors.grey300, child: Center(child: appText('1'))),
            SizedBox(width: 30.px),
            appText('Area to paint', fontSize: 16.px, fontWeight: FontWeight.w400),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  areaSelecting = !areaSelecting;
                });
              },
              icon: Icon(areaSelecting ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined),
            ),
          ],
        ),

        if (areaSelecting)
          SizedBox(
            height: 80.px,
            child: ListView.builder(
              itemCount: dataList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = dataList[index];
                return CustomContainer(
                  onTap: () {
                    setState(() {
                      areaSelected = true;
                      selectedArea = '${item['walls']} wall${item['walls'] > 1 ? 's' : ''} (Rs. ${item['price']})';
                      totalPrice += item['price'];
                      areaSelecting = false;
                      paintType = true;
                    });
                  },
                  margin: EdgeInsets.only(right: 10.px),
                  height: 80.px,
                  width: 160.px,
                  borderRadius: 8.px,
                  borderColor: AppColors.grey300,
                  color: AppColors.transparentColor,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        appText('${item['walls']} wall${item['walls'] > 1 ? 's' : ''}', fontWeight: FontWeight.bold),
                        SizedBox(height: 20.px),
                        appText('Rs. ${item['price']}', fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        if (areaSelected)
          Padding(
              padding: EdgeInsets.only(left: 60.px, top: 8.px),
              child: appText(selectedArea, fontSize: 16.px, fontWeight: FontWeight.w400)),

        const Divider(),
        // Paint type section
        Row(
          children: [
            CircleAvatar(radius: 11.px, backgroundColor: AppColors.grey300, child: Center(child: appText('2'))),
            SizedBox(width: 30.px),
            appText('Paint type', fontSize: 16.px, fontWeight: FontWeight.w400),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  if (areaSelected) {
                    paintType = !paintType;
                  }
                });
              },
              icon: Icon(paintType ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined),
            ),
          ],
        ),

        if (paintType)
          SizedBox(
            height: 260.px,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomContainer(
                  onTap: () {
                    setState(() {
                      paintSelected = true;
                      selectedPaintType = 'Economy (non-washable) + Rs. 300';
                      totalPrice += 300;
                      paintType = false;
                      isDamaged = true;
                    });
                  },
                  margin: EdgeInsets.only(right: 10.px),
                  height: 80.px,
                  width: 200.px,
                  borderRadius: 8.px,
                  borderColor: AppColors.grey300,
                  color: AppColors.transparentColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://brightopaints.com/cdn/shop/products/Brighto-Super-Emulsion_2048x2048.png?v=1641376776',
                          height: 100),
                      appText('Economy', fontWeight: FontWeight.w400),
                      appText('(non-washable)', fontWeight: FontWeight.w400),
                      appText('+ Rs. 300', fontWeight: FontWeight.w400),
                      // Add button
                      const SizedBox(),
                    ],
                  ),
                );
              },
            ),
          ),

        if (paintSelected)
          Padding(
            padding: EdgeInsets.only(left: 60.px, top: 8.px),
            child: appText(selectedPaintType, fontSize: 16.px, fontWeight: FontWeight.w400),
          ),

        const Divider(),

        // Damage/Seepage section
        Row(
          children: [
            CircleAvatar(radius: 11.px, backgroundColor: AppColors.grey300, child: Center(child: appText('3'))),
            SizedBox(width: 30.px),
            appText('Any seepage/damages', fontSize: 16.px, fontWeight: FontWeight.w400),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  if (paintSelected) {
                    isDamaged = !isDamaged;
                  }
                });
              },
              icon: Icon(isDamaged ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined),
            ),
          ],
        ),

        if (isDamaged && !isSeepaged)
          SizedBox(
            height: 260,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomContainer(
                  margin: EdgeInsets.only(right: 10.px),
                  height: 80.px,
                  width: 200.px,
                  borderRadius: 8.px,
                  borderColor: AppColors.grey300,
                  color: AppColors.transparentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isSeepaged = !isSeepaged;
                              if (isSeepaged) {
                                showBottomSheet(context);
                              }
                            });
                          },
                          child: Container(
                              height: 130.px,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://brightopaints.com/cdn/shop/products/Brighto-Super-Emulsion_2048x2048.png?v=1641376776',
                                      ),
                                      fit: BoxFit.contain),
                                  color: AppColors.transparentColor,
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(8.px))))),
                      SizedBox(height: 20.px),
                      Padding(
                        padding: EdgeInsets.all(8.px),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText('No damage', fontWeight: FontWeight.bold),
                            SizedBox(height: 8.px),
                            appText('Rs. 300', fontWeight: FontWeight.bold),
                            SizedBox(height: 8.px),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (count == 0) {
                                      count = 1;
                                    }
                                  });
                                },
                                child: count > 0
                                    ? Container(
                                        height: 34.px,
                                        width: 70.px,
                                        decoration: BoxDecoration(
                                            color: AppColors.lowPurple.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: AppColors.lowPurple)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    count--;
                                                    if (count < 0) {
                                                      count = 0;
                                                    }
                                                  });
                                                },
                                                child: Icon(Icons.remove, size: 16.px, color: AppColors.lowPurple)),
                                            appText(count.toString(),
                                                color: AppColors.lowPurple,
                                                fontSize: 16.px,
                                                fontWeight: FontWeight.bold),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    count++;
                                                  });
                                                },
                                                child: Icon(Icons.add, size: 16.px, color: AppColors.lowPurple)),
                                          ],
                                        ))
                                    : Container(
                                        height: 34.px,
                                        width: 70.px,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: AppColors.grey300)),
                                        child: Center(
                                            child: appText('Add',
                                                fontWeight: FontWeight.bold, color: AppColors.lowPurple)))),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

        const Divider(),

        // Add-ons section
        if (isSeepaged)
          Row(
            children: [
              CircleAvatar(
                radius: 11,
                backgroundColor: AppColors.grey300,
                child: Center(
                  child: appText('4', color: isSeepaged ? AppColors.blackColor : AppColors.hintGrey),
                ),
              ),
              SizedBox(width: 30.px),
              appText('Add-ons',
                  fontSize: 16.px,
                  fontWeight: FontWeight.w400,
                  color: isSeepaged ? AppColors.blackColor : AppColors.hintGrey),
              const Spacer(),
              IconButton(
                onPressed: isSeepaged
                    ? () {
                        setState(() {
                          isAddOn = !isAddOn;
                          if (isAddOn) {
                            showBottomSheet(context);
                          }
                        });
                      }
                    : null,
                icon: Icon(
                  isAddOn ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                  color: isSeepaged ? AppColors.blackColor : AppColors.hintGrey,
                ),
              ),
            ],
          ),

        if (isAddOn)
          SizedBox(
            height: 200.px,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomContainer(
                  margin: EdgeInsets.only(right: 10.px),
                  borderRadius: 8,
                  borderColor: AppColors.grey300,
                  color: AppColors.transparentColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/painting.jpeg', height: 80.px, width: 100.px),
                        appText('Balcon grill paint'),
                        appText('Rs. 300'),
                        SizedBox(height: 12.px),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (count == 0) {
                                  count = 1; // Set count to 1 when adding
                                }
                              });
                            },
                            child: count > 0
                                ? Container(
                                    height: 34.px,
                                    width: 70.px,
                                    decoration: BoxDecoration(
                                        color: AppColors.lowPurple.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: AppColors.lowPurple)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                count--;
                                                if (count < 0) {
                                                  count = 0;
                                                }
                                              });
                                            },
                                            child: Icon(Icons.remove, size: 16.px, color: AppColors.lowPurple)),
                                        appText(count.toString(),
                                            color: AppColors.lowPurple, fontSize: 16.px, fontWeight: FontWeight.bold),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                count++;
                                              });
                                            },
                                            child: Icon(Icons.add, size: 16.px, color: AppColors.lowPurple)),
                                      ],
                                    ))
                                : Container(
                                    height: 34.px,
                                    width: 70.px,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: AppColors.grey300)),
                                    child: Center(
                                        child:
                                            appText('Add', fontWeight: FontWeight.bold, color: AppColors.lowPurple)))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        SizedBox(height: 20.px),
      ],
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.zero),
      ),
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
            height: 100.px,
            width: double.maxFinite,
            child: Padding(
                padding: EdgeInsets.all(16.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText('Rs. $totalPrice', fontWeight: FontWeight.bold, fontSize: 18.px),
                    roundButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: AppColors.lowPurple,
                        width: 180.px,
                        title: 'Done')
                  ],
                )));
      },
    );
  }
}
