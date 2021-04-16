import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class RecordSubRoutinesScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            RecordSubDailyRoutines(),
            RecordSubMonthlyRoutines()
          ],
        ),
        Positioned(
          top: 50,
          right: 0,
          child: SizedBox(
            height: 350,
            child: Image(
              image: AssetImage(Assets.musclesImgPath),
            ),
          ),
        ),
      ],
    );
  }
}

///
/// Daily Routines View
///
class RecordSubDailyRoutines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '하이루',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          SizedBox(
            height: 350.0,
          ),
          //RecordRoutinesScroller()
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: routines.length,
                itemBuilder: (BuildContext context, int index) =>
                    RecordRoutineListItem(routines[index])),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class RecordRoutineListItem extends StatelessWidget {
  RecordRoutineListItem(@required this.routine) {
    assert(routine.name.isNotEmpty);
  }

  final Routines routine;

  String _convertMinToString() {
    assert(0 != routine.mins);

    int hours = (routine.mins / 60).floor();
    int mins = routine.mins % 60;

    return '$hours시간 $mins분';
  }

  String _convertIsFeedbackToString() {
    if (false == routine.isFeedback) {
      return '피드백 기다리는 중..';
    } else {
      return '피드백이 도착!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: AppColors.cmb_grey[600],
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ListTile(
          title: Text(
            routine.name,
            style: TextStyle(color: AppColors.cmb_grey[100]),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _convertMinToString(),
                style: TextStyle(color: AppColors.cmb_grey[100]),
              ),
              Text(
                _convertIsFeedbackToString(),
                style: TextStyle(color: AppColors.cmb_blue),
              )
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

///
/// Monthly Routines View
///
class RecordSubMonthlyRoutines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[Text('test22')],
    );
  }
}

/* Dummy Data */
class Routines {
  const Routines(
      @required this.name, @required this.mins, @required this.isFeedback);

  final String name;
  final int mins;
  final bool isFeedback;
}

const routines = [
  Routines('안녕하세요! \n코마바입니다.', 100, true),
  Routines('지방을 불태워🔥\n10분만 달려요', 10, false),
  Routines('어이 거기 거북이\n목 한 번 집어넣고 갈...', 20, false),
  Routines('안녕하세요! \n코마바입니다.', 100, false),
  Routines('안녕하세요! \n코마바입니다.', 100, false),
];
