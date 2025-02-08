import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../components/custom_text.dart';
import '../../components/round_button.dart';
import '../painting_wall_screen/full_home_painting.dart';

class PaintSummaryScreen extends StatefulWidget {
  const PaintSummaryScreen({super.key});

  @override
  State<PaintSummaryScreen> createState() => _PaintSummaryScreenState();
}

class _PaintSummaryScreenState extends State<PaintSummaryScreen> {
  int count = 1;
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Summary', fontSize: 18, fontWeight: FontWeight.w400)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: count == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: AppColors.lowPurple,
                      size: 40,
                    ),
                    const SizedBox(height: 30),
                    appText('Hey, it feels so empty here.', fontSize: 18, fontWeight: FontWeight.w400),
                    const SizedBox(height: 10),
                    appText('Lets add some services.', fontSize: 16, fontWeight: FontWeight.w400),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FullHomeScreen()));
                      },
                      child: Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey300), borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: appText('Explore services', color: AppColors.lowPurple),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  appText('Full home painting & waterproofing', fontSize: 18),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(height: 60, width: 3, color: AppColors.grey300),
                      const SizedBox(width: 20),
                      appText('Painting\nConsultation'),
                      const SizedBox(width: 60),
                      Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            color: AppColors.lowPurple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.lowPurple.withOpacity(0.4))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (count > 0) {
                                      count--;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: AppColors.lowPurple,
                                  size: 14,
                                )),
                            appText(count.toString(), color: AppColors.lowPurple),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_circle,
                                  color: AppColors.grey300,
                                  size: 14,
                                )),
                          ],
                        ),
                      ),
                      const Spacer(),
                      appText('Rs.49', fontSize: 16)
                    ],
                  ),
                  const SizedBox(height: 20),
                  Divider(thickness: 8, color: AppColors.grey300),
                  const SizedBox(height: 20),
                  appText('Service Preferences', fontSize: 18, fontWeight: FontWeight.w400),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.blackColor,
                        checkColor: AppColors.whiteTheme,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      appText('Avoid calling before reaching the location'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(thickness: 8, color: AppColors.grey300),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: AppColors.darkGreen,
                        child: appText('%', color: AppColors.grey300),
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Coupons and offers', fontSize: 16),
                          appText('Login or sign up to view offers', fontSize: 16),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Divider(thickness: 8, color: AppColors.grey300),
                  const SizedBox(height: 20),
                  appText('Payment summary', fontWeight: FontWeight.bold, fontSize: 20),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText('Item total', fontSize: 16),
                      appText('Rs.100', fontSize: 16),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText('Total', fontSize: 16, fontWeight: FontWeight.bold),
                      appText('Rs.100', fontSize: 16),
                    ],
                  ),
                  const Spacer(),
                  roundButton(title: 'Login/Sign up to proceed'),
                  const SizedBox(height: 10)
                ],
              ),
      ),
    );
  }
}
