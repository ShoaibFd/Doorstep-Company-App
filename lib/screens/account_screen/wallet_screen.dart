// import 'package:doorstep_company/Constants/colors.dart';
// import 'package:doorstep_company/widgets/custom_text.dart';
// import 'package:flutter/material.dart';

// class WalletScreen extends StatefulWidget {
//   const WalletScreen({super.key});

//   @override
//   _WalletScreenState createState() => _WalletScreenState();
// }

// class _WalletScreenState extends State<WalletScreen> {
//   bool isSwitched = false;

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         appBar: AppBar(title: customText('Wallet', fontSize: 18)),
//         body: Container(
//             width: double.infinity,
//             height: height * 0.2500,
//             margin: const EdgeInsets.all(16.0),
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(color: AppColors.blackColor, borderRadius: BorderRadius.circular(16.0)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 customText('Available Credit', color: AppColors.whiteTheme, fontSize: 16.0),
//                 SizedBox(height: height * 0.080),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         customText('OFF / ON', color: AppColors.whiteTheme, fontSize: 16.0),
//                         Switch(
//                             activeTrackColor: AppColors.blueColor,
//                             value: isSwitched,
//                             onChanged: (value) {
//                               setState(() {
//                                 isSwitched = value;
//                               });
//                             },
//                             activeColor: AppColors.whiteTheme),
//                       ],
//                     ),
//                     customText('PKR 0', color: AppColors.whiteTheme, fontSize: 24.0, fontWeight: FontWeight.bold),
//                   ],
//                 )
//               ],
//             )));
//   }
// }
