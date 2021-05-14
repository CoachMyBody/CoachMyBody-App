import 'package:flutter/material.dart';

class PhotoHistoryViewModel extends ChangeNotifier {
  String _imagePath;
  DateTime _dateTime;

  void setImagePath(String imgPath) {
    _imagePath = imgPath;
    notifyListeners();
  }

  String getImagePath() {
    return _imagePath;
  }

  void setDateTime(DateTime time) {
    _dateTime = time;
    notifyListeners();
  }

  DateTime getDateTime() {
    return _dateTime;
  }
}