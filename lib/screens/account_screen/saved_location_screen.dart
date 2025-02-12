import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../components/app_text.dart';

class SavedLocationScreen extends StatelessWidget {
  const SavedLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Saved location', fontSize: 20, fontWeight: FontWeight.w400),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.whiteTheme,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: AppColors.grey300, offset: const Offset(1, 1), blurRadius: 1, spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText('Home', fontWeight: FontWeight.bold),
                        appText('Sabzazar, Near Ideal Mall, Maxcore House , Multan', color: AppColors.hintGrey),
                        const SizedBox(height: 8),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.edit_location_alt_sharp, color: AppColors.greenColor),
                                const SizedBox(width: 8),
                                appText('Edit', fontWeight: FontWeight.bold, color: AppColors.hintGrey)
                              ],
                            ),
                            Container(
                              height: 24,
                              width: 2,
                              color: AppColors.hintGrey,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.delete_forever_rounded, color: AppColors.redColor),
                                const SizedBox(width: 8),
                                appText('Delete', fontWeight: FontWeight.bold, color: AppColors.hintGrey)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.whiteTheme,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: AppColors.grey300, blurRadius: 1, offset: const Offset(1, 1), spreadRadius: 1)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText('Add New Address', fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.darkGreen),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.darkGreen,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
