import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../custom_snackbar.dart';
import '../app_text.dart';
import 'threading.dart';
import 'waxing.dart';
import 'waxing_row_widget.dart';

void showEditPackageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    builder: (context) => const EditPackageBottomSheet(),
  );
}

class EditPackageBottomSheet extends StatefulWidget {
  const EditPackageBottomSheet({super.key});

  @override
  State<EditPackageBottomSheet> createState() => _EditPackageBottomSheetState();
}

class _EditPackageBottomSheetState extends State<EditPackageBottomSheet> {
  Map<String, bool> sectionChecks = {
    'waxing': false,
    'manicure': false,
    'pedicure': false,
    'facial': false,
    'hairSpa': false,
    'bleach': false,
    'threading': false,
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            height: height * 0.85,
            decoration:
                const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.deepOrange.shade50),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText("Make your own Package", fontSize: 20),
                        appText('Service time: 3 hrs 20 mins', fontSize: 16),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSection(
                          title: "Waxing",
                          children: [
                            const WaxingRow(title: "Back", subtitle: "PKR 469", text: "Honey...", index: 0),
                            const WaxingRow(title: "Full arms", subtitle: "PKR 329", text: "Honey...", index: 1),
                            const WaxingRow(title: "Full body", subtitle: "PKR 1619", text: "Choco...", index: 2),
                            const WaxingRow(title: "Full legs", subtitle: "PKR 619", text: "Rica R...", index: 3),
                            const WaxingRow(title: "Half arms", subtitle: "PKR 319", text: "Rica W...", index: 4),
                            const WaxingRow(title: "Half legs", subtitle: "PKR 219", text: "Honey...", index: 5),
                            const WaxingRow(title: "Stomach", subtitle: "PKR 469", text: "Rica W...", index: 6),
                            const WaxingRow(title: "Bikini line", subtitle: "PKR 249", text: "Honey...", index: 7),
                            const WaxingRow(title: "Underarms", subtitle: "PKR 149", text: "Rica p...", index: 9),
                            const WaxingRow(title: "Bikini", subtitle: "PKR 949", text: "Honey...", index: 10),
                            _buildCheckboxRow(
                              text: "I don't need waxing",
                              isChecked: sectionChecks['waxing']!,
                              onChanged: (value) => setState(() => sectionChecks['waxing'] = value ?? false),
                            ),
                          ],
                        ),
                        _buildSection(
                          title: "Manicure",
                          children: [
                            const RowWidget(text: "Cut, file & polish", subtext: "PKR 149"),
                            const RowWidget(text: "Eyelish British Rose manicure", subtext: "PKR 699"),
                            const RowWidget(text: "Elysian Chocolate & Vanilla manicure", subtext: "PKR 899"),
                            const RowWidget(text: "Elysian Candle spa manicure", subtext: "PKR 1049"),
                            _buildCheckboxRow(
                              text: "I don't need manicure",
                              isChecked: sectionChecks['manicure']!,
                              onChanged: (value) => setState(() => sectionChecks['manicure'] = value ?? false),
                            ),
                          ],
                        ),
                        // Add remaining sections similarly...
                        _buildSection(
                          title: "Threading + Face waxing",
                          children: [
                            const ThreadingRow(title: "Eyebrow", subtitle: "PKR 49", text: "Thread..."),
                            const ThreadingRow(title: "Forehead", subtitle: "PKR 99", text: "Face W..."),
                            const ThreadingRow(title: "Face", subtitle: "PKR 149", text: "Thread..."),
                            const ThreadingRow(title: "Sidelocks", subtitle: "PKR 131", text: "Face W..."),
                            const ThreadingRow(title: "Upper lip", subtitle: "PKR 49", text: "Face W..."),
                            const ThreadingRow(title: "Neck", subtitle: "PKR 199", text: "Thread..."),
                            const ThreadingRow(title: "Jawline", subtitle: "PKR 99", text: "Face...."),
                            const ThreadingRow(title: "Chin", subtitle: "PKR 99", text: "Face W...."),
                            _buildCheckboxRow(
                              text: "I don't need threading face waxing",
                              isChecked: sectionChecks['threading']!,
                              onChanged: (value) => setState(() => sectionChecks['threading'] = value ?? false),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: height * 0.03,
                  color: AppColors.greenColor,
                  child: Center(
                    child: appText("You are saving PKR 135 in this package", color: Colors.white),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        appText("PKR 2,622", fontWeight: FontWeight.w700),
                        const SizedBox(width: 20),
                        appText(
                          "PKR 2,757",
                          color: Colors.grey.shade400,
                          decoration: TextDecoration.lineThrough,
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              showSuccessSnackbar(context, 'Added to cart successfully');
                            },
                            child: Container(
                                width: width * 0.4,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: AppColors.lowPurple,
                                ),
                                child: Center(child: appText("Add to Cart", color: Colors.white))))
                      ],
                    ))
              ],
            )),
        Positioned(
          top: -50,
          right: 16,
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child:
                  const CircleAvatar(backgroundColor: AppColors.whiteTheme, child: Center(child: Icon(Icons.close)))),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: appText(title, fontWeight: FontWeight.w900, fontSize: 18),
        ),
        ...children,
        Divider(color: Colors.grey.shade200),
      ],
    );
  }

  Widget _buildCheckboxRow({
    required String text,
    required bool isChecked,
    required ValueChanged<bool?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
            activeColor: AppColors.blueColor,
            value: isChecked,
            onChanged: onChanged,
          ),
          appText(text, fontWeight: FontWeight.w800, fontSize: 15),
        ],
      ),
    );
  }
}
