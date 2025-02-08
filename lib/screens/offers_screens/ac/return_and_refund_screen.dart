import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ReturnAndRefundScreen extends StatelessWidget {
  const ReturnAndRefundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: AppColors.whiteTheme,
          title: const Text("Returns & Refunds"),
          backgroundColor: AppColors.darkBlueShade),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Return and Refund Policy"),
            const SizedBox(height: 8.0),
            sectionText(
                "If your product is damaged, defective, incorrect, or incomplete at the time of delivery, please raise a return request on PakWheels by calling 042-111-943-357. Return requests must be raised within 5 days from the date of delivery for all items."),
            const SizedBox(height: 16.0),
            sectionTitle("Valid Reasons to Return an Item:"),
            const SizedBox(height: 8.0),
            bulletList([
              "The delivered product is damaged (e.g., destroyed or broken) or defective (e.g., unable to switch on).",
              "The delivered product is incomplete (e.g., missing items and/or accessories).",
              "The delivered product is incorrect (e.g., wrong product/size/color, fake item, or expired).",
              "The delivered product does not match the product description or picture (e.g., product not as advertised).",
              "The delivered product does not fit (e.g., size is unsuitable).",
            ]),
            const SizedBox(height: 16.0),
            sectionTitle("How to Pack Your Return Parcel:"),
            const SizedBox(height: 8.0),
            bulletList([
              "The product must be returned in the original and undamaged manufacturer packaging/box.",
              "Ensure it is returned in the same condition as received.",
              "Do not put tape or stickers on the manufacturer's box.",
            ]),
            const SizedBox(height: 16.0),
            sectionTitle("Replacement Timeline:"),
            const SizedBox(height: 8.0),
            sectionText(
                "Your order will be replaced within 3 to 5 working days, though this may vary depending on the nature of the product and the location of the customer."),
            const SizedBox(height: 16.0),
            sectionTitle("Refund Timeline:"),
            const SizedBox(height: 8.0),
            sectionText("Refunds will be processed within 3 to 5 working days through your original payment method."),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  Widget sectionText(String text) {
    return Text(text, style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5));
  }

  Widget bulletList(List<String> items) {
    return Column(
      children: List.generate(items.length, (index) {
        return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.grey300.withOpacity(0.3),
                    child: Text("${index + 1}", style: const TextStyle(fontSize: 12))),
                const SizedBox(width: 12.0),
                Expanded(
                    child: Text(items[index], style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5)))
              ],
            ));
      }),
    );
  }
}
