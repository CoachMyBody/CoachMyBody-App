import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/data/sharedpref/auth_preferences.dart';
import 'package:coach_my_body/ui/mypage/mypage_list_widget.dart';
import 'package:coach_my_body/ui/mypage/mypage_notification.dart';
import 'package:coach_my_body/utils/managers/auth_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../routes.dart';
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
                //코치전환
                MergeSemantics(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FutureBuilder(
                        future: (AuthMan().checkAuthStatus()),
                        builder: (context, snapshot) {
                          return FlutterSwitch(
                            width: _width * 0.0777,
                            height: _width * 0.0444,
                            padding: _width * 0.005,
                            toggleSize: _width * 0.0333,
                            value: (AuthStat.coach == snapshot.hasData),
                            onToggle: (value) {
                              AuthPreferences().setIsCoachMode(true);

                              Navigator.pushNamedAndRemoveUntil(context,
                                  Routes.coachTapPage, (route) => false);
                            },
                            activeColor: AppColors.cmb_blue,
                            inactiveColor: AppColors.cmb_grey[100],
                          );
                        },
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
