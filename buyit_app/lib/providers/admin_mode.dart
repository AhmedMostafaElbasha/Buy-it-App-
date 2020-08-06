import 'package:flutter/material.dart';

class AdminMode extends ChangeNotifier {
  bool isAdmin = false;

  void changeIsAdmin(bool value) {
    isAdmin = value;
    notifyListeners();
  }
}