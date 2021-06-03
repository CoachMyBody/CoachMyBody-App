import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/routine/routine_select_button_model.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/my_routine_data.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_select_button.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_sub_myroutines.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark_list.dart';

import 'package:coach_my_body/widgets/custom_tab_pages_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutineScreen extends StatelessWidget {
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RoutineSelectButtonModel()),
        ChangeNotifierProvider(create: (context) => MyRoutineData())
      ],
      child: CustomTabPageView(
          title: tr(ROUTINE_MAIN_TITLE),
          pages: _supPages,
          pageNum: _supPages.length,
          actions: [RoutineSelectButton()]),
    );
  }
}
