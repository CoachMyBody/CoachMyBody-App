import 'package:flutter/material.dart';

class RecordMuscleViewModel extends ChangeNotifier {
  bool _isAnterior;

  RecordMuscleViewModel() {
    _isAnterior = true;
  }

  bool getIsAnterior() {
    return _isAnterior;
  }

  void setIsAnterior(bool bAnterior) {
    _isAnterior = bAnterior;
    notifyListeners();
  }
}