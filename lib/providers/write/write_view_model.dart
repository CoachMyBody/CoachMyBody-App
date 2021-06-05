import 'package:flutter/material.dart';

class WriteNaviViewModel extends ChangeNotifier {
  bool _bFirstPage;

  WriteNaviViewModel() {
    _bFirstPage = true;
  }

  bool get isFirstPage => _bFirstPage;

  set isFirstPage(bool bFirstPage) {
    _bFirstPage = bFirstPage;
    notifyListeners();
  }
}

class WriteRoutineSettingOpened extends ChangeNotifier {
  bool _bOpened;

  WriteRoutineSettingOpened() : _bOpened = false;

  bool get isOpened => _bOpened;

  set bOpened(bool opened) {
    _bOpened = opened;
    notifyListeners();
  }
}