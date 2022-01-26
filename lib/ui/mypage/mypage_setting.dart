import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/mypage/mypage_list_widget.dart';
import 'package:coach_my_body/ui/mypage/mypage_notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'mypage_coach_searching.dart';

class Setting extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            APP_SETTING,
            style: TextStyle(
              color: AppColors.cmb_grey[700],
              fontSize: _width * 0.0444,
              fontWeight: FontWeight.w500,
            ),
          ).tr(),
        ),
        body: Padding(
            padding: EdgeInsets.all(_width * 0.0444),
            child: Column(
              children: [
                MypageList(text: '코치로 전환', route: () {}),
                MypageList(text: '주의사항', route: () {}),
                MypageList(
                    text: '코치찾기',
                    route: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MypageCoachSearching()));
                    }),
                MypageList(text: '정책 및 보안', route: () {}),
                MypageList(
                    text: '알림설정',
                    route: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MypageNotification()));
                    }),
                MypageList(text: '문의하기', route: () {}),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {},
                    child: Text(
                      LOGOUT,
                      style: TextStyle(
                          color: AppColors.cmb_grey[700],
                          fontSize: _width * 0.0388,
                          fontWeight: FontWeight.w400),
                    ).tr(),
                  ),
                ))
              ],
            )));
  }
}
