import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';

class WarrantyScreen extends StatefulWidget {
  const WarrantyScreen({super.key});

  @override
  _WarrantyScreenState createState() => _WarrantyScreenState();
}

class _WarrantyScreenState extends State<WarrantyScreen> {
  String? selectedCity;
  final List<String> cities = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Faisalabad',
    'Rawalpindi',
    'Multan',
    'Peshawar',
    'Quetta',
    'Hyderabad',
    'Gujranwala',
    // Add more cities as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Warranty', fontSize: 20.px, fontWeight: FontWeight.bold)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText('Get warranty from nearest authorized service center of the company.',
                  fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 20.px),
              Center(
                child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey300), borderRadius: BorderRadius.circular(2.0)),
                    child: DataTable(
                        headingRowColor: WidgetStateProperty.resolveWith(
                          (states) => AppColors.whiteTheme,
                        ),
                        columns: [
                          DataColumn(label: appText('Item', fontWeight: FontWeight.bold)),
                          DataColumn(label: appText('Model', fontWeight: FontWeight.bold)),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(appText('Model')),
                              DataCell(appText('Ac invertor')),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(appText('Model')),
                              DataCell(appText('Ac invertor')),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(appText('Model')),
                              DataCell(appText('Ac invertor')),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(appText('Model')),
                              DataCell(appText('Ac invertor')),
                            ],
                          ),
                        ],
                        border: TableBorder.all(color: AppColors.grey300))),
              ),
              const SizedBox(height: 20),
              CustomContainer(
                  borderRadius: 8.px,
                  borderColor: AppColors.grey300,
                  color: AppColors.grey300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText('Select your city', fontSize: 16),
                        DropdownButton<String>(
                          underline: const SizedBox.shrink(),
                          dropdownColor: AppColors.whiteTheme,
                          value: selectedCity,
                          hint: appText('Choose a city'),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCity = newValue;
                            });
                          },
                          items: cities.map<DropdownMenuItem<String>>((String city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: appText(city),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 20.px),
              appText('Islamabad Service Center', fontSize: 16, fontWeight: FontWeight.bold),
              SizedBox(height: 10.px),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 16.px),
                        child: Row(
                          spacing: 6,
                          children: [
                            CircleAvatar(
                                radius: 8,
                                backgroundColor: AppColors.blackColor,
                                child: appText("${index + 1}", color: AppColors.whiteTheme, fontSize: 12)),
                            SizedBox(width: 2.px),
                            appText('ABC service center', fontWeight: FontWeight.bold)
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(left: 45.px),
                        child: appText('Shop no.2, Business city plaza, Bosan road Multan ', color: AppColors.hintGrey),
                      ),
                      const SizedBox(height: 6)
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              appText('About Warranty', fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              CustomContainer(
                  height: 60.px,
                  width: 60.px,
                  borderRadius: 4,
                  color: AppColors.transparentColor,
                  image: const DecorationImage(image: AssetImage('assets/images/document.png')),
                  child: const SizedBox()),
              const SizedBox(height: 4),
              CustomContainer(
                  width: 120,
                  borderRadius: 4,
                  color: AppColors.blueColor,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(child: appText('Download PDF', color: AppColors.whiteTheme)),
                  )),
              SizedBox(height: 10.px)
            ],
          ),
        ),
      ),
    );
  }
}
