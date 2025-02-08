import 'package:doorstep_company_app/components/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/custom_text.dart';
import '../../components/round_button.dart';
import '../../constants/colors.dart';
import '../payment_method/payment_method_screen.dart';
import 'components/professional_section.dart';

// Main Bottom Sheet Widget
class AppointmentScreen extends StatefulWidget {
  final double height;
  final double width;
  final void Function(bool) onCheckoutStatusChanged;
  const AppointmentScreen(
      {super.key, required this.height, required this.width, required this.onCheckoutStatusChanged});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String? selectedDate;
  String? selectedTime;
  String? selectedProfessional;
  bool isCheckingOut = false;
  int isSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          decoration: BoxDecoration(
              color: AppColors.whiteTheme,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.px), topRight: Radius.circular(20.px))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                  margin: EdgeInsets.symmetric(vertical: 12.px),
                  height: 4.px,
                  width: 40.px,
                  decoration: BoxDecoration(color: AppColors.grey300, borderRadius: BorderRadius.circular(2))),

              // Main content
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              professionalSection(
                                context: context,
                                selectedProfessional: selectedProfessional,
                                onProfessionalSelected: (selected) {
                                  setState(() {
                                    selectedProfessional = selected;
                                  });
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomContainer(
                                  color: AppColors.transparentColor,
                                  borderColor: AppColors.grey300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.access_alarm, size: 30, color: AppColors.deepOrangeColor),
                                        SizedBox(width: 20.px),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              appText('Get urgent service',
                                                  color: AppColors.darkGreen,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                              const SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  appText('In 80-90 minuts', fontWeight: FontWeight.bold),
                                                  SizedBox(
                                                    height: 20.px,
                                                    child: Radio(
                                                        activeColor: AppColors.blackColor,
                                                        value: 1,
                                                        groupValue: isSelected,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            isSelected = value!;
                                                          });
                                                        }),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                spacing: 8,
                                                children: [
                                                  appText('Rs.30',
                                                      decoration: TextDecoration.lineThrough,
                                                      color: AppColors.hintGrey),
                                                  appText('FREE',
                                                      color: AppColors.darkGreen,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12)
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              const SizedBox(height: 26),
                              appText("Select service date", fontSize: 18.px, fontWeight: FontWeight.bold),
                              appText("that fits your schedule",
                                  fontSize: 14.5.px, fontWeight: FontWeight.bold, color: AppColors.deepOrangeColor),
                              SizedBox(height: 10.px),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  spacing: 14,
                                  children: [
                                    DateCard(
                                        day: "Tue",
                                        date: "07",
                                        selected: selectedDate == "Tue",
                                        onTap: () => setState(() => selectedDate = "Tue")),
                                    DateCard(
                                        day: "Wed",
                                        date: "08",
                                        selected: selectedDate == "Wed",
                                        onTap: () => setState(() => selectedDate = "Wed")),
                                    DateCard(
                                        day: "Thu",
                                        date: "09",
                                        selected: selectedDate == "Thu",
                                        onTap: () => setState(() => selectedDate = "Thu")),
                                    DateCard(
                                        day: "Fri",
                                        date: "10",
                                        selected: selectedDate == "Fri",
                                        onTap: () => setState(() => selectedDate = "Fri")),
                                    DateCard(
                                        day: "Sat",
                                        date: "11",
                                        selected: selectedDate == "Sat",
                                        onTap: () => setState(() => selectedDate = "Sat")),
                                    DateCard(
                                        day: "Sun",
                                        date: "12",
                                        selected: selectedDate == "Sun",
                                        onTap: () => setState(() => selectedDate = "Sun")),
                                    DateCard(
                                        day: "Mon",
                                        date: "13",
                                        selected: selectedDate == "Mon",
                                        onTap: () => setState(() => selectedDate = "Mon")),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.px),
                              appText('Select start time of service', fontSize: 18.px, fontWeight: FontWeight.bold),
                              SizedBox(height: 20.px),
                              SizedBox(
                                height: 220,
                                child: Stack(
                                  children: [
                                    GridView.count(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 16.px,
                                      mainAxisSpacing: 14.px,
                                      childAspectRatio: 2.5,
                                      children: [
                                        "08:30 AM",
                                        "12:00 PM",
                                        "12:30 PM",
                                        "01:00 PM",
                                        "01:30 PM",
                                        "02:00 PM",
                                        "02:30 PM",
                                        "03:00 PM",
                                        "03:30 PM",
                                        "04:00 PM",
                                        "04:30 PM",
                                        "05:00 PM",
                                      ]
                                          .map((time) => TimeSlotCard(
                                                time: time,
                                                selected: selectedTime == time,
                                                onTap: () => setState(() => selectedTime = time),
                                              ))
                                          .toList(),
                                    ),
                                    Positioned(
                                      top: 50,
                                      left: 50,
                                      child: Container(
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: AppColors.orangeColor.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Center(
                                            child: appText('+ Rs.100'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.px),
                              Row(
                                children: [
                                  const Icon(Icons.info_outline, color: AppColors.blackColor),
                                  SizedBox(width: 8.px),
                                  Expanded(
                                      child: appText(
                                          "Free cancellation till 2 hrs before the booked slot, post that pkr 50 chargeable")),
                                ],
                              ),
                              SizedBox(height: 20.px),
                            ],
                          )))),
            ],
          )),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: roundButton(
              title: 'Proceed ',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentMethodScreen()));
              }),
        ),
      ),
      Positioned(
          top: -50.px,
          right: 16.px,
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.close)))),
    ]);
  }
}

