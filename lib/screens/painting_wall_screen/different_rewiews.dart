import 'package:flutter/material.dart';

class Review {
  final String userName;
  final String date;
  final String description;
  final List<String> images;
  final int stars;

  Review({
    required this.userName,
    required this.date,
    required this.description,
    required this.images,
    required this.stars,
  });
}

class ReviewWidget extends StatelessWidget {
  final List<Review> reviews = [
    Review(
      userName: 'Dishant Sharma',
      date: 'Aug 2, 2024',
      description: 'Excellent work, thoroughly managed the whole site. My home looks amazing now.',
      images: [
        'https://via.placeholder.com/150',
      ],
      stars: 5,
    ),
    Review(
      userName: 'Sai Chandu',
      date: 'Jul 31, 2024',
      description:
          'Excellent work and dedicated folks who came to work and supervise. Service can be improved a little.',
      images: [
        'https://via.placeholder.com/150',
      ],
      stars: 5,
    ),
    Review(
      userName: 'Sai Chandu',
      date: 'Jul 31, 2024',
      description:
          'Excellent work and dedicated folks who came to work and supervise. Service can be improved a little.',
      images: [
        'https://via.placeholder.com/150',
      ],
      stars: 5,
    ),
    Review(
      userName: 'Sai Chandu',
      date: 'Jul 31, 2024',
      description:
          'Excellent work and dedicated folks who came to work and supervise. Service can be improved a little.',
      images: [
        'https://via.placeholder.com/150',
      ],
      stars: 5,
    ),
    Review(
      userName: 'Sai Chandu',
      date: 'Jul 31, 2024',
      description:
          'Excellent work and dedicated folks who came to work and supervise. Service can be improved a little.',
      images: [
        'https://via.placeholder.com/150',
      ],
      stars: 5,
    ),
    Review(
      userName: 'Sai Chandu',
      date: 'Jul 31, 2024',
      description:
          'Excellent work and dedicated folks who came to work and supervise. Service can be improved a little.',
      images: [
        'https://via.placeholder.com/150',
      ],
      stars: 5,
    ),
    Review(
      userName: 'Sai Chandu',
      date: 'Jul 31, 2024',
      description:
          'Excellent work and dedicated folks who came to work and supervise. Service can be improved a little.',
      images: [
        'https://via.placeholder.com/150',
      ],
      stars: 5,
    ),
    // Add more reviews similarly
  ];

  ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        review.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        review.date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      review.stars,
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    review.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: review.images.map((imageUrl) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.network(
                          imageUrl,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
