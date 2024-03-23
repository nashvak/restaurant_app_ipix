import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app_ipix/api_calls/api_service.dart';
import 'package:restaurant_app_ipix/constants/global_variables.dart';
import 'package:restaurant_app_ipix/model/restaurant_model.dart';
import 'package:restaurant_app_ipix/view/login_page/page/login_screen.dart';
import 'package:restaurant_app_ipix/view_model/splash_screen_contoller.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                      await pref.remove(splashScreenController.email);
                      pref.setBool(splashScreenController.keyToLogin, false);
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                    },
                    icon: const Icon(Icons.logout)),
                const Text("Log out"),
              ],
            )
          ],
        ),
        body: FutureBuilder(
            future: homeService.fetchRestaurants(),
            builder: (context, AsyncSnapshot<List<Restaurants>> snapshot) {
              final data = snapshot.data;
              print("fdjsf");
              print(data);
              if (data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final restaurant = data[index];
                      return Column(
                        children: [
                          Image.network(
                            restaurant.photograph.toString(),
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                restaurant.name.toString(),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                color: Appcolors.ratingColor,
                                padding: EdgeInsets.all(10),
                                child: Text('4'),
                              )
                            ],
                          )
                        ],
                      );
                    });
              }
            }));
  }
}
