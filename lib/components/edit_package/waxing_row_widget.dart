import 'package:flutter/material.dart';

import '../app_text.dart';

class RowWidget extends StatefulWidget {
  final String text;
  final String subtext;
  const RowWidget({
    super.key,
    required this.text,
    required this.subtext,
  });

  @override
  State<RowWidget> createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
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
                  child: appText(widget.text, fontWeight: FontWeight.w800, fontSize: 15)),
              appText(widget.subtext, color: Colors.grey.shade500),
            ],
          ),
        ],
      ),
    );
  }
}
