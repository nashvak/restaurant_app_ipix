import 'package:flutter/material.dart';

class DetailsScreenController extends ChangeNotifier {
  bool _expanded = false;
  bool get isExpanded => _expanded;
  void toggleExpanded() {
    _expanded = !_expanded;
    notifyListeners();
  }
}
