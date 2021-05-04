import 'package:coach_my_body/providers/record/record_date_model.dart';
import 'package:coach_my_body/ui/record/record_sub_routines_daily.dart';
import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/ui/record/record_sub_routines_monthly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RecordSubRoutinesScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MonthlyViewModel()),
        ChangeNotifierProvider(create: (context) => SelectedDateViewModel()),
      ],
      child: Stack(
        children: <Widget>[
          Positioned(
            // TODO: Apply Muscles State
            top: size.width * 0.0893,
            right: size.width * 0.1421,
            child: SvgPicture.asset(
              Assets.musclesImgPath,
              // height: size.height * 0.567,
              width: size.width * 0.246,
            ),
          ),
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              RecordSubDailyRoutines(),
              RecordSubMonthlyRoutines()
            ],
          ),
        ],
      ),
    );
  }
}
