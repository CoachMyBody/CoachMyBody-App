import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/common_bottom_sheet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecordInbodyModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: Popover(
        child: Column(
          children: <Widget>[
            Text(RECORD_SUB_STATISTICS_INBODY_MODAL_TITLE).tr(),
            OKButtonInBottomSheet(false),
          ],
        ),
      ),
    );
  }
}
