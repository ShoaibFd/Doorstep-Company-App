// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../../constants/colors.dart';

// class ImagePickerSection extends StatefulWidget {
//   const ImagePickerSection({super.key});

//   @override
//   State<ImagePickerSection> createState() => _ImagePickerSectionState();
// }

// class _ImagePickerSectionState extends State<ImagePickerSection> {
//   final List<File> images = [];

//   /// Function to pick images
//   Future<void> _pickImages() async {
//     final ImagePicker picker = ImagePicker();

//     // Allow user to select multiple images
//     final List<XFile> selectedImages = await picker.pickMultiImage();

//     if (selectedImages.isNotEmpty) {
//       setState(() {
//         images.addAll(selectedImages.map((image) => File(image.path)));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.sizeOf(context).height;
//     double width = MediaQuery.sizeOf(context).width;

//     return Column(
//       children: [
//         Container(
//           height: height * .2,
//           width: width,
//           decoration:
//               BoxDecoration(border: Border.all(color: AppColors.grey300), borderRadius: BorderRadius.circular(8)),
//           child: Padding(
//             padding: EdgeInsets.all(8.px),
//             child: Center(
//                 child: images.isNotEmpty
//                     ? ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: images.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 4.px),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10.px),
//                               child: Image.file(
//                                 images[index],
//                                 height: height * .25,
//                                 width: width * 0.4,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                     : IconButton(
//                         onPressed: _pickImages, icon: Icon(Icons.add, color: AppColors.blueColor, size: 30.px))),
//           ),
//         ),
//       ],
//     );
//   }
// }
