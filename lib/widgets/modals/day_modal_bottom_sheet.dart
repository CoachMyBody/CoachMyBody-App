import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/record/record_date_model.dart';
import 'package:coach_my_body/widgets/cmb_widgets/cmb_bottom_sheet.dart';
import 'package:coach_my_body/widgets/cmb_widgets/models/cmb_dropdown_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayModalBottomSheet extends StatelessWidget {
  void _callBackDayModalOKBtn(BuildContext context) {
    var selected = Provider.of<SelectedDateViewModel>(context, listen: false);

    selected.setReturnedDate();
    selected.setSelected(false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider>[
        ChangeNotifierProvider(create: (context) => MonthlyViewModel()),
      ],
      child: Builder(builder: (context) {
        return Consumer<SelectedDateViewModel> (
          builder: (_, selected, child) {
            return CMBBottomSheet(
              buttonData: CMBBottomSheetButtonData(
                isEnable: selected.getSelected(), // TODO: provider
                label: tr(COMMON_OK_TXT), // TODO: constant
                onPressed: () => _callBackDayModalOKBtn(context), // TODO: callback function if clicking the button
              ),
              child: Column(
                children: <Widget>[
                  CalendarWidget(),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

// ignore: must_be_immutable
class CalendarWidget extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: _width * 0.855,
      width: _width,
      child: Column(
        children: <Widget>[
          MonthlyIndicatorWidget(),
          Expanded(
            // child: MonthlyCalendarWidget(),
            child: Consumer<MonthlyViewModel>(
              builder: (_, date, child) => MonthlyDatesWidget(
                  date.getCurrentYear(), date.getCurrentMonth(), _width),
            ),
          ),
        ],
      ),
    );
  }
}

class MonthlyIndicatorWidget extends StatelessWidget {
  const MonthlyIndicatorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}


// ignore: must_be_immutable
class MonthlyDatesWidget extends StatefulWidget {
  MonthlyDatesWidget(this.year, this.month, this.width) {
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

  /// This variable refers to the number of date every month
  int _lastDate;

  /// This variable indicates the day of the week that starts every month
  /// Mon to Sun
  int _startDayOfWeek;

  /// This variable indicates the day of the week that ends every month
  /// Mon to Sun
  int _endDayOfWeek;

  @override
  _MonthlyDatesWidgetState createState() => _MonthlyDatesWidgetState();
}

class _MonthlyDatesWidgetState extends State<MonthlyDatesWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var selected = Provider.of<SelectedDateViewModel>(context, listen: false);

    return GridView.builder(
      // physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: DateTime.daysPerWeek,
      ),
      itemCount: _getDateNum(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (0 < index - widget._startDayOfWeek + 1 &&
                index - widget._startDayOfWeek < widget._lastDate) {
              if (_selectedIndex == index) {
                selected.setSelectedToNegative();
              } else {
                selected.setSelected(true);
              }
              _selectedIndex = index;
              var curr = Provider.of<MonthlyViewModel>(context, listen: false);
              selected.setSelectedDate(
                      curr.getCurrentYear(),
                      curr.getCurrentMonth(),
                      index - widget._startDayOfWeek + 1);
            }
          },
          child: Consumer<SelectedDateViewModel>(
            builder: (_, selected, child) {
              return Container(
                width: widget.width * 0.111,
                height: widget.width * 0.122,
                margin: EdgeInsets.all(4.0),
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
