import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/home/home.dart';
import 'package:coach_my_body/ui/routine/routine.dart';
import 'package:coach_my_body/ui/mypage/mypage.dart';
import 'package:coach_my_body/ui/record/record.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {

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
  void initState(){
    super.initState();
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
        fixedColor: Colors.black,
        onTap: onTabTapped,
        currentIndex: _pageIndex,

        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: tr(NAV_HOME_NAME)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.square_foot), 
            label: '루틴관리'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq), 
            label: '운동현황'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback), 
            label: '마이페이지'
          )
        ]
      ),
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
