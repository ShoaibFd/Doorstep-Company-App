import 'package:flutter/material.dart';

void showClaimOrderModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      double height = MediaQuery.sizeOf(context).height;
      double width = MediaQuery.sizeOf(context).width;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text(
                  'Service Warranty',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: height * 0.65,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.green.shade50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '30-Day Warranty Coverage',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: height * 0.030),
                          const Text(
                            'Your repair is covered under a 30-day warranty with the following benefits:',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: height * 0.030),
                          Row(
                            children: [
                              const Icon(Icons.build, color: Colors.green, size: 28),
                              SizedBox(width: width * 0.020),
                              const Expanded(
                                child: Text(
                                  'Free repair if the same issue arises within 30 days.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.030),
                          Row(
                            children: [
                              const Icon(Icons.bolt, color: Colors.green, size: 28),
                              SizedBox(width: width * 0.020),
                              const Expanded(
                                child: Text(
                                  'One-click hassle-free claims process.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.030),
                          Row(
                            children: [
                              const Icon(Icons.recycling, color: Colors.green, size: 28),
                              SizedBox(width: width * 0.020),
                              const Expanded(
                                child: Text(
                                  'Up to PKR 10,000 coverage for any damage during repair.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Add claim initiation functionality here
                                print("Claim button pressed");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Claim',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -50,
            right: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      );
    },
  );
}
