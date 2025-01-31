import 'package:flutter/material.dart';

import '../../widgets/custom_snackbar.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/round_button.dart';
import '../bookings/accepted_booking_detail_screen.dart';

void showCashPaymentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(
                        'Are you sure you want to proceed with cash\npayment?',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey.shade300)),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      appText('15% off on Kotak Credit card', fontWeight: FontWeight.bold),
                                      appText('15% off up to INR 250', color: Colors.grey),
                                    ],
                                  )))),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: const Center(child: Icon(Icons.credit_card, color: Colors.grey))))
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Theme.of(context).primaryColor),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                              child: const Text('Pay online instead'))),
                      const SizedBox(width: 8),
                      Expanded(
                        child: roundButton(
                          height: 40,
                          width: 130,
                          title: 'Proceed anyway',
                          onTap: () {
                            showSuccessSnackbar(context, 'Creating your booking...');
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const AcceptedBookingDetailScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                  top: -70,
                  right: 10,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.close))))
            ],
          ));
    },
  );
}
