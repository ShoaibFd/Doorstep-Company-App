import 'package:doorstep_company_app/components/dotted_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/custom_container.dart';
import '../../components/app_text.dart';
import '../../components/divider.dart';
import '../../components/edit_package/edit_your_package.dart';
import '../../components/round_button.dart';
import '../../constants/colors.dart';
import '../painting_wall_screen/components/add_button.dart';
import '../payment_process/saved_address_bottom_sheet.dart';
import 'benefits_screen.dart';
import 'components/policy_bottom_sheet.dart';
import 'components/terms_and_conditions_sheet.dart';

class SummaryScreen extends StatefulWidget {
  final bool onChecked;
  const SummaryScreen({super.key, required this.onChecked});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  bool isChecked = true;
  final voucherController = TextEditingController();
  final customController = TextEditingController();
  bool isApplied = false;
  bool isTyping = false;
  List<String> selectedImages = [];

  int count = 1;
  int add = 0;
  int addPlan = 0;
  int payment = 0;
  int selectedIndex = -1;
  bool isTip = false;
  @override
  void initState() {
    super.initState();
    customController.addListener(() {
      setState(() {
        isTyping = customController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          shadowColor: AppColors.blackColor,
          surfaceTintColor: AppColors.whiteTheme,
          title: appText("Summary", fontSize: 22.px)),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 8.px,
                        backgroundColor: AppColors.darkGreen,
                        child: Center(child: Icon(Icons.percent, color: AppColors.whiteTheme, size: 12.px))),
                    SizedBox(width: 10.px),
                    appText("You're saving Rs.150 on this order with plus"),
                    const Spacer(),
                    Image.asset('assets/images/coin.png', height: 24.px)
                  ],
                ),
                SizedBox(height: 10.px),
                const Divider(),
                SizedBox(height: 10.px),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText('Bathroom & kitchen with\nUtensil removal'),
                            AddButton(onIncrement: () {}, onDecrement: () {}, count: count.toString()),
                            Column(
                              children: [
                                appText('Rs.1099', decoration: TextDecoration.lineThrough, color: AppColors.hintGrey),
                                appText('Rs.1299'),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10.px),
                        Row(
                          spacing: 10.px,
                          children: [
                            Icon(Icons.circle, size: 6.px, color: AppColors.grey300),
                            appText('Kitchen + 3 Bathroom x 1', color: AppColors.hintGrey)
                          ],
                        ),
                        SizedBox(height: 15.px),
                        index == 0
                            ? CustomContainer(
                                onTap: () {
                                  showEditPackageBottomSheet(context);
                                },
                                height: 40.px,
                                width: 110.px,
                                borderColor: AppColors.grey300,
                                borderRadius: 6.px,
                                color: AppColors.transparentColor,
                                child: Padding(
                                    padding: EdgeInsets.all(4.px),
                                    child: Center(
                                        child: appText('Edit package', fontWeight: FontWeight.bold, fontSize: 15))))
                            : const SizedBox(),
                        SizedBox(height: 10.px),
                        index == 1 ? const SizedBox() : dottedLine(width: width, color: AppColors.grey300),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10.px),
          div(),
          SizedBox(height: 12.px),
          CustomContainer(
              width: double.maxFinite,
              color: AppColors.lowPurple.withOpacity(0.06),
              borderRadius: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 10.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText('Plus', fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.lowPurple),
                    SizedBox(height: 10.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText('6 months plan', fontWeight: FontWeight.bold, fontSize: 16.px),
                            SizedBox(height: 8.px),
                            appText(
                              'Save PKR 100 on this booking',
                              color: AppColors.darkGreen,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            appText(
                              'PKR 249',
                              fontWeight: FontWeight.bold,
                            ),
                            appText('PKR 349',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.hintGrey),
                            SizedBox(height: 8.px),
                            AddButton(
                                borderColor: AppColors.lowPurple,
                                onIncrement: () {
                                  addPlan++;
                                },
                                onDecrement: () {
                                  if (addPlan > 0) {
                                    addPlan--;
                                  }
                                },
                                count: addPlan.toString()),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.px),
                    appText('Get 10% off on all bookings, upto PKR 100',
                        color: AppColors.hintGrey, fontSize: 13.px, fontWeight: FontWeight.bold),
                    SizedBox(height: 20.px),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  BenefitsScreen(isPlus: false)));
                        },
                        child: appText('View all benefits',
                            fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                    SizedBox(height: 20.px)
                  ],
                ),
              )),
          SizedBox(height: 12.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.px),
                appText('Frequently added together', fontSize: 18, fontWeight: FontWeight.bold),
                SizedBox(height: 20.px),
                SizedBox(
                  height: 260.px,
                  child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10.px),
                        width: 150.px,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey300), borderRadius: BorderRadius.circular(8.px)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150.px,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://www.cleanipedia.com/images/7a81sg4qctqh/6gxGQHGhzBKLVmBAYGLiPD/6f2e86be6f0f6b73a7b586159afd9f7e/Y2xlYW5pbmdfa2l0Y2hlbl9lcXVpcG1lbnQuanBn/600w/person-washing-dishes-with-soapy-water-in-a-sink..webp'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.px), topRight: Radius.circular(8.px))),
                            ),
                            SizedBox(height: 10.px),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.px),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appText('Utensil Removal\nService', fontSize: 16.px, fontWeight: FontWeight.w400),
                                  SizedBox(height: 10.px),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      appText('Rs. 169', fontWeight: FontWeight.bold),
                                      AddButton(
                                          width: 60.px,
                                          height: 30.px,
                                          count: add.toString(),
                                          onIncrement: () {
                                            add++;
                                          },
                                          onDecrement: () {
                                            add--;
                                          })
                                    ],
                                  ),
                                  SizedBox(height: 10.px),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.px),
          div(),
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText('System Preferences', fontSize: 18.px, fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
          SizedBox(height: 10.px),
          div(),
          SizedBox(height: 20.px),
          GestureDetector(
            onTap: () {
              if (!isApplied) {
                couponBottomSheet(context);
              } else {}
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 10.px,
                      backgroundColor: AppColors.darkGreen,
                      child: Center(child: Icon(Icons.percent, size: 14.px, color: AppColors.whiteTheme))),
                  SizedBox(width: width * 0.02),
                  isApplied
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 3,
                              children: [
                                appText('DC100', fontWeight: FontWeight.bold),
                                appText('applied'),
                              ],
                            ),
                            Row(
                              spacing: 4,
                              children: [
                                appText('You got'),
                                appText('Rs. 100 discount', fontWeight: FontWeight.bold),
                              ],
                            ),
                          ],
                        )
                      : appText('Coupons And Offers', fontSize: 16.px),
                  const Spacer(),
                  isApplied
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              isApplied = false;
                            });
                          },
                          child: appText('Remove', color: AppColors.lowPurple, fontSize: 16))
                      : appText('5 Offers', fontSize: 16.px, fontWeight: FontWeight.bold, color: AppColors.lowPurple),
                  SizedBox(width: width * 0.02),
                  isApplied ? const SizedBox() : const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.px),
          div(),
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText('Payment Summary', fontSize: 18.px, fontWeight: FontWeight.bold),
                SizedBox(height: 20.px),
                const ReusableRow(firstText: 'Item Total', secondText: 'PKR 1248'),
                SizedBox(height: 10.px),
                const ReusableRow(firstText: 'Convenience fee', secondText: 'PKR 1248'),
                SizedBox(height: 10.px),
                const ReusableRow(firstText: 'Taxes and fee', secondText: 'PKR 1248'),
                SizedBox(height: 10.px),
                ReusableRow(
                    firstText: 'Membership and discount',
                    secondText: '-',
                    secondTextWidget: appText('- PKR 150', color: AppColors.darkGreen)),
                SizedBox(height: 10.px),
                isApplied
                    ? ReusableRow(
                        firstText: 'Coupon discount',
                        secondText: '-',
                        secondTextWidget: appText('-PKR 150', color: AppColors.darkGreen))
                    : const SizedBox(),
                const SizedBox(height: 10),
                isTip
                    ? ReusableRow(
                        firstText: 'Tip for professional', secondText: '-', secondTextWidget: appText('PKR 150'))
                    : const SizedBox(),
                const Divider(),
                SizedBox(height: 10.px),
                const ReusableRow(
                    firstText: 'Total',
                    secondText: '-',
                    secondTextWidget:
                        Text(' PKR 1,197', style: TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          SizedBox(height: 20.px),
          Container(
              decoration: BoxDecoration(color: Colors.green.shade50),
              child: Padding(
                padding: EdgeInsets.all(10.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_offer, color: Colors.green.shade800, size: 18.px),
                    SizedBox(width: 5.px),
                    appText('Yay, you have saved PKR 150 on final billing', color: AppColors.lightGreen),
                  ],
                ),
              )),
          SizedBox(height: 20.px),
          div(),
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText('Cancellation Policy', fontWeight: FontWeight.bold, fontSize: 16.px),
                SizedBox(height: 20.px),
                appText(
                    'Free cancellations if done more than 4 hours before the service or if a professional is not assigned. A fee will be charged otherwise.',
                    color: AppColors.hintGrey),
                SizedBox(height: 20.px),
                GestureDetector(
                    onTap: () {
                      policyBottomSheet(context);
                    },
                    child:
                        appText('Read full policy', fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
              ],
            ),
          ),
          SizedBox(height: 20.px),
          div(),
          SizedBox(height: 20.px),
          SizedBox(
              height: height * 0.16,
              width: width,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: Stack(
                    children: [
                      appText('Add a tip to thank the professional', fontSize: 18.px, fontWeight: FontWeight.bold),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 40.px),
                              child: ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  // Check if the index is selected
                                  bool isSelected = selectedIndex == index;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (selectedIndex == index) {
                                          selectedIndex = -1;
                                        } else {
                                          selectedIndex = index;
                                        }
                                        isTip = !isTip;
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 0.1, right: 6),
                                          height: height * 0.038,
                                          width: width * 0.2,
                                          decoration: BoxDecoration(
                                            color: isSelected && isTyping == false
                                                ? AppColors.lowPurple.withOpacity(0.1)
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: isSelected && isTyping == false
                                                    ? AppColors.lowPurple
                                                    : AppColors.grey300),
                                            borderRadius: BorderRadius.circular(6.px),
                                          ),
                                          child: Center(
                                            child: appText(
                                              'PKR 50',
                                              fontSize: 16.px,
                                              color: isSelected ? AppColors.blackColor : AppColors.hintGrey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        index == 1
                                            ? Container(
                                                margin: EdgeInsets.only(top: 24.px, left: 10.px),
                                                decoration: BoxDecoration(
                                                    color: AppColors.darkGreen.withOpacity(0.2),
                                                    borderRadius: BorderRadius.circular(2.px)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.px),
                                                  child: appText(
                                                    'POPULAR',
                                                    fontSize: 14.sp,
                                                    color: AppColors.darkGreen,
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20.px),
                              height: 32.px,
                              width: 100.px,
                              child: TextFormField(
                                onTap: () {
                                  setState(() {
                                    isTip = true;
                                  });
                                },
                                cursorHeight: 14,
                                textInputAction: TextInputAction.done,
                                controller: customController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        isTyping ? AppColors.lowPurple.withOpacity(0.1) : AppColors.transparentColor,
                                    hintText: 'Custom',
                                    prefix: isTyping ? appText('PKR ') : null,
                                    hintStyle: TextStyle(
                                        fontSize: 14.px, fontWeight: FontWeight.bold, color: AppColors.hintGrey),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6.px),
                                        borderSide: BorderSide(color: AppColors.grey300)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6.px),
                                        borderSide: const BorderSide(color: AppColors.lowPurple))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 100.px),
                        child: appText("100% of the tip goes to the professional",
                            fontSize: 16.px.px, color: AppColors.hintGrey),
                      ),
                    ],
                  ))),
          SizedBox(height: 10.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: roundButton(
                onTap: () {
                  savedAddressSheet(context);
                },
                title: 'Add address and slot'),
          ),
          SizedBox(height: 10.px)
        ],
      )),
    );
  }

  void couponBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 14.px,
                right: 14.px,
                top: 10.px,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10.px,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.px),
                        appText('Coupons and offers', fontSize: 18.px, fontWeight: FontWeight.bold),
                        SizedBox(height: 20.px),
                        TextFormField(
                            textCapitalization: TextCapitalization.characters,
                            controller: voucherController,
                            onChanged: (value) => setState(() {}),
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: voucherController.text.isNotEmpty
                                      ? () {
                                          setState(() {
                                            isApplied = true;
                                            Navigator.pop(context);
                                          });
                                        }
                                      : null,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 13, right: 10),
                                    child: appText(
                                      'Apply',
                                      color: voucherController.text.isEmpty ? AppColors.hintGrey : AppColors.lowPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.px,
                                    ),
                                  ),
                                ),
                                hintText: 'Enter voucher code',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: AppColors.grey300)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: AppColors.grey300)))),
                        SizedBox(height: 30.px),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomContainer(
                              height: 70.px,
                              width: 70.px,
                              borderRadius: 6.px,
                              color: AppColors.grey300,
                              image: const DecorationImage(
                                image: AssetImage('assets/images/service.png'),
                                fit: BoxFit.cover,
                              ),
                              child: const SizedBox(),
                            ),
                            SizedBox(width: 20.px),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText('100% cashback on 1st booking', fontSize: 16, fontWeight: FontWeight.bold),
                                const SizedBox(height: 10),
                                appText('Use Code: DC100', color: AppColors.hintGrey),
                                const SizedBox(height: 10),
                                appText('SAVE RS 100 ON THIS ORDER',
                                    color: AppColors.darkGreen, fontSize: 12, fontWeight: FontWeight.bold),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () => showTermsAndConditionsBottomSheet(context),
                                  child: appText('View T&C', color: AppColors.lowPurple, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                  Positioned(
                    top: -60.px,
                    right: 16.px,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        backgroundColor: AppColors.whiteTheme,
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Widget? secondTextWidget;

  const ReusableRow({
    super.key,
    required this.firstText,
    required this.secondText,
    this.secondTextWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appText(firstText, fontSize: 15),
        secondTextWidget ?? Text(secondText),
      ],
    );
  }
}
