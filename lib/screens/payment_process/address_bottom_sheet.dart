import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/custom_container.dart';
import '../../components/custom_snackbar.dart';
import '../../components/custom_text.dart';
import '../../components/round_button.dart';
import '../cart_screen/appointment_sheet.dart';
// Import other screens here

class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({
    super.key,
  });

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  bool isContainer1 = true;
  bool isContainer2 = false;
  bool isContainer3 = false;
  bool isContainer4 = false;
  final cityController = TextEditingController();
  final areaController = TextEditingController();
  final streetController = TextEditingController();
  final villaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.9,
      width: width,
      color: AppColors.transparentColor,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
            child: Column(
              children: [
                SizedBox(height: 20.px),
                appText('Enter Address Details', fontSize: 20.px, fontWeight: FontWeight.bold),
                SizedBox(height: 20.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainer(
                        onTap: () {
                          setState(() {
                            isContainer1 = true;
                            isContainer2 = false;
                            isContainer3 = false;
                          });
                        },
                        height: 34.px,
                        width: 80.px,
                        borderRadius: 30.px,
                        color: isContainer1 ? AppColors.blueColor : AppColors.transparentColor,
                        borderColor: isContainer1 ? AppColors.transparentColor : AppColors.grey300,
                        child: Center(
                            child: appText('Home',
                                fontSize: 16.px,
                                fontWeight: FontWeight.bold,
                                color: isContainer1 ? AppColors.whiteTheme : AppColors.blackColor))),
                    CustomContainer(
                        onTap: () {
                          setState(() {
                            isContainer1 = false;
                            isContainer2 = true;
                            isContainer3 = false;
                          });
                        },
                        height: 34.px,
                        width: 80.px,
                        borderRadius: 30.px,
                        color: isContainer2 ? AppColors.blueColor : AppColors.transparentColor,
                        borderColor: isContainer2 ? AppColors.transparentColor : AppColors.grey300,
                        child: Center(
                            child: appText('Office',
                                fontSize: 16.px,
                                fontWeight: FontWeight.bold,
                                color: isContainer2 ? AppColors.whiteTheme : AppColors.blackColor))),
                    CustomContainer(
                        onTap: () {
                          setState(() {
                            isContainer1 = false;
                            isContainer2 = false;
                            isContainer3 = true;
                          });
                        },
                        height: 34.px,
                        width: 80.px,
                        borderRadius: 30.px,
                        color: isContainer3 ? AppColors.blueColor : AppColors.transparentColor,
                        borderColor: isContainer3 ? AppColors.transparentColor : AppColors.grey300,
                        child: Center(
                            child: appText('Other',
                                fontSize: 16.px,
                                fontWeight: FontWeight.bold,
                                color: isContainer3 ? AppColors.whiteTheme : AppColors.blackColor)))
                  ],
                ),
                SizedBox(height: 10.px),
                TextFormField(
                    controller: cityController,
                    cursorColor: AppColors.blueColor,
                    decoration: InputDecoration(
                        label: appText('City', fontSize: 16.px),
                        hintText: 'Dubai',
                        hintStyle: TextStyle(color: AppColors.hintGrey))),
                TextFormField(
                    controller: areaController,
                    cursorColor: AppColors.blueColor,
                    decoration: InputDecoration(
                        label: appText('Area', fontSize: 16.px),
                        hintText: 'Select Area',
                        hintStyle: TextStyle(color: AppColors.hintGrey))),
                TextFormField(
                    controller: streetController,
                    cursorColor: AppColors.blueColor,
                    decoration: InputDecoration(
                        label: appText('Building/Street Name', fontSize: 16.px),
                        hintText: 'Building/Street Name',
                        hintStyle: TextStyle(color: AppColors.hintGrey))),
                TextFormField(
                    controller: areaController,
                    cursorColor: AppColors.blueColor,
                    decoration: InputDecoration(
                        label: appText('Appartment/Villa Number', fontSize: 16.px),
                        hintText: 'Appartment/Villa Number',
                        hintStyle: TextStyle(color: AppColors.hintGrey))),
                SizedBox(height: 20.px),
                roundButton(
                    onTap: () {
                      Navigator.pop(context);
                      showSuccessSnackbar(context, 'Address added successfully!');
                      showAppointmentBottomSheet(context);
                    },
                    title: 'Save')
              ],
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
