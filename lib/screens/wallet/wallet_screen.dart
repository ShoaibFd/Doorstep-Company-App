import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../account_screen/wallet_screen/coin_screen.dart';
import 'service_category_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isActive = true;
  bool isUsed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Wallet', fontSize: 20, fontWeight: FontWeight.bold),
        actions: [
          CustomContainer(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CoinScreen()));
              },
              color: AppColors.blueColor,
              borderColor: AppColors.grey300,
              borderRadius: 8,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 8,
                    children: [
                      Image.asset('assets/images/coin.png', height: 30),
                      appText('150', fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteTheme)
                    ],
                  ))),
          const SizedBox(width: 8)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.account_balance_wallet_outlined, color: AppColors.blueColor),
                const SizedBox(width: 20),
                appText('Rs. 100', fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blueColor)
              ],
            ),
            const SizedBox(height: 20),
            appText('Have a gift? Redeem it here.',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.blueColor,
                decoration: TextDecoration.underline),
            const SizedBox(height: 30),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainer(
                    onTap: () {
                      setState(() {
                        isActive = true;
                        isUsed = false;
                      });
                    },
                    height: 46,
                    width: 100,
                    borderRadius: 8,
                    color: isActive ? AppColors.blueColor : AppColors.grey300,
                    child: Center(
                        child: appText('Active',
                            color: isActive ? AppColors.whiteTheme : AppColors.blackColor,
                            fontWeight: FontWeight.bold))),
                CustomContainer(
                    onTap: () {
                      setState(() {
                        isActive = false;
                        isUsed = true;
                      });
                    },
                    height: 46,
                    width: 100,
                    borderRadius: 8,
                    color: isUsed ? AppColors.blueColor : AppColors.grey300,
                    child: Center(
                        child: appText('Used',
                            color: isUsed ? AppColors.whiteTheme : AppColors.blackColor, fontWeight: FontWeight.bold)))
              ],
            ),
            const SizedBox(height: 30),
            // Active Section
            isActive
                ? Column(
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          appText('Your Vouchers', fontSize: 18, fontWeight: FontWeight.w400),
                          Icon(Icons.info_outline, color: AppColors.hintGrey, size: 20),
                          const Spacer(),
                          appText('Rs.100', fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blueColor)
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomContainer(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const ServiceCategoryScreen()));
                          },
                          borderRadius: 10,
                          color: AppColors.blueColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              spacing: 6,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText('Rs. 100 OFF',
                                    fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteTheme),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    appText(
                                      'Any home service (excl. laundry)',
                                      color: AppColors.whiteTheme,
                                    ),
                                    CustomContainer(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const ServiceCategoryScreen()));
                                        },
                                        height: 30,
                                        width: 100,
                                        color: AppColors.whiteTheme,
                                        borderRadius: 6,
                                        child: Center(
                                          child: appText('Redeem Now', color: AppColors.blueColor),
                                        ))
                                  ],
                                ),
                                appText('Valid till: January 7, 2020', color: AppColors.whiteTheme)
                              ],
                            ),
                          ))
                    ],
                  )
                : const SizedBox(),
            // Used Section
            isUsed
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomContainer(
                              margin: const EdgeInsets.only(bottom: 10),
                              color: AppColors.blueColor,
                              borderRadius: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    appText(' Rs. 100 Redeemed',
                                        fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.whiteTheme),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText('Home Cleaning',
                                            fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.whiteTheme),
                                        CustomContainer(
                                          color: AppColors.whiteTheme,
                                          borderRadius: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: appText(
                                              'View details',
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    appText('Service At: 22 Feb 2020 at 03:40 PM',
                                        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.whiteTheme),
                                  ],
                                ),
                              ));
                        },
                      )
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
