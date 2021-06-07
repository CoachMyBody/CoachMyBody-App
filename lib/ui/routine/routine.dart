import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/routine/bookmark_selcect_button_model.dart';
import 'package:coach_my_body/providers/routine/routine_select_button_model.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/bookmark_select_button.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/my_bookmark_data.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/my_routine.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/my_routine_data.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_select_button.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_sub_myroutines.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark.dart';

import 'package:coach_my_body/widgets/custom_tab_pages_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutineScreen extends StatefulWidget {
  @override
  _RoutineScreenState createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.width * 0.26),
        child: AppBar(
          title: Text('루틴관리'),
          actions: [
            _selectedIndex == 0 ? RoutineSelectButton() : BookMarkSelectButton()
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.width * 0.116),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorColor: AppColors.cmb_grey[700],
                labelColor: AppColors.cmb_grey[700],
                isScrollable: true,
                onTap: (int index) {
                  if (index == 0) {
                    Provider.of<BookMarkSelectButtonModel>(context,
                            listen: false)
                        .resetBookMartButton();
                    Provider.of<MyBookMarkData>(context, listen: false)
                        .unSelectAllMyBookMark();
                  } else {
                    Provider.of<RoutineSelectButtonModel>(context,
                            listen: false)
                        .resetRoutineButton();
                    Provider.of<MyRoutineData>(context, listen: false)
                        .unSelectAllMyRoutine();
                  }
                },
                controller: _controller,
                tabs: [
                  Tab(
                    text: ('나의 루틴'),
                  ),
                  Tab(text: ('북마크'))
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [RoutineSubMyroutinesScreen(), RoutineSubBookmarkScreen()],
      ),
    );
  }
}
