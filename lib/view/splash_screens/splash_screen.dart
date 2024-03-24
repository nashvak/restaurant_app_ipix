import 'package:flutter/material.dart';
import 'package:restaurant_app_ipix/view_model/splash_screen_contoller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController splashScreenController = SplashScreenController();
  @override
  void initState() {
    splashScreenController.checkScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/food_app_logo.png',
          width: 250,
        ),
      ),
    );
  }
}
