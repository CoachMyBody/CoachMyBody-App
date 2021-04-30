import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/record/record_date_model.dart';
import 'package:coach_my_body/widgets/common_bottom_sheet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayModalBottomSheet extends StatelessWidget {
  void _callBackDayModalOKBtn(BuildContext context) {
    print('_callBackDayModalOKBtn');

    Provider.of<SelectedDateViewModel>(context, listen: false)
        .setSelectedDate(2021, 1, 1);

    Provider.of<SelectedDateViewModel>(context, listen: false)
        .getSelectedTime();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MonthlyViewModel()),
          ChangeNotifierProvider(create: (context) => SelectedDateViewModel()),
        ],
        child: Builder(builder: (context) {
          return Popover(
            child: Column(
              children: <Widget>[
                MonthlyIndicatorWidget(),
                Consumer<SelectedDateViewModel>(builder: (_, selected, child) {
                  return OKButtonInBottomSheet(
                    selected.getSelected(),
                    onPressed: () => _callBackDayModalOKBtn(context),
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// ignore: must_be_immutable
class MonthlyIndicatorWidget extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: _width * 0.855,
      width: _width,
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
                    Provider.of<MonthlyViewModel>(context, listen: false)
                        .setToPreviousMonth();
                    Provider.of<SelectedDateViewModel>(context, listen: false)
                        .setSelected(false);
                  },
                ),
                Consumer<MonthlyViewModel>(
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
                    Provider.of<MonthlyViewModel>(context, listen: false)
                        .setToNextMonth();
                    Provider.of<SelectedDateViewModel>(context, listen: false)
                        .setSelected(false);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            // child: MonthlyCalendarWidget(),
            child: Consumer<MonthlyViewModel>(
              builder: (_, date, child) => MonthlyCalendarWidget(
                  date.getCurrentYear(), date.getCurrentMonth(), _width),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MonthlyCalendarWidget extends StatefulWidget {
  MonthlyCalendarWidget(this.year, this.month, this.width) {
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
  final double width;

  int _lastDate;
  int _startDayOfWeek;
  int _endDayOfWeek;

  @override
  _MonthlyCalendarWidgetState createState() => _MonthlyCalendarWidgetState();
}

class _MonthlyCalendarWidgetState extends State<MonthlyCalendarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: 사이즈 overflow
    // TODO: 4주 6주 될 때 세로 길이 줄어들었다 늘어났다....
    return GridView.builder(
      // physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: DateTime.daysPerWeek,
      ),
      itemCount: _getDateNum(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // TODO: save selected index
            print(index - widget._startDayOfWeek + 1);
            if (0 < index - widget._startDayOfWeek + 1 &&
                index - widget._startDayOfWeek < widget._lastDate) {
              if (_selectedIndex == index) {
                Provider.of<SelectedDateViewModel>(context, listen: false)
                    .setSelectedToNegative();
              } else {
                Provider.of<SelectedDateViewModel>(context, listen: false)
                    .setSelected(true);
              }
              _selectedIndex = index;
            }
          },
          child: Consumer<SelectedDateViewModel>(
            builder: (_, selected, child) {
              return Container(
                width: widget.width * 0.111,
                height: widget.width * 0.122,
                decoration: BoxDecoration(
                  color: _selectedIndex > 0 &&
                          _selectedIndex == index &&
                          selected.getSelected() == true
                      ? AppColors.cmb_grey[800]
                      : AppColors.cmb_grey[0],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Consumer<SelectedDateViewModel>(
                        builder: (_, selected, child) {
                      return _buildDate(selected.getSelected(), index,
                          widget._startDayOfWeek, widget._lastDate);
                    }),
                    // _buildDate(index, widget._startDayOfWeek, widget._lastDate),
                  ],
                ),
              );
            },
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

  Text _buildDate(bool selected, int index, int startDayOfWeek, int lastDate) {
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

    if (_selectedIndex > 0 && _selectedIndex == index && selected == true) {
      dateStyle = TextStyle(color: AppColors.cmb_grey[0]);
    }

    return Text(
      date.toString(),
      style: dateStyle,
    );
  }
}
