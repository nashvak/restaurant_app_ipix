// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:restaurant_app_ipix/view_model/splash_screen_contoller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/snackbar.dart';
import '../view/home_screen/home_screen.dart';

class LoginScreenController extends ChangeNotifier {
  final SplashScreenController splash = SplashScreenController();

  bool obscure = true;
  bool checkbox = false;
  bool get checkboxToggle => checkbox;
  bool get isVisible => obscure;

  void toggleVisibility() {
    obscure = !obscure;
    notifyListeners();
  }

  void toggleCheckbox() {
    checkbox = !checkbox;
    notifyListeners();
  }

  void loginuser(String email, BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool(splash.keyToLogin, true);
    pref.setString('email', email);
    // print(pref.getString('email'));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
    showSnackbar(context, 'Login succesfully..!');
  }
}
