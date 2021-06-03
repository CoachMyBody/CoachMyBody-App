import 'package:flutter/cupertino.dart';

class RoutineSelectButtonModel extends ChangeNotifier {
  bool _isClicked;

  RoutineSelectButtonModel() {
    _isClicked = false;
  }

  bool get isClicked => _isClicked;

  void clickButton() {
    _isClicked = !_isClicked;
    notifyListeners();
  }
}
