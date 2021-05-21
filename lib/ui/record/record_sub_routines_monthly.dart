import 'dart:math';

import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/custom_drop_down_widget.dart';
import 'package:coach_my_body/widgets/month_modal_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

///
/// Monthly Routines View
///
// ignore: must_be_immutable
class RecordSubMonthlyRoutines extends StatelessWidget {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: _size.width * 0.072,
        ),
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.0444),
          child: CustomDropDownWidget(
            label: '21년 4월',
            onPressed: () {
              showModalBottomSheet<int>(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return MonthModalBottomSheet();
                },
              );
            }),
        ),
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.0555, top: 12),
          child: _buildDailyRoutinesTxt(),
        ),
        SizedBox(
          height: _size.height * 0.26,
        ),
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.0444),
          child: MonthlyRoutinesView(),
        ),
      ],
    );
  }

  Widget _buildDailyRoutinesTxt() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            color: AppColors.cmb_grey[700], fontSize: _size.width * 0.0667),
        children: <TextSpan>[
          TextSpan(
              text: '총 3일', // TODO: provider
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: '동안\n운동했어요.'),
        ],
      ),
    );
  }
}


///
/// Day routine lists
/// 

class MonthlyRoutinesView extends StatefulWidget {
@override
_MonthlyRoutinesViewState createState() => _MonthlyRoutinesViewState();
}

class _MonthlyRoutinesViewState extends State<MonthlyRoutinesView> {

  PageController _pageController;
  double _viewPortFraction = 0.2;
  double _page = 2.0;
  int _currentPage = 2;

  static const double _fullScale = 1.0;
  static const _minHeightScale = 0.83;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: _currentPage, viewportFraction: _viewPortFraction);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double maxHeight = size.width * 0.305;

    return Column(
      children: <Widget>[
        Container(
          height: maxHeight,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                setState(() {
                  _page = _pageController.page;
                });
              }
            },
            child: _buildDailyListView(maxHeight),
          ),
        ),
      ],
    );
  }

  Widget _buildDailyListView(double height) {
    return PageView.builder(
      onPageChanged: (pos) {
        setState(() {
          _currentPage = pos;
        });
      },
      physics: BouncingScrollPhysics(),
      controller: _pageController,
      itemCount: dailyRoutinesData.length,
      itemBuilder: (context, index) {
        final scale = max(_minHeightScale,
            (_fullScale - (index - _page).abs()) + _viewPortFraction);
        bool bActive = false;
        if ((index - _page).abs() < 0.5) {
          bActive = true;
        }
        return _buildDailyContent(dailyRoutinesData[index], dailyRoutinesData[index]['num'], scale, bActive, height);
      },
    );
  }

  Widget _buildDailyContent(Map content, String num, double scale, bool b, double height) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Center(
        child: Container(
          height: height * scale,
          width: height * scale,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if ('0' != num) Icon(Icons.check),
              Text(
                content['day'],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15 * scale,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                content['date'],
                style: TextStyle(color: Colors.black),
              ),
              if (true == b)
                Container(
                  margin: EdgeInsets.only(top: 4.0),
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(4.0))
                  ),
                  child: Text('$num개 기록'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> dailyRoutinesData = [
  {'day': '월요일', 'date': '5/3', 'num': '0'},
  {'day': '화요일', 'date': '5/4', 'num': '1'},
  {'day': '수요일', 'date': '5/5', 'num': '2'},
  {'day': '목요일', 'date': 'Today', 'num': '0'},
  {'day': '금요일', 'date': '5/7', 'num': '0'},
  {'day': '토요일', 'date': '5/8', 'num': '0'},
  {'day': '일요일', 'date': '5/9', 'num': '0'},
];

