import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';

Widget searchBarSection(BuildContext context) {
  //  controllers
  final searchController = TextEditingController();
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey300), borderRadius: BorderRadius.circular(10.px)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey300), borderRadius: BorderRadius.circular(10.px)),
                  hintText: 'Search For Service',
                  prefixIcon: Icon(Icons.search_rounded, color: AppColors.hintGrey, size: 24.px),
                  suffixIcon: Icon(Icons.mic, size: 24.px, color: AppColors.hintGrey)))
        ],
      ));
}
