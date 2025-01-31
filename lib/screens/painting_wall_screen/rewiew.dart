import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final String name;
  final String amount;
  final String paintType;
  final double rating;
  final String comment;
  // final String? image;

   ReviewItem({
    Key? key,
    required this.name,
    required this.amount,
    required this.paintType,
    required this.rating,
    required this.comment,
    // this.image,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10.0),
            //   child: Image.asset(
            //     image!,
            //     height: 200,
            //     width: double.infinity,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              '$amount • $paintType',
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              comment,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}