import 'package:flutter/material.dart';

class RoutineSubMyroutinesDetailList extends StatelessWidget {
  RoutineSubMyroutinesDetailList({@required this.text, @required this.route});

  final String text;
  final Function route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: 90,
          height: 90,
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: Image.asset(
            myExerciseList[int.parse(text)].imageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      title: Container(
        // padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  Container(
                    child: Text(
                      'tets',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '15회, 4세트',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '#헬스, #전신',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Text('편집'),
          ],
        ),
      ),
    );
  }
}

class MyExercise {
  int index;
  String imageUrl;
  String name;
  int full_count;
  int full_set;
  String hashtag;

  MyExercise(
      {this.index,
      this.imageUrl,
      this.name,
      this.full_count,
      this.full_set,
      this.hashtag});
}

List myExerciseList = [
  MyExercise(
      index: 0,
      imageUrl: 'assets/images/routine_testimg_4.png',
      name: '데드리프트',
      full_count: 15,
      full_set: 4,
      hashtag: '#헬스 #전신'),
];
