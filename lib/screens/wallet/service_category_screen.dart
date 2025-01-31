import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../ac_screens/ac_appliance_subcategory_bottom_sheet.dart';

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
                      return CustomContainer(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.black54,
                              clipBehavior: Clip.antiAlias,
                              builder: (BuildContext context) {
                                return AcApplianceSubcategoryBottomSheet(
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width,
                                );
                              },
                            );
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
