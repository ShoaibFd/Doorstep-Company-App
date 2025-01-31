import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../custom_text.dart';

class ThreadingRow extends StatefulWidget {
  final String title;
  final String subtitle;
  final Container? container; // Optional custom container
  final String? text;

  const ThreadingRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.container,
    this.text,
  });

  @override
  State<ThreadingRow> createState() => _ThreadingRowState();
}

class _ThreadingRowState extends State<ThreadingRow> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            activeColor: AppColors.blueColor,
            value: ischecked,
            onChanged: (bool? value) {
              setState(() {
                ischecked = value ?? false;
              });
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: appText(widget.title, fontWeight: FontWeight.w800, fontSize: 15),
              ),
              appText(widget.subtitle, color: Colors.grey.shade500),
            ],
          ),
          const Spacer(),
          widget.container ??
              Container(
                  height: height * 0.0450,
                  width: width * 0.3100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade500)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText(widget.text ?? "", fontSize: 18),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  )),
        ],
      ),
    );
  }
}
