import 'package:coach_my_body/widgets/common_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class RecordPhotoModalBottomSheet extends StatelessWidget {
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
