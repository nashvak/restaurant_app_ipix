import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_ipix/model/restaurant_model.dart';
import 'package:restaurant_app_ipix/view/home_screen/home_screen.dart';
import 'package:restaurant_app_ipix/view_model/details_screen.dart';

import '../../api_calls/api_service.dart';
import '../../constants/global_variables.dart';

class RestaurantDetails extends StatefulWidget {
  final Restaurants restaurant;
  const RestaurantDetails({super.key, required this.restaurant});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  HomeService homeService = HomeService();
  @override
  void initState() {
    homeService.fetchRestaurants();
    super.initState();
  }

  String? selectedOperatingHours;
  String selectedDay = "Monday";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1525648199074-cee30ba79a4a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                width: double.infinity,
              ),
              Positioned(
                bottom: 20,
                left: 10,
                child: Text(
                  widget.restaurant.name.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameRatingRow(
                      name: widget.restaurant.name.toString(), rating: 4),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.restaurant.neighborhood.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  CuisineType(
                      cuisineType: widget.restaurant.cuisineType.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  AddressRow(address: widget.restaurant.address.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  // DropdownButton<String>(
                  //     value: selectedOperatingHours,
                  //     isExpanded: true, // Expand dropdown to full width
                  //     hint: Text("Operating Hours"),
                  //     items:
                  //         widget.restaurant.operatingHours.entries.map((entry) {
                  //       return DropdownMenuItem<String>(
                  //         value: entry.key,
                  //         child: Text(entry.value),
                  //       );
                  //     }).toList(),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         selectedOperatingHours = value;
                  //       });
                  //     }),
                  Text(
                    "Ratings & Reviews",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  RatingsReviews(restaurant: widget.restaurant)
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class RatingsReviews extends StatelessWidget {
  final Restaurants restaurant;
  RatingsReviews({super.key, required this.restaurant});
  DetailsScreenController detailsScreenController = DetailsScreenController();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: restaurant.reviews!.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Appcolors.ratingColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Row(
                    children: [
                      Text(restaurant.reviews![index].rating.toString()),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                ),
                Text(restaurant.reviews![index].name.toString())
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ReadMoreText(text: restaurant.reviews![index].comments.toString()),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 2,
        );
      },
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;
  final String readMoreText;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 3,
    this.readMoreText = "Read More",
  });

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _isExpanded ? widget.text : _trimText(widget.text, widget.maxLines),
          maxLines: _isExpanded ? null : widget.maxLines,
        ),
        Container(
          alignment: Alignment.topRight,
          child: _isExpanded
              ? Container()
              : TextButton(
                  onPressed: () => setState(() => _isExpanded = true),
                  child: Text(widget.readMoreText),
                ),
        ),
      ],
    );
  }

  String _trimText(String text, int maxLines) {
    final lines = text.split('\n');
    if (lines.length <= maxLines) return text;
    return "${lines.sublist(0, maxLines).join('\n')}...";
  }
}
