import 'package:coach_my_body/coaches/ui/home/coach_home_new.dart';
import 'package:coach_my_body/coaches/ui/home/coach_home_old.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/custom_tab_pages_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CoachHomeScreen extends StatelessWidget {
  CoachHomeScreen({Key key}) : super(key: key);

  final List<CMBPages> _supPages = [
    CMBPages(
      page: NewFeedbackScreen(),
      pageName: tr(COACH_HOME_NEW_FEEDBACK_TXT),
    ),
    CMBPages(
      page: OldFeedbackScreen(),
      pageName: tr(COACH_HOME_OLD_FEEDBACK_TXT),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomTabPageView(
      title: tr(COACH_HOME_NEW_TITLE),
      pages: _supPages,
      pageNum: _supPages.length,
    );
  }
}
