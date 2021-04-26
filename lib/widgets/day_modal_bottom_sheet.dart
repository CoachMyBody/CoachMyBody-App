import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/common_bottom_sheet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentDate extends ChangeNotifier {
  CurrentDate() : currentTime = DateTime.now() {
    _year = currentTime.year;
    _month = currentTime.month;
  }

  final DateTime currentTime;
  int _year;
  int _month;

  int getCurrentYear() {
    return _year;
  }

  void setCurrentYear(int inYear) {
    _year = inYear;
    notifyListeners();
  }

  int getCurrentMonth() {
    assert(_month > 0 && _month < 13);
    return _month;
  }

  void setToNextMonth() {
    if (DateTime.december == _month) {
      _month = DateTime.january;
      _year++;
    } else {
      _month++;
    }
    notifyListeners();
  }

  void setToPreviousMonth() {
    if (DateTime.january == _month) {
      _month = DateTime.december;
      _year--;
    } else {
      _month--;
    }
    notifyListeners();
  }
}

class DayModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentDate()),
      ],
      child: Popover(
        child: Column(
          children: <Widget>[
            MonthlyIndicatorWidget(),
            OKButtonInBottomSheet(false), // Button 활성화
          ],
        ),
      ),
    );
  }
}

class MonthlyIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 308,
      width: 360,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.navigate_before),
                  onPressed: () {
                    Provider.of<CurrentDate>(context, listen: false)
                        .setToPreviousMonth();
                  },
                ),
                Consumer<CurrentDate>(
                  builder: (_, date, child) => Text(
                      date.getCurrentYear().toString() +
                          tr(COMMON_YEAR_TXT) +
                          tr(COMMON_YEAR_MONTH_DIVIDER_TXT) +
                          date.getCurrentMonth().toString() +
                          tr(COMMON_MONTH_TXT)),
                ),
                IconButton(
                  icon: const Icon(Icons.navigate_next),
                  onPressed: () {
                    Provider.of<CurrentDate>(context, listen: false)
                        .setToNextMonth();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            // child: MonthlyCalendarWidget(),
            child: Consumer<CurrentDate>(
              builder: (_, date, child) => MonthlyCalendarWidget(
                date.getCurrentYear(),
                date.getCurrentMonth(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MonthlyCalendarWidget extends StatefulWidget {
  MonthlyCalendarWidget(this.year, this.month) {
    assert(year > 0 && month < 13);
    _lastDate = DateTime(year, month + 1, 0).day;
    _startDayOfWeek = DateTime.utc(year, month, 1).weekday;

    if (DateTime.sunday == _startDayOfWeek) {
      _startDayOfWeek = 0;
    }
    assert(_startDayOfWeek > -1 && _startDayOfWeek < 7);

    _endDayOfWeek = DateTime.utc(year, month, _lastDate).weekday;
  }

  final int year;
  final int month;

  int _lastDate;
  int _startDayOfWeek;
  int _endDayOfWeek;

  @override
  _MonthlyCalendarWidgetState createState() => _MonthlyCalendarWidgetState();
}

class _MonthlyCalendarWidgetState extends State<MonthlyCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: 사이즈 overflow
    // TODO: 4주 6주 될 때 세로 길이 줄어들었다 늘어났다....
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: _getDateNum(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // TODO: save selected index
            print(index - widget._startDayOfWeek + 1);
          },
          child: Container(
            width: 40.0,
            height: 44.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildDate(index, widget._startDayOfWeek, widget._lastDate),
              ],
            ),
          ),
        );
      },
    );
  }

  int _getDateNum() {
    int dateNum = 0;

    if (DateTime.sunday != widget._endDayOfWeek) {
      dateNum = widget._lastDate +
          widget._startDayOfWeek +
          (DateTime.daysPerWeek - widget._endDayOfWeek - 1);
    } else if (DateTime.sunday == widget._endDayOfWeek &&
        28 == widget._lastDate) {
      dateNum = widget._lastDate + widget._startDayOfWeek + 6;
    } else {
      dateNum = widget._lastDate + widget._startDayOfWeek;
    }

    return dateNum;
  }

  Text _buildDate(int index, int startDayOfWeek, int lastDate) {
    TextStyle dateStyle = TextStyle(color: AppColors.cmb_grey[700]);
    int date = index - startDayOfWeek + 1;

    if (date <= 0) {
      int lastMonthDate = DateTime(widget.year, widget.month, 0).day;
      date += lastMonthDate;
      dateStyle = TextStyle(color: AppColors.cmb_grey[200]);
    } else if (date > lastDate) {
      date = index - startDayOfWeek + 1 - lastDate;
      dateStyle = TextStyle(color: AppColors.cmb_grey[200]);
    }

    return Text(
      date.toString(),
      style: dateStyle,
    );
  }
}
