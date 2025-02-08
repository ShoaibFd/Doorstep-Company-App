import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/custom_container.dart';
import '../../components/custom_text.dart';
import '../../components/divider.dart';
import '../../components/round_button.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final List<bool> selectedFilters = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.px),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomContainer(
                        height: 130.px,
                        width: 100.px,
                        borderRadius: 8.px,
                        color: AppColors.grey300,
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?cs=srgb&dl=pexels-andrewperformance1-697509.jpg&fm=jpg'),
                            fit: BoxFit.cover),
                        child: const SizedBox()),
                    SizedBox(height: 20.px),
                    appText('Muzammil Amjad', fontSize: 18.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 10.px),
                    appText('Ac Repair & services', color: AppColors.hintGrey),
                    SizedBox(height: 30.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, size: 16, color: AppColors.hintGrey),
                                SizedBox(width: 6.px),
                                appText('4.77', fontSize: 18.px, fontWeight: FontWeight.w400),
                              ],
                            ),
                            appText('Rating', color: AppColors.hintGrey, fontSize: 16.px),
                          ],
                        ),
                        Column(
                          children: [
                            appText('384', fontSize: 16, fontWeight: FontWeight.bold),
                            appText(
                              'Bookings',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.hintGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.px),
              div(),
              SizedBox(height: 14.px),
              appText('Verifications', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 10.px),
              Column(
                children: [
                  statusRow(status: 'Police verified'),
                  SizedBox(height: 10.px),
                  statusRow(status: 'CNIC verified'),
                  SizedBox(height: 10.px),
                  statusRow(status: 'Residence verified'),
                ],
              ),
              SizedBox(height: 20.px),
              const Divider(),
              SizedBox(height: 10.px),
              appText('Work Experience', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 8.px),
              appText(
                'Abc Company',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 8.px),
              bulletRow(text: '8+ years of experience'),
              SizedBox(height: 20.px),
              const Divider(),
              SizedBox(height: 10.px),
              appText('Qualification', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 8.px),
              bulletRow(text: 'Intermediate'),
              bulletRow(text: 'BS Information Technology'),
              SizedBox(height: 20.px),
              const Divider(),
              SizedBox(height: 10.px),
              appText('Area of expertise', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 8.px),
              statusRow(status: 'Geyser specialist'),
              SizedBox(height: 10.px),
              statusRow(status: 'Electrician'),
              SizedBox(height: 20.px),
              div(),
              SizedBox(height: 20.px),
              appText('Doorstep Company Customers Reviews', fontSize: 18.px),
              SizedBox(height: 10.px),
              Row(
                children: [
                  appText('4.77', fontSize: 40.px, fontWeight: FontWeight.bold, color: AppColors.darkGreen),
                  SizedBox(width: 40.px),
                  Column(
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(Icons.star, color: AppColors.darkGreen, size: 22.px),
                        ),
                      ),
                      appText('117 Rating', color: AppColors.hintGrey, fontSize: 16.px),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.px),
              Column(
                children: List.generate(
                  5,
                  (index) {
                    // Define labels and corresponding ratings
                    final labels = ['Excellent (96)', 'Good (13)', 'Average (1)', 'Bad (4)', 'Very Bad (3)'];
                    final colors = [
                      AppColors.greenColor,
                      AppColors.greenColor.withOpacity(0.5),
                      Colors.amber,
                      Colors.orange,
                      Colors.red
                    ];
                    final label = labels[index];
                    final color = colors[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText(label, fontSize: 13.px, fontWeight: FontWeight.w500, color: AppColors.hintGrey),
                          SizedBox(width: 8.px),
                          SizedBox(
                            width: width * .6,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.px),
                              child: LinearProgressIndicator(
                                value: (index + 1) * 0.2,
                                backgroundColor: Colors.grey[300],
                                color: color,
                                minHeight: 10.px,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.px),
              const Divider(),
              SizedBox(height: 20.px),
              appText('Most helpful reviews', fontSize: 20.px, fontWeight: FontWeight.w400),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.px),
                      child: Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration:
                                BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.grey300)),
                            child: const Center(
                              child: Icon(Icons.person, size: 40),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      appText('Osamah'),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: AppColors.darkGreen,
                                              size: 20,
                                            ),
                                            appText('4.5',
                                                color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 15)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  appText(
                                    'Jan 23, 2023',
                                    color: AppColors.hintGrey.withOpacity(0.7),
                                  ),
                                  const SizedBox(height: 4),
                                  appText('❝ Excellent work, they cleanup and not all\nmarks on walls,Thank you ❞',
                                      color: AppColors.hintGrey.withOpacity(0.7)),
                                  const SizedBox(height: 8),
                                  Divider(
                                    color: AppColors.grey300,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ));
                },
              ),
              SizedBox(height: 10.px),
              CustomContainer(
                  height: 50.px,
                  color: AppColors.transparentColor,
                  borderColor: AppColors.grey300,
                  child: Padding(
                      padding: EdgeInsets.all(8.px),
                      child: Center(child: appText('Show more', color: AppColors.lowPurple, fontSize: 16.px)))),
              SizedBox(height: 10.px),
              roundButton(onTap: () {}, title: 'Book again', fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper widget for status row
Widget statusRow({required String status}) {
  return Row(
    children: [
      SizedBox(width: 40.px),
      Icon(Icons.check_circle, color: AppColors.greenColor, size: 14.px),
      SizedBox(width: 8.px),
      appText(status),
    ],
  );
}

// Helper widget for bullet points
Widget bulletRow({required String text}) {
  return Row(
    children: [
      SizedBox(width: 43.px),
      Icon(Icons.circle, size: 4.px, color: AppColors.hintGrey),
      SizedBox(width: 10.px),
      appText(text),
    ],
  );
}

