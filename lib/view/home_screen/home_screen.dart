import 'package:flutter/material.dart';
import 'package:restaurant_app_ipix/constants/global_variables.dart';
import 'package:restaurant_app_ipix/view/login_page/page/login_screen.dart';
import 'package:restaurant_app_ipix/view_model/splash_screen_contoller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SplashScreenController splashScreenController =
      SplashScreenController();
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  },
                  icon: const Icon(Icons.logout)),
              const Text("Log out"),
            ],
          )
        ],
      ),
      body: const Center(child: Text("Homescren")),
    );
  }
}
