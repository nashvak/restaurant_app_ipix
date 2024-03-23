import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class NameRatingRow extends StatelessWidget {
  final String name;
  final double rating;
  const NameRatingRow({
    super.key,
    required this.name,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Rating(rating: rating)
      ],
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Appcolors.ratingColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Row(
        children: [
          Text(
            rating.toString(),
            style: TextStyle(color: Colors.white),
          ),
          const Icon(
            Icons.star,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
