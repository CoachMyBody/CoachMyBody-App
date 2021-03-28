import 'package:coach_my_body/ui/home/home.dart';
import 'package:coach_my_body/ui/info/info.dart';
import 'package:coach_my_body/ui/record/record.dart';
import 'package:coach_my_body/ui/status/sstatus.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String home = '/home';
  static const String record = '/record';
  static const String status = '/status';
  static const String info = '/info';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
    record: (BuildContext context) => RecordScreen(),
    status: (BuildContext context) => StatusScreen(),
    info: (BuildContext context) => InfoScreen(),
  };
}