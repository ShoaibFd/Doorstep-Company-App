// import 'package:doorstep_company_app/components/custom_snackbar.dart';
// import 'package:doorstep_company_app/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../../app_controllers/languages_controller.dart';
// import '../../components/custom_text.dart';
// import '../../components/round_button.dart';
// import '../auth/authentication_screen.dart';

// class LanguageScreen extends StatelessWidget {
//   final bool onChecked;

//   const LanguageScreen({super.key, required this.onChecked});

//   @override
//   Widget build(BuildContext context) {
//     // Use Get.find instead of Get.put to avoid recreating controller
//     final LanguagesController languagesController = Get.find<LanguagesController>();

//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.px),
//           child: Column(
//             children: [
//               SizedBox(height: 30.px),
//               Center(child: appText('Welcome to ', fontSize: 30.px, fontWeight: FontWeight.bold)),
//               SizedBox(height: 20.px),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 45.px,
//                     width: 50.px,
//                     decoration:
//                         BoxDecoration(color: AppColors.blackColor, borderRadius: BorderRadius.circular(4)),
//                     child: Center(
//                       child: appText('DC',
//                           fontSize: 27.px, color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(width: 10.px),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       appText('Doorstep ', fontSize: 22.px, fontWeight: FontWeight.bold),
//                       appText('Company', fontSize: 18.px, fontWeight: FontWeight.bold),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.px),
//               appText('Choose your language to get started', fontSize: 18.px),
//               SizedBox(height: 20.px),
//               // Use Obx only for the language options to minimize rebuilds
//               Obx(() => Column(
//                 children: [
//                   languageOption('English', "(device's language)", 'English', languagesController),
//                   languageOption('اردو', 'Urdu', 'Urdu', languagesController),
//                   languageOption('انگریزی', '(Chat language)', 'انگریزی', languagesController),
//                 ],
//               )),
//               const Spacer(),
//               // Use Obx for save button to enable/disable based on language selection
//               Obx(() => roundButton(
//                 onTap: () {
//                   if (languagesController.selectedLanguage.value.isEmpty) {
//                     showErrorSnackbar(context, 'Please select a language to continue');
//                   } else {
//                     // Use more explicit navigation
//                     onChecked ? Get.back() : Get.offAll(() => const AuthenticationScreen());
//                   }
//                 },
//                 title: 'Save and continue',
//                 color: languagesController.selectedLanguage.value.isEmpty
//                     ? AppColors.grey300
//                     : AppColors.lowPurple,
//               )),
//               SizedBox(height: 10.px),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget languageOption(String title, String subtitle, String value, LanguagesController controller) {
//   return Row(
//     children: [
//       Radio<String>(
//           activeColor: AppColors.darkGreen,
//           value: value,
//           groupValue: controller.selectedLanguage.value,
//           onChanged: (val) => controller.changeLanguage(val!)),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           appText(title, fontSize: 16.px),
//           appText(subtitle, fontSize: 16.px, color: AppColors.hintGrey),
//         ],
//       ),
//     ],
//   );
// }
