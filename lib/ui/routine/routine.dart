import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_sub_myroutines.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark_list.dart';

import 'package:coach_my_body/widgets/custom_tab_pages_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RoutineScreen extends StatelessWidget {
  int test = 1;
  final List<CMBPages> _supPages = [
    CMBPages(
      page: RoutineSubMyroutinesScreen(),
      pageName: tr(ROUTINE_SUB_MYROUTINE_TITLE),
    ),
    CMBPages(
      page: RoutineSubBookmarkScreen(),
      pageName: tr(ROUTINE_SUB_BOOKMARK_TITLE),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomTabPageView(
      title: tr(ROUTINE_MAIN_TITLE),
      pages: _supPages,
      pageNum: _supPages.length,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            bookmarkSelect();
          },
          child: Text('선택'),
        ),
      ],
    );
  }
}
