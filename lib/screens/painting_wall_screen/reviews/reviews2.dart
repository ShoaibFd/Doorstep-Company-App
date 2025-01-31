// import 'package:doorstep_company/View/Screens/painting_wall_screen/reviews/review.dart';
// import 'package:flutter/material.dart';
//
// import '../rewiew.dart';
//
// class ReviewListScreen extends StatelessWidget {
//   final double height;
//   final double width;
//
//   const ReviewListScreen({Key? key, required this.height, required this.width})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> reviews = [
//       {
//         "name": "Roopa",
//         "review": "Lorem ipsum dolor sit amet...",
//         "imageUrl": "assets/images/ac.jpeg",
//         "rating": 5.0,
//       },
//       {
//         "name": "John",
//         "review": "Another review text...",
//         "imageUrl": "assets/images/ac.jpeg",
//         "rating": 4.5,
//       },
//     ];
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Reviews")),
//       body: Column(
//         children: [
//           const Text(
//             "Reviews Header",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: reviews.length,
//               itemBuilder: (context, index) {
//                 final review = reviews[index];
//                 return ReviewItemSectionScreen(
//                   name: review["name"],
//                   review: review["review"],
//                   imageUrl: review["imageUrl"],
//                   rating: review["rating"],
//                   height: height,
//                   width: width,
//                   ratingColor: Colors.green,
//                   ratingTextColor: Colors.white,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
