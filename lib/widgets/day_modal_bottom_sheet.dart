import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/common_bottom_sheet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DayModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Popover(
      child: Column(
        children: <Widget>[
          _buildMonthly(2021, 4),
          OKButtonInBottomSheet(),
        ],
      ),
    );
  }

  Widget _buildMonthly(int year, int month) {
    DateTime currentMonth = DateTime(year, month, 0);
    int lastDay = currentMonth.day;

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
                IconButton(icon: const Icon(Icons.navigate_before), onPressed: () {}),
                Text(year.toString() + '/' + month.toString()),
                IconButton(icon: const Icon(Icons.navigate_next), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: lastDay,
              itemBuilder: (context, index) {
                return Container(
                  width: 40.0,
                  height: 44.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(index.toString()),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
