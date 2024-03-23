import 'package:flutter/material.dart';

class CuisineType extends StatelessWidget {
  final String cuisineType;
  const CuisineType({
    super.key,
    required this.cuisineType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 10,
            child: Icon(
              Icons.local_restaurant_outlined,
              size: 15,
              color: Colors.white,
            )),
        const SizedBox(
          width: 10,
        ),
        Text(cuisineType),
      ],
    );
  }
}
