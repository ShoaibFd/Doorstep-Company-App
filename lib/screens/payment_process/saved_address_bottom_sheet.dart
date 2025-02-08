import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/custom_text.dart';
import '../../components/round_button.dart';
import 'address_bottom_sheet.dart';

void savedAddressSheet(BuildContext context) {
  int address = 0; // Added to track selected address

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Enable full-height bottom sheet
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.px),
      ),
    ),
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.9, // Set to 90% of screen height
        child: StatefulBuilder(
          // Added to handle state changes
          builder: (BuildContext context, StateSetter setState) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.whiteTheme,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.px),
                      topRight: Radius.circular(16.px),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 8.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        appText(
                          'Saved addresses',
                          fontSize: 18.px,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 20.px),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.px))),
                              builder: (context) {
                                return const FractionallySizedBox(
                                  heightFactor: 0.9,
                                  child: AddressBottomSheet(),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.add,
                                color: AppColors.lowPurple,
                                size: 20,
                              ),
                              SizedBox(width: 10.px),
                              appText(
                                'Add another address',
                                fontSize: 16.px,
                                color: AppColors.lowPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.px),
                        const Divider(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 3,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.px),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Radio<int>(
                                          activeColor: AppColors.lowPurple,
                                          value: index + 1,
                                          groupValue: address,
                                          onChanged: (value) {
                                            setState(() {
                                              address = value!;
                                            });
                                          },
                                        ),
                                        appText(
                                          'Home',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            // Handle more options
                                          },
                                          icon: const Icon(Icons.more_vert),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 48),
                                      child: appText(
                                        'Flat 10, Bandra West, Mumbai\nMaharashtra, India',
                                        color: AppColors.hintGrey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: roundButton(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return const AddressBottomSheet();
                                      });
                                },
                                title: 'Proceed'))
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
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
