import 'package:flutter/material.dart';

class NotiStatusModel extends ChangeNotifier {
  bool _isEmpty;

  NotiStatusModel() {
    _isEmpty = true;
  }

  bool IsEmpty() {
    return _isEmpty;
  }
}