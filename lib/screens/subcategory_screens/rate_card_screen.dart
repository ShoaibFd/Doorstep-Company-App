import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';

class RateCardScreen extends StatefulWidget {
  const RateCardScreen({super.key});

  @override
  State<RateCardScreen> createState() => _RateCardScreenState();
}

class _RateCardScreenState extends State<RateCardScreen> {
  List<RateCardData> rateCards = [
    RateCardData(
      title: 'Electrical Parts',
      subtitle: 'Labour Charges are capped at ₹499 per appliance',
      items: [
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
      ],
    ),
    RateCardData(
      title: 'Electrical Parts',
      subtitle: 'Labour Charges are capped at ₹499 per appliance',
      items: [
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
        ServiceItem(
          description: 'Non-Inverter PCB repaired',
          price: 1500,
          labour: 499,
          hasWarranty: true,
        ),
      ],
    ),
  ];

  void toggleExpansion(int index) {
    setState(() {
      rateCards[index].isExpanded = !rateCards[index].isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(140.px),
            child: Container(
              color: AppColors.blackColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 16.px,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back, color: AppColors.whiteTheme)),
                      appText('Doorstep Company', color: AppColors.whiteTheme, fontSize: 20.px)
                    ],
                  ),
                  SizedBox(height: 50.px),
                  Padding(
                    padding: EdgeInsets.only(left: 20.px),
                    child:
                        appText('Rate Card', color: AppColors.whiteTheme, fontSize: 18.px, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: AppColors.whiteTheme, boxShadow: [
                BoxShadow(
                  offset: Offset(1, -1),
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: AppColors.blueShade, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: appText(
                        'Labour charges are capped based on service category',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                itemCount: rateCards.length,
                itemBuilder: (context, cardIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.whiteTheme,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(1, 3),
                            color: AppColors.greyColor,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.px),
                            decoration: const BoxDecoration(
                                color: AppColors.blackColor,
                                borderRadius:
                                    BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      appText(
                                        rateCards[cardIndex].title,
                                        color: AppColors.whiteTheme,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    rateCards[cardIndex].isExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: AppColors.whiteTheme,
                                  ),
                                  onPressed: () => toggleExpansion(cardIndex),
                                ),
                              ],
                            ),
                          ),
                          if (rateCards[cardIndex].isExpanded)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: rateCards[cardIndex].items.length,
                              itemBuilder: (context, itemIndex) {
                                final item = rateCards[cardIndex].items[itemIndex];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.px,
                                    vertical: 4.px,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(child: appText(item.description)),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              appText('Rs.${item.price.toStringAsFixed(0)}', fontSize: 16),
                                              appText('Labour: Rs.${item.labour.toStringAsFixed(0)}',
                                                  fontSize: 12, color: AppColors.hintGrey),
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (itemIndex != rateCards[cardIndex].items.length - 1) const Divider(height: 16),
                                    ],
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// Data Models
class ServiceItem {
  final String description;
  final double price;
  final double labour;
  final bool hasWarranty;
  int quantity;

  ServiceItem({
    required this.description,
    required this.price,
    required this.labour,
    required this.hasWarranty,
    this.quantity = 0,
  });
}

class RateCardData {
  final String title;
  final String subtitle;
  final List<ServiceItem> items;
  bool isExpanded;

  RateCardData({
    required this.title,
    required this.subtitle,
    required this.items,
    this.isExpanded = true,
  });
}
