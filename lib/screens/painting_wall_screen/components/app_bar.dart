import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/app_text.dart';

PreferredSizeWidget appBar() {
  return PreferredSize(
      preferredSize: Size.fromHeight(70.px),
      child: AppBar(
        title: appText('Rooms/walls painting', fontSize: 18.px, fontWeight: FontWeight.w400),
        actions: [
          Container(
              height: 40.px,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.px), border: Border.all(color: AppColors.grey300)),
              child: Padding(
                padding: EdgeInsets.all(8.px),
                child: Center(child: appText('Book Consult')),
              )),
          SizedBox(width: 10.px),
          GestureDetector(
              onTap: () {},
              child: Container(
                  height: 40.px,
                  width: 44.px,
                  decoration: BoxDecoration(border: Border.all(color: AppColors.grey300), shape: BoxShape.circle),
                  child: Icon(Icons.search, size: 20.px))),
          GestureDetector(
              onTap: () {},
              child: Container(
                  height: 40.px,
                  width: 44.px,
                  decoration: BoxDecoration(border: Border.all(color: AppColors.grey300), shape: BoxShape.circle),
                  child: Icon(Icons.share, size: 20.px))),
          SizedBox(width: 10.px)
        ],
      ));
}
