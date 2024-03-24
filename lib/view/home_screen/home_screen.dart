import 'package:flutter/material.dart';
import 'package:restaurant_app_ipix/api_calls/api_service.dart';
import 'package:restaurant_app_ipix/constants/global_variables.dart';
import 'package:restaurant_app_ipix/model/restaurant_model.dart';
import 'package:restaurant_app_ipix/view/details_screen/restaurant_details.dart';
import 'package:restaurant_app_ipix/view/login_page/page/login_screen.dart';
import 'package:restaurant_app_ipix/view_model/splash_screen_contoller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/address_row.dart';
import 'widgets/cuisine_type.dart';
import 'widgets/name_rating_row.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SplashScreenController splashScreenController =
      SplashScreenController();
  HomeService homeService = HomeService();
  @override
  void initState() {
    homeService.fetchRestaurants();
    super.initState();
  }

  final num sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.appColor,
          title: const Text("RESTARAUNTS"),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    var pref = await SharedPreferences.getInstance();
                    await pref.remove('email');
                    pref.setBool(splashScreenController.keyToLogin, false);
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                    print(pref.getString('email'));
                  },
                  icon: const Icon(Icons.logout),
                ),
                const Text("Log out"),
              ],
            )
          ],
        ),
        body: FutureBuilder(
            future: homeService.fetchRestaurants(),
            builder: (context, AsyncSnapshot<List<Restaurants>> snapshot) {
              final data = snapshot.data;
              // print("fdjsf");
              // print(data);
              if (data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final restaurant = data[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RestaurantDetails(
                                        restaurant: restaurant,
                                      )));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(
                                "https://images.unsplash.com/photo-1525648199074-cee30ba79a4a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                width: double.infinity,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              NameRatingRow(
                                name: restaurant.name.toString(),
                                rating: 4,
                              ),
                              CuisineType(
                                cuisineType: restaurant.cuisineType.toString(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AddressRow(
                                address: restaurant.address.toString(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
            }));
  }
}
