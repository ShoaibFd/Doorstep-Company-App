import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_text.dart';
import 'luxe_saloon_screen.dart';

class SalonForWomenCategoryScreen extends StatelessWidget {
  const SalonForWomenCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Salon for Women', fontSize: 18.px, fontWeight: FontWeight.bold),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: Column(
        children: [
          Container(
            height: 200.px,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://media.istockphoto.com/id/1678701754/photo/beautiful-young-woman-getting-her-hair-cut.jpg?s=612x612&w=0&k=20&c=JPn_FIkFLHTHNoaHlnmt9wBpJmt26wiMjLetoEBNYPc='),
                    fit: BoxFit.cover)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LuxeSaloonScreen()));
            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 10.px),
                                  height: 150.px,
                                  width: 100.px,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.px),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://media.istockphoto.com/id/853924196/photo/female-hairdresser-standing-in-salon.jpg?s=612x612&w=0&k=20&c=8GS188J48RXiAVZamkZKnOd3Xtyhw10skY_1tRkboTE='),
                                          fit: BoxFit.cover))),
                              SizedBox(width: 20.px),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appText('Luxe', fontSize: 20.px, fontWeight: FontWeight.bold),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.greenColor.withOpacity(0.3),
                                              borderRadius: BorderRadius.circular(4)),
                                          child: Padding(
                                              padding: EdgeInsets.all(4.px),
                                              child: appText('RRR',
                                                  fontWeight: FontWeight.w400, color: AppColors.hintGrey))),
                                      const SizedBox(width: 10),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.grey300.withOpacity(0.3),
                                              borderRadius: BorderRadius.circular(4.px)),
                                          child: Padding(
                                              padding: EdgeInsets.all(4.px),
                                              child: appText('PREMIUM',
                                                  fontWeight: FontWeight.w400, color: AppColors.hintGrey))),
                                      SizedBox(width: 100.px),
                                      const Icon(Icons.chevron_right, color: AppColors.lightBlack)
                                    ],
                                  ),
                                  SizedBox(height: 10.px),
                                ],
                              )
                            ],
                          );
                        }),
                    SizedBox(width: 20.px),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
