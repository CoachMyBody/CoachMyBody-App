import 'dart:collection';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/my_routine.dart';
import 'package:flutter/cupertino.dart';

class MyRoutineData extends ChangeNotifier {
  final List<MyRoutine> _myRoutines = [
    MyRoutine(
        myRoutineId: 0,
        myRoutineImg: 'assets/images/routine_testimg_1.png',
        myRoutineTitle: '코마바님의 운동 루틴',
        exerciseCount: 1),
    MyRoutine(
        myRoutineId: 1,
        myRoutineImg: 'assets/images/routine_testimg_2.png',
        myRoutineTitle: '홍길동 코치의 7일만에 어깡 만들기..',
        exerciseCount: 1),
  ];

  UnmodifiableListView<MyRoutine> get myRoutines {
    return UnmodifiableListView(_myRoutines);
  }

  int get myRoutineCount {
    return _myRoutines.length;
  }

  void deleteMyRoutine(MyRoutine myRoutine) {
    _myRoutines.remove(myRoutine);
    notifyListeners();
  }

  void selectMyRoutine(MyRoutine myRoutine) {
    myRoutine.toggleChecked();
    notifyListeners();
  }

  void selectAllMyRoutine() {
    _myRoutines.forEach((element) {
      element.isSelected = true;
      notifyListeners();
    });
  }

  void unSelectAllMyRoutine() {
    _myRoutines.forEach((element) {
      element.isSelected = false;
      notifyListeners();
    });
  }
}
