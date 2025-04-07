import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class BookingAndTrackOrder extends StatefulWidget {
  const BookingAndTrackOrder({super.key});

  @override
  State<BookingAndTrackOrder> createState() => _BookingAndTrackOrderState();
}

class _BookingAndTrackOrderState extends State<BookingAndTrackOrder>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Booking> completedBookings = [
    Booking(
      bookingNumber: 100001,
      bookingDate: '10 Oct, 2023 17:09',
      serviceDate: '10 Oct, 2023 20:08',
      totalAmount: 'PKR1,678.96',
      status: 'Completed',
    ),
    Booking(
      bookingNumber: 100000,
      bookingDate: '10 Oct, 2023 16:19',
      serviceDate: '13 Oct, 2023 15:18',
      totalAmount: 'PKR2,987.95',
      status: 'Completed',
    ),
  ];

  // final List<Booking> cancelledBookings = [
  //   Booking(
  //     bookingNumber: 100004,
  //     bookingDate: '10 Oct, 2023 15:00',
  //     serviceDate: '11 Oct, 2023 12:00',
  //     totalAmount: 'PKR1,000.00',
  //     status: 'Cancelled',
  //   ),
  // ];
  final List<Booking> tackBooking = [
    Booking(
      bookingNumber: 100004,
      bookingDate: '10 Oct, 2023 15:00',
      serviceDate: '11 Oct, 2023 12:00',
      totalAmount: 'PKR1,000.00', status: 'Track order',
      // status: 'Cancelled',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Booking'),
            Tab(text: 'Track Order'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildBookingList(
              completedBookings,
              height,
              width,
            ),
            _buildBookingList(tackBooking, height, width),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingList(
      List<Booking> bookings, double height, double width) {
    return Expanded(
      child: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BookingCard(booking: bookings[index]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: height * 0.042,
                        width: width * 0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bookings[index].status == 'Completed'
                              ? AppColors.orangeColor
                              : AppColors
                                  .greenColor, // Use red for cancelled status
                        ),
                        child: Center(
                          child: Text(
                            bookings[index].status,
                            style: const TextStyle(
                                color:
                                    Colors.white), // White for cancelled status
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.080),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class Booking {
  final int bookingNumber;
  final String bookingDate;
  final String serviceDate;
  final String totalAmount;
  final String status;

  Booking({
    required this.bookingNumber,
    required this.bookingDate,
    required this.serviceDate,
    required this.totalAmount,
    required this.status,
  });
}

class BookingCard extends StatelessWidget {
  final Booking booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Booking# ${booking.bookingNumber}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text('Booking Date: ${booking.bookingDate}'),
          Text('Service Date: ${booking.serviceDate}'),
          Text('Total amount: ${booking.totalAmount}',
              style: const TextStyle(
                  color: AppColors.blueColor, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
