import 'package:flutter/material.dart';
import 'package:restaurant_app_ipix/model/restaurant_model.dart';

import '../../api_calls/api_service.dart';
import '../home_screen/widgets/address_row.dart';
import '../home_screen/widgets/cuisine_type.dart';
import '../home_screen/widgets/name_rating_row.dart';
import 'widgets/rating_review.dart';

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

  // String? selectedOperatingHours;
  // String selectedDay = "Monday";

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
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameRatingRow(
                      name: widget.restaurant.name.toString(), rating: 4),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.restaurant.neighborhood.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  CuisineType(
                      cuisineType: widget.restaurant.cuisineType.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  AddressRow(address: widget.restaurant.address.toString()),
                  const SizedBox(
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
                  const Text(
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
