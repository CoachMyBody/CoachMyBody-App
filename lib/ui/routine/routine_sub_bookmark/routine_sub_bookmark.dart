import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'file:///C:/workspace/CoachMyBody-App/lib/ui/routine/routine_sub_bookmark/routine_sub_bookmark_list.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark_detail.dart';

class RoutineSubBookmarkScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          RoutineSubBookmarkList(
            text: tr('0'),
            route: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoutineSubBookmarkDetail()));
            },
          ),
        ],
      ),
    );
  }
}
