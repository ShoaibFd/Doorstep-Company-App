import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../bookings/quote_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appText('Notifications', fontSize: 18, fontWeight: FontWeight.w400),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const SizedBox(height: 8),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    width: double.maxFinite,
                    decoration:
                        BoxDecoration(color: AppColors.whiteTheme, borderRadius: BorderRadius.circular(6), boxShadow: [
                      BoxShadow(color: AppColors.grey300, offset: const Offset(1, 1), blurRadius: 1, spreadRadius: 1)
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const QuoteScreen()));
                        },
                        leading: const CustomContainer(
                            height: 60, width: 60, borderRadius: 6, color: AppColors.blackColor, child: SizedBox()),
                        title: appText('Notification Title', fontSize: 16, fontWeight: FontWeight.w400),
                        subtitle: appText('Partner just completed your job', color: AppColors.hintGrey),
                        trailing: appText('03:40', color: AppColors.hintGrey, fontSize: 12),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
