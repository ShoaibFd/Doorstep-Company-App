import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/custom_text.dart';

class FrequentlyAskedQuestionsWidget extends StatefulWidget {
  const FrequentlyAskedQuestionsWidget({super.key});

  @override
  State<FrequentlyAskedQuestionsWidget> createState() => _FrequentlyAskedQuestionsWidgetState();
}

class _FrequentlyAskedQuestionsWidgetState extends State<FrequentlyAskedQuestionsWidget> {
  void _toggleTextField() => setState(() => _isTextFieldVisible = !_isTextFieldVisible);
  void _toggleTextField2() => setState(() => _isTextFieldVisible2 = !_isTextFieldVisible2);
  void _toggleTextField3() => setState(() => _isTextFieldVisible3 = !_isTextFieldVisible3);
  void _toggleTextField4() => setState(() => _isTextFieldVisible4 = !_isTextFieldVisible4);
  void _toggleTextField5() => setState(() => _isTextFieldVisible5 = !_isTextFieldVisible5);
  void _toggleTextField6() => setState(() => _isTextFieldVisible6 = !_isTextFieldVisible6);

  //
  bool _isTextFieldVisible = false;
  bool _isTextFieldVisible2 = false;
  bool _isTextFieldVisible3 = false;
  bool _isTextFieldVisible4 = false;
  bool _isTextFieldVisible5 = false;
  bool _isTextFieldVisible6 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText('Frequently asked questions', fontSize: 20.px, fontWeight: FontWeight.bold),
        SizedBox(height: 20.px),
        ListTile(
            title: appText('Will the professional bring the tool needed for the service',
                fontSize: 15.px, fontWeight: FontWeight.bold),
            trailing: Icon(_isTextFieldVisible ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
            onTap: _toggleTextField),
        if (_isTextFieldVisible)
          Padding(
              padding: EdgeInsets.all(8.px), child: appText('Yes, the professional will bring all necessary tools.')),
        const Divider(),
        ListTile(
            title: appText('Will the professional bring the tool needed\nfor the service',
                fontSize: 15.px, fontWeight: FontWeight.bold),
            trailing: Icon(_isTextFieldVisible2 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
            onTap: _toggleTextField2),
        if (_isTextFieldVisible2)
          Padding(
              padding: EdgeInsets.all(8.px), child: appText('Yes, the professional will bring all necessary tools.')),
        const Divider(),
        ListTile(
            title: appText('Will the professional bring the tool needed\nfor the service',
                fontSize: 15.px, fontWeight: FontWeight.bold),
            trailing: Icon(_isTextFieldVisible3 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
            onTap: _toggleTextField3),
        if (_isTextFieldVisible3)
          Padding(
              padding: EdgeInsets.all(8.px), child: appText('Yes, the professional will bring all necessary tools.')),
        const Divider(),
        ListTile(
            title: appText('Will the professional bring the tool needed\nfor the service',
                fontSize: 15.px, fontWeight: FontWeight.bold),
            trailing: Icon(_isTextFieldVisible4 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
            onTap: _toggleTextField4),
        if (_isTextFieldVisible4)
          Padding(
              padding: EdgeInsets.all(8.px), child: appText('Yes, the professional will bring all necessary tools.')),
        const Divider(),
        ListTile(
            title: appText('Will the professional bring the tool neededfor the service',
                fontSize: 15.px, fontWeight: FontWeight.bold),
            trailing: Icon(_isTextFieldVisible5 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
            onTap: _toggleTextField5),
        if (_isTextFieldVisible5)
          Padding(
              padding: EdgeInsets.all(8.px), child: appText('Yes, the professional will bring all necessary tools.')),
        const Divider(),
        ListTile(
            title: appText('Will the professional bring the tool needed\nfor the service',
                fontSize: 15.px, fontWeight: FontWeight.bold),
            trailing: Icon(_isTextFieldVisible6 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
            onTap: _toggleTextField6),
        if (_isTextFieldVisible6)
          Padding(
              padding: EdgeInsets.all(8.px), child: appText('Yes, the professional will bring all necessary tools.')),
      ],
    );
  }
}
