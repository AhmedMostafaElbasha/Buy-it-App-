import 'package:flutter/cupertino.dart';

class ModelHud extends ChangeNotifier {
  bool isLoading = false;

  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}