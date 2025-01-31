import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/custom_text.dart'; // Import for Clipboard functionality

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  final String personalLink = 'https://www.watsonwolfe.com/wp-content';

  // Copy to Clipboard Function
  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    showSuccessSnackbar(context, 'URL copied to clipboard successfully!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appText('Invite a friend', fontSize: 18, fontWeight: FontWeight.w400),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomContainer(
              height: 200.px,
              width: double.maxFinite,
              borderRadius: 0,
              color: AppColors.grey300,
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://www.watsonwolfe.com/wp-content/uploads/2020/04/wpsso-main-what-makes-a-wallet.jpg'),
                  fit: BoxFit.cover),
              child: const SizedBox()),
          const SizedBox(height: 20),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appText('INVITE A FRIEND, GET', fontSize: 20, fontWeight: FontWeight.w400),
              CustomContainer(
                color: AppColors.transparentColor,
                borderColor: AppColors.orangeColor,
                borderRadius: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: appText('Rs. 30', fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.orangeColor),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          appText(
              'Give a friend Rs.30 when they sign up using\nyour personal link and get Rs. 30 when their\njob is completed.',
              color: AppColors.hintGrey,
              fontSize: 16),
          const SizedBox(height: 30),
          appText('Share your personal link with your friend', color: AppColors.hintGrey, fontSize: 16),
          const SizedBox(height: 20),
          appText(personalLink, color: AppColors.blueShade),
          const SizedBox(height: 10),
          InkWell(
            onTap: () => copyToClipboard(context, personalLink), // Call the copy function
            child: appText('Copy this URL', color: AppColors.blueShade),
          ),
          const Spacer(),
          CustomContainer(
            height: 60,
            width: double.maxFinite,
            borderRadius: 0,
            color: AppColors.orangeColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.logout_rounded,
                  color: AppColors.whiteTheme,
                ),
                appText('INVITE FRIEND', color: AppColors.whiteTheme, fontSize: 18, fontWeight: FontWeight.bold),
              ],
            ),
          )
        ],
      ),
    );
  }
}
