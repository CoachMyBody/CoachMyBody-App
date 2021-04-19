import 'package:coach_my_body/ui/record/record_sub_routines_daily.dart';
import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/ui/record/record_sub_routines_monthly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          // TODO: Apply Muscles State
          top: 50,
          right: 52.18,
          child: SvgPicture.asset(
            Assets.musclesImgPath,
            height: 267.64,
            width: 88.63,
          ),
        ),
      ],
    );
  }
}
