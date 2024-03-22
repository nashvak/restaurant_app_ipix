import 'package:flutter/material.dart';

class LoginScreenController extends ChangeNotifier {
  bool obscure = true;

  bool get isVisible => obscure;

  void toggleVisibility() {
    obscure = !obscure;
    notifyListeners();
  }
}
