// import 'package:flutter/material.dart';
//
// class ReviewItemSectionScreen extends StatelessWidget {
//   final String name;
//   final String review;
//   final String imageUrl;
//   final double rating;
//   final double height;
//   final double width;
//   final Color ratingColor;
//   final Color ratingTextColor;
//
//   const ReviewItemSectionScreen({
//     Key? key,
//     required this.name,
//     required this.review,
//     required this.imageUrl,
//     required this.rating,
//     required this.height,
//     required this.width,
//     required this.ratingColor,
//     required this.ratingTextColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 name,
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Container(
//                 height: height * 0.035,
//                 width: width * 0.13,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4),
//                   color: ratingColor,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Icon(
//                       Icons.star,
//                       size: 15,
//                       color: ratingTextColor,
//                     ),
//                     Text(
//                       rating.toString(),
//                       style: TextStyle(
//                           color: ratingTextColor, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(review),
//         ),
//         Image.asset(imageUrl, height: 100),
//         const Divider(),
//       ],
//     );
//   }
// }

