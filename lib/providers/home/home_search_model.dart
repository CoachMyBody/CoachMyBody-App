import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  bool _isSearchTapped;

  SearchViewModel() {
    _isSearchTapped = false;
  }

  bool get isSearchTapped => _isSearchTapped;

  set isSearchTapped(bool isSearchTapped) {
    _isSearchTapped = isSearchTapped;
    notifyListeners();
  }
}