import 'package:flutter/material.dart';

class LoginScreenController extends ChangeNotifier {
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
}
