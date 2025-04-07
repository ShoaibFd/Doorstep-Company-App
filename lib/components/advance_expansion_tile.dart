// import 'package:advance_expansion_tile/advance_expansion_tile.dart';
// import 'package:flutter/material.dart';

// class CustomExpansionTile extends StatefulWidget {
//   final String title;
//   final Widget content;
//   final GlobalKey<AdvanceExpansionTileState>? globalKey;

//   const CustomExpansionTile({
//     super.key,
//     required this.title,
//     required this.content,
//     this.globalKey,
//   });

//   @override
//   _CustomExpansionTileState createState() => _CustomExpansionTileState();
// }

// class _CustomExpansionTileState extends State<CustomExpansionTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: AdvanceExpansionTile(
//         key: widget.globalKey ?? GlobalKey<AdvanceExpansionTileState>(), // Provide a default key if null
//         title: Text(widget.title),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//         ),
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(10),
//               bottomRight: Radius.circular(10),
//             ),
//             child: widget.content,
//           ),
//         ],
//         onTap: () {},
//       ),
//     );
//   }
// }
