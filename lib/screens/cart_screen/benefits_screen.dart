import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/custom_container.dart';
import '../../components/custom_text.dart';
import '../../components/divider.dart';
import '../../constants/colors.dart';
import '../painting_wall_screen/components/add_button.dart';
import '../painting_wall_screen/components/frequently_asked_questions_widget.dart';
import 'components/add_and_remove_button.dart';

class BenefitsScreen extends StatelessWidget {
  final bool isPlus;
  BenefitsScreen({super.key, required this.isPlus});

  final PlusController plusController = Get.put(PlusController());

  final colors = [
    AppColors.redColor.shade50,
    AppColors.lowPurple.withOpacity(0.1),
    AppColors.yellowColor.shade50,
    AppColors.blueColor.shade50,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),

                  // Plus subscription section
                  if (!plusController.isSelected.value)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Plus Logo and Title
                        Row(
                          spacing: 10.px,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(radius: 40.px, backgroundColor: AppColors.lowPurple),
                            appText('plus', fontSize: 30.px, fontWeight: FontWeight.bold, color: AppColors.lowPurple),
                          ],
                        ),
                        SizedBox(height: 40.px),

                        // Discount Text
                        Center(
                          child: appText('Get 10% discount on all bookings\nwith Plus',
                              textAlign: TextAlign.center, fontSize: 20.px, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.px),

                        // Subscription Options Container
                        CustomContainer(
                          color: AppColors.transparentColor,
                          borderColor: AppColors.grey300,
                          borderRadius: 6.px,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.px),
                            child: Column(
                              children: [
                                // 6 months option
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        spacing: 4.px,
                                        children: [
                                          appText('6 months', fontWeight: FontWeight.bold),
                                          const Icon(Icons.circle, size: 4),
                                          appText('Rs.788', fontWeight: FontWeight.bold),
                                          appText('Rs.988', decoration: TextDecoration.lineThrough),
                                        ],
                                      ),
                                      isPlus
                                          ? AddButton(
                                              onIncrement: () => plusController.increment(),
                                              onDecrement: () => plusController.decrement(),
                                              count: plusController.add.toString())
                                          : AddAndRemoveButton(
                                              onTap: () => plusController.updateStatus(),
                                              title: plusController.isSelected.value ? 'Remove' : 'Add',
                                            ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.px),
                                Divider(color: AppColors.grey300),
                                SizedBox(height: 8.px),

                                // 2 months option
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        spacing: 4.px,
                                        children: [
                                          appText('2 months', fontWeight: FontWeight.bold),
                                          const Icon(Icons.circle, size: 4),
                                          appText('Rs.690', fontWeight: FontWeight.bold),
                                          appText('Rs.980', decoration: TextDecoration.lineThrough),
                                        ],
                                      ),
                                      isPlus
                                          ? AddButton(
                                              onIncrement: () => plusController.increment(),
                                              onDecrement: () => plusController.decrement(),
                                              count: plusController.add.toString())
                                          : AddAndRemoveButton(
                                              onTap: () => plusController.updateStatus(),
                                              title: plusController.isSelected.value ? 'Remove' : 'Add',
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  SizedBox(height: 20.px),

                  // Active subscription section
                  if (plusController.add.value > 0)
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(
                        spacing: 10,
                        children: [
                          CircleAvatar(radius: 30.px, backgroundColor: AppColors.lowPurple),
                          appText('plus', fontSize: 30.px, fontWeight: FontWeight.bold, color: AppColors.lowPurple),
                          CustomContainer(
                              borderRadius: 4,
                              color: AppColors.greenColor.shade100,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                child: Center(
                                    child: appText('Active', color: AppColors.darkGreen, fontWeight: FontWeight.bold)),
                              ))
                        ],
                      ),
                      SizedBox(height: 20.px),
                      appText('15% off on every service + top rated professionals',
                          fontWeight: FontWeight.bold, fontSize: 22.px),
                      SizedBox(height: 20.px),
                      appText('Valid till 7th march, 2021', color: AppColors.hintGrey, fontSize: 15.px),
                      SizedBox(height: 20.px),
                      div(),
                      SizedBox(height: 20.px),
                      appText('Plus in numbers', fontSize: 18.px, fontWeight: FontWeight.bold),
                      SizedBox(height: 20.px),

                      // Benefits Grid
                      GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return CustomContainer(
                              color: colors[index],
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/chat.png', height: 30.px),
                                    const Spacer(),
                                    appText('Rs. 299', fontWeight: FontWeight.bold),
                                    appText('Free consultation availed', fontSize: 16.px, color: AppColors.hintGrey),
                                  ],
                                ),
                              ));
                        },
                      ),
                    ]),

                  // Plus benefits section
                  SizedBox(height: 10.px),
                  div(),
                  SizedBox(height: 30.px),
                  appText('Plus benefit', fontSize: 20.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 30.px),
                  Container(
                    height: 24.px,
                    width: 24.px,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all(color: AppColors.blackColor, width: 2)),
                    child: const Icon(Icons.percent, size: 14),
                  ),
                  SizedBox(height: 20.px),
                  appText('Get 10% discount on all bookings with Plus', fontSize: 16.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 8.px),
                  appText('Enjoy 10% discount upto Rs.100 on your bookings', fontSize: 15),

                  // FAQ section
                  SizedBox(height: 30.px),
                  div(),
                  SizedBox(height: 30.px),
                  const FrequentlyAskedQuestionsWidget(),

                  // Reviews section
                  SizedBox(height: 30.px),
                  div(),
                  SizedBox(height: 30.px),
                  appText('Hear from happy Plus members', fontSize: 18.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 30.px),

                  ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60.px,
                                  width: 60.px,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoptDW2L4sg3bHj3my_QsQgvdUPTq7Y5Asug&s'),
                                          fit: BoxFit.cover),
                                      color: AppColors.grey300,
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                SizedBox(width: 10.px),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          appText('Vishal Gupta', fontSize: 15.px, fontWeight: FontWeight.bold),
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 10,
                                                backgroundColor: AppColors.lowPurple,
                                              ),
                                              SizedBox(width: 4.px),
                                              appText('Rs.760', fontWeight: FontWeight.bold),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 4.px),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          appText('Member since Oct 2022', color: AppColors.lightBlack),
                                          appText('In Plus savings', color: AppColors.lightBlack),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10.px),
                            appText(
                                'Fully satisfied.. saved 1200+ till now.. I will recommend this service app to my friends.',
                                color: AppColors.hintGrey,
                                fontSize: 16.px),
                            SizedBox(height: 20.px),
                            const Divider(),
                            SizedBox(height: 20.px)
                          ],
                        );
                      }),

                  // Load more button
                  SizedBox(height: 20.px),
                  Center(
                    child: CustomContainer(
                        onTap: () {},
                        width: 160.px,
                        height: 40.px,
                        color: AppColors.transparentColor,
                        borderColor: AppColors.grey300,
                        borderRadius: 6.px,
                        child: Center(
                          child: appText('Load more reviews', fontSize: 16.px, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(height: 20.px)
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class PlusController extends GetxController {
  var add = 0.obs;
  var isSelected = false.obs;

  void increment() {
    if (add.value < 1) {
      add.value = 1;
    }
  }

  void decrement() {
    if (add.value > 0) {
      add.value = 0;
    }
  }

  void updateStatus() {
    isSelected.value = !isSelected.value;
  }
}
