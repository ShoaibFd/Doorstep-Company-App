import 'package:flutter/material.dart';

import '../../screens/salon_for_women/components/waxingBottomsheet.dart';
import '../custom_text.dart';

class WaxingRow extends StatefulWidget {
  final String title;
  final String subtitle;
  final Container? container;
  final String? text;
  final int index;

  const WaxingRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.container,
    this.text,
    required this.index,
  });

  @override
  State<WaxingRow> createState() => _WaxingRowState();
}

class _WaxingRowState extends State<WaxingRow> {
  bool isChecked = false;

  void _navigateToServiceDetail(int index) {
    switch (index) {
      case 0: // Women's Services
        makeYourOwnPackageBottomSheet(context);
        break;
      case 1: // Men's Salon Services
        makeYourOwnPackageBottomSheet(context);
        break;
      case 2:
        makeYourOwnPackageBottomSheet(context);
      case 3:
        makeYourOwnPackageBottomSheet(context);
      case 4:
        makeYourOwnPackageBottomSheet(context);
      case 5:
        makeYourOwnPackageBottomSheet(context);
      case 6:
        makeYourOwnPackageBottomSheet(context);
      case 7:
        makeYourOwnPackageBottomSheet(context);
      case 8:
        makeYourOwnPackageBottomSheet(context);
      case 9:
        makeYourOwnPackageBottomSheet(context);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(widget.title, fontWeight: FontWeight.w800, fontSize: 15),
              appText(widget.subtitle, color: Colors.grey.shade500)
            ],
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () => _navigateToServiceDetail(widget.index),
          child: widget.container ??
              Container(
                height: height * 0.045,
                width: width * 0.31,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade500)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appText(widget.text ?? "", fontSize: 18),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
        ),
      ],
    );
  }
}
