import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/app_text.dart';
import '../../components/custom_container.dart';
import '../../theme/colors.dart';
import '../../utils/shared_prefs.dart';
import '../ac_screens/components/ac_appliance_bottom_sheet.dart';

class ServiceCategoryScreen extends StatelessWidget {
  const ServiceCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText('Any Home Service (excl. laundry)', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 10.px),
              appText('Select a service', color: AppColors.hintGrey),
            ],
          )),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
                  ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final sharedPrefs = SharedPrefs();
                      return CustomContainer(
                          onTap: () async {
                            acAppliancesBottomSheet(context);
                          },
                          margin: EdgeInsets.only(bottom: 10.px),
                          color: AppColors.grey300.withOpacity(0.3),
                          borderRadius: 10.px,
                          child: Padding(
                              padding: EdgeInsets.all(10.px),
                              child: Row(
                                spacing: 8.px,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset('assets/images/air-conditioner.png', height: 50.px)),
                                  appText('Home cleaning', fontSize: 18.px, fontWeight: FontWeight.bold)
                                ],
                              )));
                    },
                  )
                ],
              )))),
    );
  }
}
