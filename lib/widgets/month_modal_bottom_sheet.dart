import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/common_bottom_sheet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonthModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: Popover(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 2),
                onSelectedItemChanged: (value) {
                  // setState(() {
                  //   _selectedValue = value;
                  // });
                },
                children: [
                  Text('0'),
                  Text('2'),
                  Text('4'),
                ],
              ),
            ),
            OKButtonInBottomSheet(false), // Button 활성화...
          ],
        ),
      ),
    );
  }
}
