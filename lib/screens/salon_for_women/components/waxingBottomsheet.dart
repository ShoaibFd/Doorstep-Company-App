import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';

void makeYourOwnPackageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isDismissible: true,
    builder: (context) => const FilterRatingSheet(),
  );
}

class FilterRatingSheet extends StatefulWidget {
  const FilterRatingSheet({super.key});

  @override
  State<FilterRatingSheet> createState() => _FilterRatingSheetState();
}

class _FilterRatingSheetState extends State<FilterRatingSheet> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCheckboxRow(
                  isChecked: isChecked1,
                  onChanged: (value) {
                    setState(() {
                      isChecked1 = value ?? false;
                    });
                  },
                ),
                _buildCheckboxRow(
                  isChecked: isChecked2,
                  onChanged: (value) {
                    setState(() {
                      isChecked2 = value ?? false;
                    });
                  },
                ),
                _buildCheckboxRow(
                  isChecked: isChecked3,
                  onChanged: (value) {
                    setState(() {
                      isChecked3 = value ?? false;
                    });
                  },
                ),
                _buildCheckboxRow(
                  isChecked: isChecked4,
                  onChanged: (value) {
                    setState(() {
                      isChecked4 = value ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: -50,
            right: 16,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.close))))
      ],
    );
  }

  Widget _buildCheckboxRow({
    required bool isChecked,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      children: [
        Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            value: isChecked,
            onChanged: onChanged),
        appText("Rica Roll on", fontSize: 16),
        const Spacer(),
        appText("PKR 789", fontSize: 16),
      ],
    );
  }
}
