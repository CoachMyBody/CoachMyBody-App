import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'my_bookmark.dart';

class MyBookMarkData extends ChangeNotifier {
  final List<MyBookMark> _myBookMarks = [
    MyBookMark(
        imageUrl: 'assets/images/routine_testimg_2.png',
        title: '홍길동 코치의 7일만에 어깡 만들기 루틴!',
        tags: ['#헬스']),
    MyBookMark(
        imageUrl: 'assets/images/routine_testimg_2.png',
        title: '홍길동 코치의 7일만에 어깡 만들기 루틴!!',
        tags: ['#헬스', '#어깨']),
  ];

  UnmodifiableListView<MyBookMark> get myBookMarks {
    return UnmodifiableListView(_myBookMarks);
  }

  int getMyBookMarkCount() {
    return _myBookMarks.length;
  }

  void deleteMyBookMark(MyBookMark myBookMark) {
    _myBookMarks.remove(myBookMark);
    notifyListeners();
  }

  void selectMyBookMark(MyBookMark myBookMark) {
    myBookMark.toggleChecked();
    notifyListeners();
  }

  void selectAllMyBookMark() {
    _myBookMarks.forEach((element) {
      element.isSelected = true;
      notifyListeners();
    });
  }

  void unSelectAllMyBookMark() {
    _myBookMarks.forEach((element) {
      element.isSelected = false;
      notifyListeners();
    });
  }
}
