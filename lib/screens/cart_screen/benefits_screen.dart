import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../painting_wall_screen/Widgets/add_button.dart';
import '../painting_wall_screen/Widgets/frequently_asked_questions_widget.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({super.key});

  @override
  State<BenefitsScreen> createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_circle_left_outlined)),
                Center(
                  child: CircleAvatar(radius: 40.px, backgroundColor: AppColors.lowPurple),
                ),
                SizedBox(height: 40.px),
                Center(
                  child: appText('Get 10% discount on all bookings\nwith Plus',
                      textAlign: TextAlign.center, fontSize: 20.px, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.px),
                CustomContainer(
                  color: AppColors.transparentColor,
                  borderColor: AppColors.grey300,
                  borderRadius: 6.px,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.px),
                    child: Column(
                      children: [
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
                              AddButton(onIncrement: () {}, onDecrement: () {}, count: count.toString())
                            ],
                          ),
                        ),
                        SizedBox(height: 8.px),
                        Divider(color: AppColors.grey300),
                        SizedBox(height: 8.px),
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
                              AddButton(onIncrement: () {}, onDecrement: () {}, count: count.toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.px),
                div(),
                SizedBox(height: 30.px),
                appText('Plus benefit', fontSize: 20.px, fontWeight: FontWeight.bold),
                SizedBox(height: 30.px),
                Container(
                  height: 24.px,
                  width: 24.px,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.blackColor, width: 2)),
                  child: const Icon(
                    Icons.percent,
                    size: 14,
                  ),
                ),
                SizedBox(height: 20.px),
                appText('Get 10% discount on all bookings with Plus', fontSize: 16.px, fontWeight: FontWeight.bold),
                SizedBox(height: 8.px),
                appText('Enjoy 10% discount upto Rs.100 on your bookings', fontSize: 15),
                SizedBox(height: 30.px),
                div(),
                SizedBox(height: 30.px),
                const FrequentlyAskedQuestionsWidget(),
                SizedBox(height: 30.px),
                div(),
                SizedBox(height: 30.px),
                appText('Hear from happy Plus members', fontSize: 18.px, fontWeight: FontWeight.bold),
                SizedBox(height: 30.px),
                ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
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
            ),
          ),
        ),
      ),
    );
  }
}
