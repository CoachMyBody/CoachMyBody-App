import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class RoutineCreateExerciseDetailPage extends StatefulWidget {
  const RoutineCreateExerciseDetailPage({Key key}) : super(key: key);

  @override
  _RoutineCreateExerciseDetailPageState createState() => _RoutineCreateExerciseDetailPageState();
}

class _RoutineCreateExerciseDetailPageState extends State<RoutineCreateExerciseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('운동상세 선택', textAlign: TextAlign.center,),
        actions: [
          Icon(Icons.search)
        ]
      ),
    );
  }
}
