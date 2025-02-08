import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_text.dart';
import '../../wallet/wallet_screen.dart';

class SentToWalletSection extends StatelessWidget {
  const SentToWalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WalletScreen()));
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: AppColors.whiteTheme,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(1, 1), blurRadius: 1, color: AppColors.grey300, spreadRadius: 1)
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ListTile(
                              title: appText('Rs. 100', fontWeight: FontWeight.bold, fontSize: 16),
                              subtitle: Row(
                                spacing: 6,
                                children: [
                                  Row(
                                    children: [
                                      appText('Date: ', fontWeight: FontWeight.bold),
                                      appText(' 25 Feb, 2022', color: AppColors.hintGrey),
                                    ],
                                  )
                                ],
                              ),
                              leading: const Icon(Icons.emoji_events_outlined, color: AppColors.redColor, size: 40),
                              trailing: const Icon(Icons.chevron_right, color: AppColors.redColor)))),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
