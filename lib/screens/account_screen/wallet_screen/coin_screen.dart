import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import 'coins_to_rupees_screen.dart';
import 'history_section.dart';
import 'reward_section.dart';
import 'sent_to_wallet.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appText(
          'My coins',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                    color: AppColors.lowPurple.withOpacity(0.2),
                    borderColor: AppColors.lowPurple,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appText(
                                    'Your available reward coins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              CustomContainer(
                                height: 45,
                                width: 90,
                                borderRadius: 12,
                                color: AppColors.orangeShade,
                                child: Center(
                                  child: appText(
                                    '150',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteTheme,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            spacing: 6,
                            children: [
                              appText('Click to convert your Rewards into Rs', fontSize: 16),
                              const Icon(Icons.arrow_outward_outlined)
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset('assets/images/coins.png', height: 40),
                              // const SizedBox(width: 2),
                              CustomContainer(
                                  onTap: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => CoinsToRupeesScreen()));
                                  },
                                  width: 140,
                                  borderRadius: 4,
                                  color: AppColors.lowPurple.withOpacity(0.9),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        appText('Coin to Rs. ratio',
                                            fontSize: 18, color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          // const SizedBox(height: 10),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 10),
          TabBar(
            controller: tabController,
            labelColor: AppColors.orangeShade,
            dividerColor: AppColors.transparentColor,
            unselectedLabelColor: AppColors.hintGrey,
            indicatorColor: AppColors.orangeShade,
            tabs: const [
              Tab(text: 'Rewards'),
              Tab(text: 'History'),
              Tab(text: 'Sent to wallet'),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [RewardSection(), HistorySection(), SentToWalletSection()],
            ),
          ),
        ],
      ),
    );
  }
}
