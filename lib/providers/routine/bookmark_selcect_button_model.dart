import 'package:flutter/cupertino.dart';

class BookMarkSelectButtonModel extends ChangeNotifier {
  bool isClicked;

  BookMarkSelectButtonModel() {
    isClicked = false;
  }

  void clickButton() {
    isClicked = !isClicked;
    notifyListeners();
  }

  void resetBookMartButton() {
    isClicked = false;
    notifyListeners();
  }
}
