import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/mypage/mypage_coach_searching.dart';
import 'package:coach_my_body/ui/mypage/mypage_info.dart';
import 'package:coach_my_body/ui/mypage/mypage_card_widget.dart';
import 'package:coach_my_body/ui/mypage/mypage_my_activity.dart';
import 'package:coach_my_body/ui/mypage/mypage_setting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'mypage_list_widget.dart';

class MyPageScreen extends StatelessWidget {
  bool isCoachMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr(MYPAGE_SUB_TITLE),
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterSwitch(
                    width: 35.0,
                    height: 20.0,
                    padding: 2.0,
                    toggleSize: 15.0,
                    value: isCoachMode,
                    onToggle: (value) {},
                    activeColor: AppColors.cmb_accent[100],
                    inactiveColor: AppColors.cmb_grey[100],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(SWITCH_TO_COACH_MODE).tr(),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Color(0xFFC4C4C4),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MypageInfo()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '코마바',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MypageList(
                    text: tr(MY_ACTIVITY),
                    route: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyActivity()));
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    height: 80.0,
                    width: 328.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: AppColors.cmb_grey[50],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MypageCard(text: tr(MY_LEVEL), count: '3'),
                        MypageCard(text: tr(BADGES_EARNED), count: '5'),
                        MypageCard(text: tr(WORKOUT_DAYS), count: '27')
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  MypageList(
                    text: tr(COACH_SEARCHING),
                    route: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MypageCoachSearching()));
                    },
                  ),
                  MypageList(
                    text: tr(APP_SETTING),
                    route: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Setting()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
