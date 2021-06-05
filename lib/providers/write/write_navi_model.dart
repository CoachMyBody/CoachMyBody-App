import 'package:flutter/material.dart';

class WriteNaviViewModel extends ChangeNotifier {
  bool _isFirstPage;

  WriteNaviViewModel() {
    _isFirstPage = true;
  }

  bool get isFirstPage => _isFirstPage;

  set isFirstPage(bool bFirstPage) {
    _isFirstPage = bFirstPage;
    notifyListeners();
  }
}