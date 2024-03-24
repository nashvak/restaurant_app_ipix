import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app_ipix/view/home_screen/home_screen.dart';
import 'package:restaurant_app_ipix/view/login_page/page/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends ChangeNotifier {
  String keyToLogin = "";

  void checkScreen(context) async {
    var pref = await SharedPreferences.getInstance();

    bool? isLoggedIn = pref.getBool(keyToLogin);

    Timer(const Duration(seconds: 2), () async {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }
}
