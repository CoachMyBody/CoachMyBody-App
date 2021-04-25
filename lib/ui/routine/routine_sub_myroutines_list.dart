import 'package:flutter/material.dart';

class RoutineSubMyroutinesList extends StatelessWidget {
  RoutineSubMyroutinesList({@required this.text, @required this.route});

  final String text;
  final Function route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: 48,
          height: 48,
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: Image.asset(
            myRoutinesList[int.parse(text)].imageUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      title: Text(
        myRoutinesList[int.parse(text)].name,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: route,
    );
  }
}

class MyRoutines {
  int index;
  String imageUrl;
  String name;

  MyRoutines({this.index, this.imageUrl, this.name});
}

List myRoutinesList = [
  MyRoutines(
      index: 0,
      imageUrl: "assets/images/routine_testimg_1.png",
      name: "코마바님의 운동 루틴"),
  MyRoutines(
      index: 1,
      imageUrl: "assets/images/routine_testimg_2.png",
      name: "홍길동 코치의 7일만에 어깡 만들기.."),
];
