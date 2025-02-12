import 'package:doorstep_company_app/screens/language/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../components/custom_snackbar.dart';
import '../../components/app_text.dart';
import '../bookings/cancel_booking/refund/refund_status_screen.dart';
import '../cart_screen/benefits_screen.dart';
import '../notification_screen/notification_screen.dart';
import '../wallet/wallet_screen.dart';
import 'about_us_screen.dart';
import 'edit_profile_screen.dart';
import 'privacy_policy_screen.dart';
import 'review_app_dialog.dart';
import 'reward_screen.dart';
import 'saved_location_screen.dart';
import 'terms_and_conditions_screen.dart';
import 'wallet_screen/coin_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

// Rating dialog
  void showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const RatingDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: appText('MY ACCOUNT', fontSize: 20, fontWeight: FontWeight.bold)),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.to(EditProfileScreen());
                },
                child: Container(
                  height: 70,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.whiteTheme,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: AppColors.grey300, blurRadius: 1, offset: const Offset(1, 1), spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwMzQtZWxlbWVudC0wNi0zOTcucG5n.png'),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.grey300))),
                        const SizedBox(width: 6),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appText('Shoaib Lodhra',
                                fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.blueColor),
                            appText('Multan, Pakistan', color: AppColors.hintGrey)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.whiteTheme,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(offset: const Offset(0, 1), blurRadius: 1, color: AppColors.grey300, spreadRadius: 1)
                      ]),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          listTile(
                              onTap: () {
                                Get.to(const WalletScreen());
                              },
                              title: 'Wallet',
                              icon: Icons.account_balance_wallet_outlined,
                              optionalText: 'Rs. 30.0'),
                          Divider(color: AppColors.grey300),
                          listTile(
                            onTap: () {
                              Get.to(BenefitsScreen(isPlus: true));
                            },
                            title: 'Plus membership',
                            icon: Icons.card_membership_outlined,
                          ),
                          Divider(color: AppColors.grey300),
                          listTile(
                            onTap: () {
                              //  Get.to(const WalletScreen());
                            },
                            title: 'Subscription packages',
                            icon: Icons.card_membership_outlined,
                          ),
                          Divider(color: AppColors.grey300),
                          listTile(
                            onTap: () {
                              Get.to(const RefundStatusScreen());
                            },
                            title: 'Refund',
                            icon: Icons.account_balance_wallet_outlined,
                          ),
                          Divider(color: AppColors.grey300),
                          listTile(
                              onTap: () {
                                Get.to(const SavedLocationScreen());
                              },
                              title: 'Save locations',
                              icon: Icons.place_outlined),
                          Divider(color: AppColors.grey300),
                          listTile(
                              onTap: () {
                                Get.to(const NotificationScreen());
                              },
                              title: 'Notifications',
                              icon: Icons.notifications),
                          Divider(color: AppColors.grey300),
                          listTile(
                              onTap: () {
                                Get.to(const RewardScreen());
                              },
                              title: 'Invite a friend',
                              icon: Icons.share_rounded,
                              optionalText: 'Get Rs.30 Credit'),
                          Divider(color: AppColors.grey300),
                          listTile(
                              onTap: () {
                                Get.to(const CoinScreen());
                              },
                              optionalText: '100 coins available',
                              title: 'Reward',
                              icon: Icons.card_giftcard),
                          Divider(color: AppColors.grey300),
                          listTile(
                              onTap: () {
                                //  Get.to(const WalletScreen());
                              },
                              title: 'Track location of professional',
                              icon: Icons.place_outlined),
                          Divider(color: AppColors.grey300),
                          listTile(
                              onTap: () {
                                Get.to(LanguageScreen(onChecked: true));
                              },
                              title: 'Languages',
                              icon: Icons.language),
                        ],
                      ))),
              const SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.whiteTheme,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(offset: const Offset(0, 1), blurRadius: 1, color: AppColors.grey300, spreadRadius: 1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      listTile(
                          onTap: () {
                            Get.to(const AboutUsScreen());
                          },
                          title: 'About Us',
                          icon: Icons.info_outline),
                      Divider(color: AppColors.grey300),
                      listTile(
                        onTap: () {
                          Get.to(const TermsAndConditionsScreen());
                        },
                        title: 'Terms & conditions',
                        icon: Icons.description,
                      ),
                      Divider(color: AppColors.grey300),
                      listTile(title: 'Payment and refund policy', icon: Icons.article),
                      Divider(color: AppColors.grey300),
                      listTile(
                          onTap: () {
                            Get.to(const PrivacyPolicyScreen());
                          },
                          title: 'Privacy Policy',
                          icon: Icons.security_rounded),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.whiteTheme,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(offset: const Offset(0, 1), blurRadius: 1, color: AppColors.grey300, spreadRadius: 1)
                      ]),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          listTile(
                              onTap: () {
                                showRatingDialog(context);
                              },
                              title: 'Review the app',
                              icon: Icons.favorite_border),
                          Divider(color: AppColors.grey300),
                          listTile(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomAlertDialog(
                                    title: 'Sign out',
                                    onConfirm: () {
                                      Get.back();
                                      showSuccessSnackbar(context, 'Sign out successfully!');
                                    },
                                    onCancel: () {
                                      Get.back();
                                    },
                                    cancelText: 'Cancle',
                                    confirmText: 'YES',
                                    content: 'Do you really want to sign out?',
                                  );
                                },
                              );
                            },
                            title: 'Sign Out',
                            icon: Icons.logout,
                          ),
                        ],
                      ))),
              const SizedBox(height: 10)
            ],
          ),
        )));
  }
}

// ListTile Widget
Widget listTile({required String title, required IconData icon, String? optionalText, VoidCallback? onTap}) {
  return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appText(title, fontSize: 15),
          if (optionalText != null) appText(optionalText, color: AppColors.orangeColor, fontWeight: FontWeight.bold),
        ],
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.greyColor));
}
