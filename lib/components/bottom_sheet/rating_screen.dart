import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body:
         Column(children: [
      Row(
        children: [
          Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              }),
          const Text(
            '5 Star',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
      Row(
        children: [
          Checkbox(
              value: isChecked2,
              onChanged: (value) {
                setState(() {
                  isChecked2 = value!;
                });
              }),
          const Text(
            '4 Star',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
      Row(
        children: [
          Checkbox(
              checkColor: Colors.blueAccent,
              value: isChecked3,
              onChanged: (value) {
                setState(() {
                  isChecked3 = value!;
                });
              }),
          const Text(
            '3 Star',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      Row(
        children: [
          Checkbox(
              value: isChecked4,
              onChanged: (value) {
                setState(() {
                  isChecked4 = value!;
                });
              }),
          const Text(
            '2 Star',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
      Row(
        children: [
          Checkbox(
              value: isChecked5,
              onChanged: (value) {
                setState(() {
                  isChecked5 = value!;
                });
              }),
          const Text(
            '1 Star',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    ]));
 
  }
}
