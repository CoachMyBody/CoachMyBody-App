import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/record/record_notification.dart';
import 'package:coach_my_body/ui/record/record_sub_routines.dart';
import 'package:coach_my_body/ui/record/record_sub_statistics.dart';
import 'package:coach_my_body/widgets/custom_tab_pages_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {

  final List<CMBPages> _supPages = [
    CMBPages(
      page: RecordSubRoutinesScreen(),
      pageName: tr(RECORD_SUB_ROUTINES_TITLE),

    ),
    CMBPages(
      page: RecordSubStatisticsScreen(),
      pageName: tr(RECORD_SUB_STATISTICS_TITLE),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomTabPageView(
      title: tr(RECORD_MAIN_TITLE),
      pages: _supPages,
      pageNum: _supPages.length,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.notifications_none_rounded,), onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return RecordNotificationScreen();
          }));
        })
      ],
    );
  }
}
