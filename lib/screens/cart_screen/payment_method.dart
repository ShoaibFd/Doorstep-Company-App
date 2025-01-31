// import 'package:doorstep_company/widgets/custom_text.dart';
// import 'package:flutter/material.dart';

// class PaymentMethod extends StatefulWidget {
//   const PaymentMethod({super.key});

//   @override
//   State<PaymentMethod> createState() => _PaymentMethodState();
// }

// class _PaymentMethodState extends State<PaymentMethod> {
//   bool jazzcash = false;
//   bool easypaisa = false;
//   bool banktransfer = false;
//   bool cashondelivery = false;

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(title: customText("Choose your payment method", fontSize: 18, fontWeight: FontWeight.w400)),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Checkbox(
//                   value: jazzcash,
//                   onChanged: (value) {
//                     setState(() {
//                       jazzcash = value!;
//                       jazzcash = true;
//                       easypaisa = false;
//                       banktransfer = false;
//                       cashondelivery = false;
//                     });
//                   }),
//               GestureDetector(
//                 onTap: () {},
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset('assets/images/jazzcash.png', height: 60)),
//               )
//             ],
//           ),
//           SizedBox(
//             height: height * 0.030,
//           ),
//           const Divider(thickness: 4),
//           SizedBox(height: height * 0.030),
//           Row(
//             children: [
//               Checkbox(
//                   value: easypaisa,
//                   onChanged: (value) {
//                     setState(() {
//                       easypaisa = value!;
//                       jazzcash = false;
//                       easypaisa = true;
//                       banktransfer = false;
//                       cashondelivery = false;
//                     });
//                   }),
//               InkWell(
//                 splashColor: Colors.green,
//                 onTap: () {},
//                 child: Container(
//                     height: height * 0.080,
//                     width: width * 0.2,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(image: AssetImage('assets/images/easypesa.png'), fit: BoxFit.contain))),
//               ),
//             ],
//           ),
//           SizedBox(height: height * 0.030),
//           const Divider(thickness: 4),
//           SizedBox(height: height * 0.030),
//           Row(
//             children: [
//               Checkbox(
//                   value: banktransfer,
//                   onChanged: (value) {
//                     setState(() {
//                       banktransfer = value!;
//                       jazzcash = false;
//                       easypaisa = false;
//                       banktransfer = true;
//                       cashondelivery = false;
//                     });
//                   }),
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     'assets/images/bank.jpeg',
//                     height: 60,
//                     width: 60
//                   ))
//             ],
//           ),
//           SizedBox(height: height * 0.030),
//           const Divider(thickness: 4),
//           SizedBox(height: height * 0.030),
//           Row(
//             children: [
//               Checkbox(
//                   value: cashondelivery,
//                   onChanged: (value) {
//                     setState(() {
//                       cashondelivery = value!;
//                       jazzcash = false;
//                       easypaisa = false;
//                       banktransfer = false;
//                       cashondelivery = true;
//                     });
//                   }),
//               InkWell(
//                 splashColor: Colors.green,
//                 onTap: () {},
//                 child: Container(
//                     height: height * 0.080,
//                     width: width * 0.2,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('assets/images/cash-on-delivery.png'), fit: BoxFit.contain))),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
