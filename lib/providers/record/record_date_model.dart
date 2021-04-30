import 'package:flutter/material.dart';

class MonthlyViewModel extends ChangeNotifier {
  MonthlyViewModel() : currentTime = DateTime.now() {
    _year = currentTime.year;
    _month = currentTime.month;
  }

  final DateTime currentTime;
  int _year;
  int _month;

  int getCurrentYear() {
    return _year;
  }

  void setCurrentYear(int inYear) {
    _year = inYear;
    notifyListeners();
  }

  int getCurrentMonth() {
    assert(_month > 0 && _month < 13);
    return _month;
  }

  void setToNextMonth() {
    if (DateTime.december == _month) {
      _month = DateTime.january;
      _year++;
    } else {
      _month++;
    }
    notifyListeners();
  }

  void setToPreviousMonth() {
    if (DateTime.january == _month) {
      _month = DateTime.december;
      _year--;
    } else {
      _month--;
    }
    notifyListeners();
  }
}

class SelectedDateViewModel extends ChangeNotifier {
  SelectedDateViewModel() {
    _isSelected = false;
  }

  bool _isSelected;
  DateTime _selectedDate;

  bool getSelected() {
    return _isSelected;
  }

  void setSelected(bool b) {
    _isSelected = b;
    notifyListeners();
  }

  void setSelectedToNegative() {
    _isSelected = !_isSelected;
    notifyListeners();
  }

  DateTime getSelectedTime() {
    print('getSelectedTime ' + _selectedDate.toString());
    return _selectedDate;
  }

  void setSelectedDate(int inYear, int inMonth, int inDay) {
    print('setSelectedDate');
    _selectedDate = DateTime(inYear, inMonth, inDay);
    notifyListeners();
  }
}
