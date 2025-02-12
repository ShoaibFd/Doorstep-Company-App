import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/app_text.dart';
import '../../../constants/colors.dart';
import 'salon_prime_screen.dart';
import 'salon_royal_screen.dart';

class SalonCategoryScreen extends StatelessWidget {
  const SalonCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: appText('Salon for kids & men', fontSize: 18.px, fontWeight: FontWeight.w400),
      ),
      body: Column(
        children: [
          Container(
              height: height * .26,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://t3.ftcdn.net/jpg/05/06/74/32/360_F_506743235_coW6QAlhxlBWjnRk0VNsHqaXGGH9F4JS.jpg'),
                      fit: BoxFit.cover))),
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              children: [
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        index == 0
                            ? Navigator.push(context, MaterialPageRoute(builder: (context) => SalonRoyalScreen()))
                            : Navigator.push(context, MaterialPageRoute(builder: (context) => SalonPrimeScreen()));
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: height * .16,
                                  width: width * .26,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.px),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://t3.ftcdn.net/jpg/05/06/74/32/360_F_506743235_coW6QAlhxlBWjnRk0VNsHqaXGGH9F4JS.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.px),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText('Salon Royal', fontSize: 20.px, fontWeight: FontWeight.bold),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.greenColor.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(4.px),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.px),
                                            child: appText(
                                              'RRR',
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.hintGrey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.px),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.grey300.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(4.px),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.px),
                                            child: appText(
                                              'PREMIUM',
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.hintGrey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 80.px),
                                        const Icon(Icons.chevron_right, color: AppColors.lightBlack),
                                      ],
                                    ),
                                    SizedBox(height: 10.px),
                                    Row(
                                      children: [
                                        Text(
                                          'NOVA',
                                          style: GoogleFonts.zenTokyoZoo(fontSize: 16.px, fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(width: 10.px),
                                        Container(height: 16.px, width: 2.px, color: AppColors.grey300),
                                        SizedBox(width: 12.px),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'O',
                                                style: TextStyle(fontSize: 20.px, color: AppColors.grey300),
                                              ),
                                              TextSpan(
                                                text: '₂',
                                                style: TextStyle(fontSize: 20.px, color: AppColors.grey300),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.px),
                                        Container(
                                          height: 16.px,
                                          width: 2.px,
                                          color: AppColors.grey300,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.px),
                            index == 1 ? SizedBox() : const Divider(),
                            SizedBox(height: 10.px),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
