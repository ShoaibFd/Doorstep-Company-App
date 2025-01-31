import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'completed_offers/categories_screen.dart';
import 'offer_screen.dart';

class OffersTabbarScreen extends StatefulWidget {
  const OffersTabbarScreen({super.key});

  @override
  State<OffersTabbarScreen> createState() => _OffersTabbarScreenState();
}

class _OffersTabbarScreenState extends State<OffersTabbarScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TabBar(
          controller: _tabController,
          dividerColor: AppColors.transparentColor,
          labelColor: AppColors.whiteTheme,
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          unselectedLabelColor: AppColors.blackColor,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.blueColor,
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 12),
          tabs: [
            Container(
                width: 200,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: _tabController.index == 0 ? Colors.transparent : AppColors.grey300, width: 1)),
                child: const Tab(text: 'Offers')),
            Container(
                width: 200,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: _tabController.index == 1 ? Colors.transparent : AppColors.grey300, width: 1)),
                child: const Tab(text: 'Orders')),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: const [
            OfferScreen(),
            CategoriesScreen(),
          ],
        ))
      ],
    )));
  }
}
