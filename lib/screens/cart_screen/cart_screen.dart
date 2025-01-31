import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../../widgets/round_button.dart';
import '../ac_screens/ac_repair.dart';
import '../ac_screens/ac_repair_return_screen.dart';
import 'summary_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isAddService1Selected = false;
  bool isCheckout1Selected = true;
  bool isAddService2Selected = false;
  bool isCheckout2Selected = true;

  void _onAddService1Pressed() {
    setState(() {
      isAddService1Selected = true;
      isCheckout1Selected = false;
    });
  }

  void _onCheckout1Pressed() {
    setState(() {
      isCheckout1Selected = true;
      isAddService1Selected = false;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.all(12.px),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.shopping_cart, color: AppColors.lowPurple),
                    SizedBox(width: 10.px),
                    appText('Your cart', fontSize: 20, fontWeight: FontWeight.bold),
                    SizedBox(height: 10.px),
                  ],
                ),
                const Divider(),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: height * 0.090,
                                width: width * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: const DecorationImage(
                                        image: AssetImage('assets/images/finalclean.jpeg'), fit: BoxFit.cover))),
                            SizedBox(width: 20.px),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText('Bathroom & kitchen\ncleaning', fontSize: 20.px, fontWeight: FontWeight.w400),
                                Row(
                                  children: [
                                    appText('2 services',
                                        fontSize: 16.px, color: AppColors.greyColor, fontWeight: FontWeight.w400),
                                    SizedBox(width: 8.px),
                                    Icon(Icons.circle, size: 5.px, color: AppColors.greyColor),
                                    SizedBox(width: 8.px),
                                    appText('PKR 1499',
                                        fontSize: 16, color: AppColors.greyColor, fontWeight: FontWeight.w400),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.delete, color: AppColors.lowPurple))
                          ],
                        ),

                        SizedBox(height: 10.px),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 5.px, color: AppColors.greyColor),
                            const SizedBox(width: 5),
                            appText('Fridge cleaning X 1', fontWeight: FontWeight.w400, color: AppColors.greyColor),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 5.px, color: AppColors.greyColor),
                            SizedBox(width: 5.px),
                            appText('Instance Bathroom cleaning (2 pack) X 1',
                                fontWeight: FontWeight.w400, color: AppColors.greyColor),
                          ],
                        ),
                        SizedBox(height: height * 0.013),
                        // First section buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomContainer(
                                onTap: () {
                                  _onAddService1Pressed;
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const AcRepairScreen()));
                                },
                                height: 45.px,
                                width: 190.px,
                                borderRadius: 10.px,
                                borderColor: AppColors.grey300,
                                color: AppColors.transparentColor,
                                child: Center(
                                  child: appText('Add Services', fontSize: 16.px, fontWeight: FontWeight.w400),
                                )),
                            roundButton(
                                onTap: () {
                                  _onCheckout1Pressed;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SummaryScreen(
                                                onChecked: false,
                                              )));
                                },
                                height: 45.px,
                                width: 190.px,
                                title: 'Checkout'),
                          ],
                        ),
                        SizedBox(height: 10.px),
                        div(),
                        SizedBox(height: 10.px),
                      ],
                    );
                  },
                )
              ],
            )));
  }
}
