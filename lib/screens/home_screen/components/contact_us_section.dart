import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/custom_text.dart';

Widget contactUsSection(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appText('Contact us', fontSize: 20.px, fontWeight: FontWeight.bold),
          Row(
            children: [
              CircleAvatar(
                  maxRadius: 20.px,
                  backgroundColor: Colors.green.shade600,
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.phone, color: Colors.white, size: 26.px))),
              SizedBox(width: 20.px),
              Image.asset("assets/images/WhatsApp.png", height: 40.px),
              SizedBox(width: 10.px)
            ],
          )
        ],
      ));
}
