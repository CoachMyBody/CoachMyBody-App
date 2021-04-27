import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/common_bottom_sheet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MonthModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: Popover(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Text('연도'),
            ),
            ListTile(
              leading: Text('월'),
            ),
            OKButtonInBottomSheet(false), // Button 활성화...
          ],
        ),
      ),
    );
  }
}
