import 'package:flutter/material.dart';

class ReviewItemList extends StatelessWidget {
  final String? name;
  final String? date;
  final String? services;
  final String? comment;
  final double? rating;
  final String? imageUrl;

  const ReviewItemList({
    Key? key,
    this.name,
    this.date,
    this.services,
    this.comment,
    this.rating,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (name != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  if (rating != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        rating!.toInt(),
                            (index) => const Icon(Icons.star, color: Colors.amber),
                      ),
                    ),
                ],
              ),
            if (date != null) ...[
              const SizedBox(height: 8),
              Text(date!),
            ],
            if (services != null) ...[
              const SizedBox(height: 8),
              Text(services!),
            ],
            if (comment != null) ...[
              const SizedBox(height: 8),
              Text(comment!),
            ],
            if (imageUrl != null && imageUrl!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Image.network(
                imageUrl!,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
class ReviewListfile extends StatelessWidget {
  final List<ReviewItemList> reviews;

  const ReviewListfile({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return reviews.isEmpty
        ? const Center(child: Text('No reviews yet.'))
        : ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return reviews[index];
      },
    );
  }
}