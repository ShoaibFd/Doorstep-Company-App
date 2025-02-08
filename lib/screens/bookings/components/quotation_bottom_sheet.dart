import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_text.dart';
import '../../../components/divider.dart';
import '../quotation_detail_screen.dart';

class QuotationBottomSheet extends StatefulWidget {
  const QuotationBottomSheet({super.key});

  @override
  _QuotationBottomSheetState createState() => _QuotationBottomSheetState();
}

class _QuotationBottomSheetState extends State<QuotationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.9,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.px),
                  Row(
                    spacing: 20.px,
                    children: [
                      Container(
                          height: 70.px,
                          width: 70.px,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.px),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/mixergrinder.jpeg'), fit: BoxFit.cover))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Bathroom & kitchen\ncleaning', fontSize: 18.px, fontWeight: FontWeight.bold),
                          SizedBox(height: 6.px),
                          appText('2x services', color: AppColors.greyColor, fontWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText('1st Quote', fontSize: 20.px, fontWeight: FontWeight.bold),
                      appText('Rs. 899', fontSize: 20.px, fontWeight: FontWeight.bold, color: AppColors.darkGreen),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText('Customer paid online'),
                      appText('Rs.0'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText('Payable by customer'),
                      appText('Rs.899'),
                    ],
                  ),
                  SizedBox(height: 20.px),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const QuotationDetailScreen()));
                    },
                    child: appText(
                      'Details',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: AppColors.blueColor,
                    ),
                  ),
                  SizedBox(height: 10.px),
                  div(),
                  appText('Appliances Details', fontSize: 20.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 30.px),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('AC 1', fontSize: 18.px, fontWeight: FontWeight.bold),
                          SizedBox(height: 10.px),
                          Row(
                            spacing: 4,
                            children: [
                              appText('Split AC', color: AppColors.hintGrey),
                              Icon(Icons.circle, size: 4, color: AppColors.hintGrey),
                              appText('1.5 ton', color: AppColors.hintGrey),
                              Icon(Icons.circle, size: 4, color: AppColors.hintGrey),
                              appText('Invertor', color: AppColors.hintGrey),
                              Icon(Icons.circle, size: 4, color: AppColors.hintGrey),
                              appText('Other', color: AppColors.hintGrey),
                              Icon(Icons.circle, size: 4, color: AppColors.hintGrey),
                            ],
                          ),
                          SizedBox(height: 6.px),
                          Row(
                            spacing: 4,
                            children: [
                              appText('1-3 years', color: AppColors.hintGrey),
                              Icon(Icons.circle, size: 4, color: AppColors.hintGrey),
                              appText('Repair/Installation/Uninstallation', color: AppColors.hintGrey),
                            ],
                          ),
                          SizedBox(height: 40.px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              appText('Split Ac Installation', fontSize: 16.px, fontWeight: FontWeight.bold),
                              CustomContainer(
                                  color: AppColors.grey300,
                                  height: 20.px,
                                  width: 20.px,
                                  borderRadius: 4,
                                  child: Center(
                                    child: appText('1'),
                                  )),
                              appText('Rs. 799', fontWeight: FontWeight.bold)
                            ],
                          ),
                          SizedBox(height: 10.px),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                          height: 40.px,
                          width: 200.px,
                          color: AppColors.lowPurple.withOpacity(0.1),
                          borderColor: AppColors.lowPurple,
                          child: Center(
                            child: appText('Approve & Start Working', fontWeight: FontWeight.bold),
                          )),
                      CustomContainer(
                          height: 40.px,
                          width: 150.px,
                          color: AppColors.lowPurple.withOpacity(0.1),
                          borderColor: AppColors.lowPurple,
                          child: Center(
                            child: appText('Disapprove', fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  SizedBox(height: 10.px),
                  CustomContainer(
                      height: 40.px,
                      width: 200.px,
                      color: AppColors.lowPurple.withOpacity(0.1),
                      borderColor: AppColors.lowPurple,
                      child: Center(
                        child: appText('Approve & Start later', fontWeight: FontWeight.bold),
                      )),
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
        ],
      ),
    );
  }
}

void showQuotationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    constraints: const BoxConstraints(),
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isDismissible: true,
    builder: (context) {
      return const QuotationBottomSheet();
    },
  );
}
