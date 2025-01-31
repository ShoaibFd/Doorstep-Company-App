import 'package:flutter/material.dart';

import '../../subcategory_screens/Widgets/offers_container_widget.dart';

Widget offerSection() {
  return const SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        OffersContainers(
          title: 'Amazon cashback upto Rs. 50',
          subtitle: 'Get cashback via Amazon pay',
        ),
        OffersContainers(
          title: 'Amazon cashback upto Rs. 50',
          subtitle: 'Get cashback via Amazon pay',
        ),
      ],
    ),
  );
}