// Date Card Widget
class DateCard extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;
  final VoidCallback onTap;

  const DateCard({
    super.key,
    required this.day,
    required this.date,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
                color: selected ? AppColors.lowPurple.withOpacity(0.2) : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: selected ? AppColors.lowPurple : AppColors.grey300)),
            child: Column(
              children: [
                appText(day, color: AppColors.blackColor),
                const SizedBox(height: 4),
                appText(date, color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.bold)
              ],
            )));
  }
}

// Time Slot Card Widget
class TimeSlotCard extends StatelessWidget {
  final String time;
  final bool selected;
  final VoidCallback onTap;

  const TimeSlotCard({
    super.key,
    required this.time,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8.px),
            decoration: BoxDecoration(
                color: selected ? AppColors.lowPurple.withOpacity(0.2) : Colors.white,
                border: Border.all(color: selected ? AppColors.lowPurple : AppColors.grey300),
                borderRadius: BorderRadius.circular(8)),
            child: appText(time, fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.blackColor)));
  }
}

// Professional Tile Widget
Widget professionalTile(
  BuildContext context, {
  required String name,
  required String imagePath,
  bool isAvailable = true,
  bool isSelected = false,
  double? rating,
}) {
  final size = MediaQuery.of(context).size;

  return Column(
    children: [
      Stack(
        children: [
          CircleAvatar(
              radius: size.width * 0.12, backgroundImage: AssetImage(imagePath), backgroundColor: Colors.grey.shade200),
          if (!isAvailable)
            Container(
                width: size.width * 0.24,
                height: size.width * 0.24,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.7), shape: BoxShape.circle),
                child: Center(
                    child: appText("Unavailable", textAlign: TextAlign.center, fontSize: 12, color: Colors.black54))),
        ],
      ),
      SizedBox(height: size.height * 0.01),
      appText(name, fontSize: size.height * 0.018, color: Colors.black87, textAlign: TextAlign.center),
      if (rating != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 14),
            appText(rating.toString(), fontSize: size.height * 0.015, color: Colors.black54),
          ],
        ),
    ],
  );
}

// Function to show the bottom sheet
void showAppointmentBottomSheet(BuildContext context) {
  double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => AppointmentScreen(
              height: height * 0.9,
              width: width,
              onCheckoutStatusChanged: (bool status) {},
            )),
  );
}
