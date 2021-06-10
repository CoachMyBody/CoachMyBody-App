import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/home/home.dart';
import 'package:coach_my_body/ui/routine/routine.dart';
import 'package:coach_my_body/ui/mypage/mypage.dart';
import 'package:coach_my_body/ui/record/record.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabPage extends StatefulWidget {
  int index;

  TabPage({this.index = 0});

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  PageController _pageController;

  int _pageIndex = 0;

  final List<Widget> _tabPages = [
    HomeScreen(),
    RoutineScreen(),
    RecordScreen(),
    MyPageScreen()
  ];

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.index;
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        controller: _pageController,
        children: _tabPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _pageIndex,
          backgroundColor: AppColors.cmb_grey[0],
          selectedItemColor: AppColors.cmb_blue,
          unselectedItemColor: AppColors.cmb_grey[700],
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.homeIconPath,
                    color: 0 == _pageIndex
                        ? AppColors.cmb_blue
                        : AppColors.cmb_grey[700]),
                label: tr(NAV_HOME_NAME)),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.routineManIconPath,
                    color: 1 == _pageIndex
                        ? AppColors.cmb_blue
                        : AppColors.cmb_grey[700]),
                label: tr(NAV_ROUT_MAN_NAME)),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.recordStatusIconPath,
                    color: 2 == _pageIndex
                        ? AppColors.cmb_blue
                        : AppColors.cmb_grey[700]),
                label: tr(NAV_REC_STAT_NAME)),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.mypageIconPath,
                    color: 3 == _pageIndex
                        ? AppColors.cmb_blue
                        : AppColors.cmb_grey[700]),
                label: tr(NAV_MYPAGE_NAME))
          ]),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }
}
