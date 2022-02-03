import 'package:coach_my_body/coaches/ui/home/coach_home.dart';
import 'package:coach_my_body/coaches/ui/mymembers/mymembers.dart';
import 'package:coach_my_body/coaches/ui/mypage/coach_mypage.dart';
import 'package:coach_my_body/coaches/ui/navigation/coach_bottom_navigation_bar.dart';
import 'package:coach_my_body/coaches/ui/routine/coach_routine.dart';
import 'package:coach_my_body/ui/home/home.dart';
import 'package:coach_my_body/ui/login/login.dart';
import 'package:coach_my_body/ui/mypage/mypage.dart';
import 'package:coach_my_body/ui/root_page.dart';
import 'package:coach_my_body/ui/routine/routine.dart';
import 'package:coach_my_body/ui/navigation/bottom_navigation_bar.dart';
import 'package:coach_my_body/ui/record/record.dart';
import 'package:flutter/material.dart';

import 'ui/write/write.dart';

class Routes {
  Routes._();

  //static variables
  static const String root = '/root';
  static const String login = '/login';

  static const String tapPage = '/bottom-tab';
  static const String home = '/home';
  static const String routine = '/routine';
  static const String record = '/record';
  static const String mypage = '/mypage';
  static const String write = '/write';

  // coach static variables
  static const String coachTapPage = '/coach-bottom-tab';
  static const String coachHome = '/coach-home';
  static const String coachRoutine = '/coach-routine';
  static const String coachMembers = '/coach-members';
  static const String coachPage = '/coach-page';

  static final routes = <String, WidgetBuilder>{
    root: (BuildContext context) => RootPage(),
    login: (BuildContext context) => LoginScreen(),
    tapPage: (BuildContext context) => MemberBottomTabScreen(),
    home: (BuildContext context) => HomeScreen(),
    routine: (BuildContext context) => RoutineScreen(),
    record: (BuildContext context) => RecordScreen(),
    mypage: (BuildContext context) => MyPageScreen(),
    write: (BuildContext context) => WriteScreen(),
    coachTapPage: (BuildContext context) => CoachBottomNaviBar(),
    coachHome: (BuildContext context) => CoachHomeScreen(),
    coachRoutine: (BuildContext context) => CoachRoutineScreen(),
    coachMembers: (BuildContext context) => MyMembersScreen(),
    coachPage: (BuildContext context) => CoachMyPageScreen(),
  };
}
