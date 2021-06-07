import 'package:flutter/cupertino.dart';

class RoutineSelectButtonModel extends ChangeNotifier {
  bool isClicked;

  RoutineSelectButtonModel() {
    isClicked = false;
  }

  void clickButton() {
    isClicked = !isClicked;
    notifyListeners();
  }

  void resetRoutineButton() {
    isClicked = false;
    notifyListeners();
  }
}
