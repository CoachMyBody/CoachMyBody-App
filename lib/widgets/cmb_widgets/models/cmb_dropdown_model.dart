import 'package:flutter/material.dart';

///
/// View Model
///

class CMBDropDownSheetData {
  CMBDropDownSheetData(
      {this.bBottomBtn = true, this.whenCompleted, this.sheet});

  final bool bBottomBtn;
  final Function whenCompleted;
  final Widget sheet;
}

class CMBBottomSheetButtonData {
  CMBBottomSheetButtonData(
      {this.isEnable = false, this.label = 'Click here', this.onPressed});

  final bool isEnable;
  final String label;
  final Function onPressed;
}

///
/// Provider Model
///

class CMBDropDownLabelProvider extends ChangeNotifier {
  CMBDropDownLabelProvider();

  String _label = '';

  String getLabel() => _label;

  void setLabel(String inLabel) {
    _label = inLabel;
    notifyListeners();
  }
}
