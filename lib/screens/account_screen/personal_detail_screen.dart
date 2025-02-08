import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/custom_text.dart';
import '../../components/round_button.dart';
import '../../constants/colors.dart';
import '../google_map/google_map_screen.dart';

class PersonalDetailScreen extends StatefulWidget {
  const PersonalDetailScreen({super.key});

  @override
  State<PersonalDetailScreen> createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Personal Details', fontSize: 20.px, fontWeight: FontWeight.bold)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: AppColors.grey300.withOpacity(0.3),
                radius: 50,
              ),
            ),
            const SizedBox(height: 10),
            appText('Name*', fontWeight: FontWeight.bold),
            SizedBox(height: 6.px),
            textFormField(keyboardType: TextInputType.name, controller: nameController, hint: 'Shoaib lodhra'),
            const SizedBox(height: 20),
            appText('Number*', fontWeight: FontWeight.bold),
            SizedBox(height: 6.px),
            textFormField(keyboardType: TextInputType.phone, controller: phoneController, hint: 'Phone number'),
            const SizedBox(height: 20),
            appText('Email (For Invoices)*', fontWeight: FontWeight.bold),
            SizedBox(height: 6.px),
            textFormField(
                keyboardType: TextInputType.emailAddress, controller: emailController, hint: 'email@gmail.com'),
            SizedBox(height: 20.px),
            appText('Gender', fontWeight: FontWeight.bold, fontSize: 16),
            Row(
              children: [
                Row(
                  children: [
                    Radio<String>(
                      activeColor: AppColors.lowPurple,
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    appText('Male'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      activeColor: AppColors.lowPurple,
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    appText('Female'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      activeColor: AppColors.lowPurple,
                      value: 'Other',
                      groupValue: selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    appText('Other'),
                  ],
                ),
              ],
            ),
            const Spacer(),
            roundButton(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GoogleMapScreen()));
                },
                title: 'Done'),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

// TextFormField Widget
Widget textFormField({
  required TextEditingController controller,
  String? hint,
  TextInputType? keyboardType,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    controller: controller,
    decoration: InputDecoration(
        isDense: true,
        fillColor: AppColors.grey300.withOpacity(0.3),
        filled: true,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.hintGrey.withOpacity(0.4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.hintGrey.withOpacity(0.4)),
        )),
  );
}
