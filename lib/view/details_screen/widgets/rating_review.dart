import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../model/restaurant_model.dart';
import '../../../view_model/details_screen.dart';
import 'review_comment.dart';

class RatingsReviews extends StatelessWidget {
  final Restaurants restaurant;
  RatingsReviews({super.key, required this.restaurant});
  final DetailsScreenController detailsScreenController =
      DetailsScreenController();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: restaurant.reviews!.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Appcolors.ratingColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Row(
                    children: [
                      Text(
                        restaurant.reviews![index].rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  restaurant.reviews![index].name.toString(),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ReadMoreText(text: restaurant.reviews![index].comments.toString()),
            Text(restaurant.reviews![index].date.toString()),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 2,
        );
      },
    );
  }
}
