// import 'package:doorstep_company/Constants/colors.dart';
// import 'package:doorstep_company/widgets/custom_text.dart';
// import 'package:doorstep_company/widgets/round_button.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class InviteScreen extends StatelessWidget {
//   final String referralCode = "7a2615ff";

//   const InviteScreen({super.key});

//   void _shareReferralCode(BuildContext context) {
//     final RenderBox box = context.findRenderObject() as RenderBox;
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//           title: customText('Invite Friends', color: AppColors.whiteTheme, fontSize: 18),
//           backgroundColor: AppColors.darkBlueShade),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Center(child: Icon(Icons.card_giftcard, size: 160, color: AppColors.orangeColor)),
//             const SizedBox(height: 20),
//             customText("Invite friends, get Rs. 100.00",
//                 fontSize: 18, fontWeight: FontWeight.w600, textAlign: TextAlign.center),
//             const SizedBox(height: 20),
//             customText("1. Your friends will get Rs. 150", fontSize: 18),
//             customText("Ask them to just sign up and place & complete orders using your referral code."),
//             const Divider(),
//             const SizedBox(height: 10),
//             customText("2. You will get Rs. 100", fontSize: 18),
//             customText("Upon every order completion with your referral code."),
//             const SizedBox(height: 20),
//             const Divider(),
//             customText("Terms and Conditions", fontSize: 18),
//             customText("Referral code will be applicable above Rs. 1000.",
//                 fontSize: 14, color: AppColors.greyColor, textAlign: TextAlign.center),
//             const Spacer(),
//             const SizedBox(height: 20),
//             Center(child: customText("Your Referral Code", fontSize: 18, fontWeight: FontWeight.w400)),
//             const SizedBox(height: 10),
//             Center(
//                 child: DottedBorder(
//                     child: Container(
//                         height: height * 0.055,
//                         width: width * 0.6,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.lightGrey),
//                         child: GestureDetector(
//                             onTap: () {
//                               Clipboard.setData(ClipboardData(text: referralCode));
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text('Referral code copied to clipboard')),
//                               );
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 customText(referralCode, fontSize: 18, fontWeight: FontWeight.w400),
//                                 const Icon(Icons.copy),
//                               ],
//                             ))))),
//             const SizedBox(height: 30),
//             roundButton(onTap: () {}, color: AppColors.blackColor, title: 'Share with Loved ones'),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }
