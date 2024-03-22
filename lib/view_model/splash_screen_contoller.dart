import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app_ipix/view/home_screen/home_screen.dart';
import 'package:restaurant_app_ipix/view/login_page/page/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends ChangeNotifier {
  String email = '';
  String keyToLogin = '';
  void checkLogin(context) async {
    var pref = await SharedPreferences.getInstance();
    var isLoggedIn = pref.getBool(email);
    print(isLoggedIn);
    Timer(const Duration(seconds: 2), () async {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }
}
