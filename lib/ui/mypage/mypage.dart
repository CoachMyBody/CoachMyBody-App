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
  double _width;
  bool isCoachMode = false;
  final String _nickname = '코마바';
  final int _level = 3;
  final int _badge = 5;
  final int _record = 27;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(_width * 0.0444),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr(MYPAGE_SUB_TITLE),
                style: TextStyle(
                    color: AppColors.cmb_grey[700],
                    fontWeight: FontWeight.w700,
                    fontSize: _width * 0.0555),
              ),
              SizedBox(height: _width * 0.0222),
              MergeSemantics(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterSwitch(
                      width: _width * 0.0777,
                      height: _width * 0.0444,
                      padding: _width * 0.005,
                      toggleSize: _width * 0.0333,
                      value: isCoachMode,
                      onToggle: (value) {},
                      activeColor: AppColors.cmb_blue,
                      inactiveColor: AppColors.cmb_grey[100],
                    ),
                    SizedBox(
                      width: _width * 0.0222,
                    ),
                    Text(
                      SWITCH_TO_COACH_MODE,
                      style: TextStyle(
                          color: AppColors.cmb_grey[700],
                          fontSize: _width * 0.0444,
                          fontWeight: FontWeight.w400),
                    ).tr(),
                  ],
                ),
              ),
              SizedBox(
                height: _width * 0.05555,
              ),
              Center(
                child: Column(
                  children: [
                    Stack(children: [
                      CircleAvatar(
                          radius: _width * 0.1444,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                              'assets/images/test/profile_image_test.png')),
                      Positioned(
                        right: _width * 0.0166,
                        bottom: _width * 0.0166,
                        child: CircleAvatar(
                          radius: _width * 0.0333,
                          child: Image.asset(
                              'assets/images/test/kakao_icon_test.png'),
                        ),
                      )
                    ]),
                    SizedBox(height: _width * 0.0333),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MypageInfo()));
                      },
                      label: Icon(
                        CupertinoIcons.right_chevron,
                        size: _width * 0.0444,
                      ),
                      icon: Text(
                        _nickname,
                        style: TextStyle(
                            color: AppColors.cmb_grey[700],
                            fontWeight: FontWeight.w500,
                            fontSize: _width * 0.05),
                      ),
                    ),
                  ],
                ),
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
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.1111),
                    height: _width * 0.2222,
                    width: _width * 0.9111,
                    margin: EdgeInsets.symmetric(vertical: _width * 0.0444),
                    decoration: BoxDecoration(
                      color: AppColors.cmb_grey[50],
                      borderRadius: BorderRadius.circular(_width * 0.01),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MypageCard(
                            text: tr(MY_LEVEL), count: _level.toString()),
                        MypageCard(
                            text: tr(BADGES_EARNED), count: _badge.toString()),
                        MypageCard(
                            text: tr(WORKOUT_DAYS), count: _record.toString())
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
