// import 'package:doorstep_company/Constants/colors.dart';
// import 'package:doorstep_company/view/home_screen/packages/packages_detail_screen.dart';
// import 'package:doorstep_company/widgets/custom_text.dart';
// import 'package:flutter/material.dart';

// void paackagesBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (BuildContext context) {
//       return const PackagesBottomSheet();
//     },
//   );
// }

// class PackagesBottomSheet extends StatefulWidget {
//   const PackagesBottomSheet({super.key});

//   @override
//   State<PackagesBottomSheet> createState() => _PackagesBottomSheetState();
// }

// class _PackagesBottomSheetState extends State<PackagesBottomSheet> {
//   List<String> images = [
//     'assets/images/women.png',
//     'assets/images/men.png',
//     'assets/images/air-conditioner.png',
//     'assets/images/pest-control.png',
//   ];

//   List<String> text = [
//     'Manicure',
//     'Pedicure',
//     'Waxing',
//     'Hair cut',
//   ];

//   void _navigateToScreen(int index) {
//     switch (index) {
//       case 0:
//         Navigator.push(context, MaterialPageRoute(builder: (context) => const PackagesDetailScreen()));
//         break;

//       default:
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return SizedBox(
//       height: height * 0.4,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Align(
//               alignment: Alignment.topRight,
//               child: Padding(
//                   padding: const EdgeInsets.only(right: 10, bottom: 10),
//                   child: InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const CircleAvatar(
//                           backgroundColor: AppColors.whiteTheme, radius: 20, child: Icon(Icons.close))))),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 13.0),
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
//               child: Container(
//                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         customText('Packages', fontWeight: FontWeight.bold, fontSize: 24),
//                         const SizedBox(height: 20),
//                         SizedBox(height: height * 0.013),
//                         GridView.builder(
//                           shrinkWrap: true,
//                           itemCount: images.length,
//                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 4,
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 3,
//                             mainAxisExtent: 140,
//                           ),
//                           itemBuilder: (context, index) {
//                             return GestureDetector(
//                               onTap: () => _navigateToScreen(index), // Call navigation function on tap
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height: height * 0.088,
//                                     width: width * 0.30,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage(images[index]),
//                                         fit: BoxFit.cover,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                       color: AppColors.grey300,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   customText(text[index], textAlign: TextAlign.center, fontSize: 12),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
