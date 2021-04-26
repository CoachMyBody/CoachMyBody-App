import 'package:coach_my_body/ui/home/home.dart';
import 'package:coach_my_body/ui/mypage/mypage.dart';
import 'package:coach_my_body/ui/routine/routine.dart';
import 'package:coach_my_body/ui/navigation/bottom_navigation_bar.dart';
import 'package:coach_my_body/ui/record/record.dart';
import 'package:flutter/material.dart';

import 'ui/write/write.dart';

class Routes {
  Routes._();

  //static variables
  static const String home = '/home';
  static const String routine = '/routine';
  static const String record = '/record';
  static const String mypage = '/mypage';
  static const String write = '/write';
  static const String tapPage = '/bottom-tab';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
    routine: (BuildContext context) => RoutineScreen(),
    record: (BuildContext context) => RecordScreen(),
    mypage: (BuildContext context) => MyPageScreen(),
    tapPage: (BuildContext context) => TabPage(),
    write: (BuildContext context) => WriteScreen(),
  };
}
