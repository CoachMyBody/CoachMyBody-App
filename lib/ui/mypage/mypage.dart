import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/mypage/mypage_coach_searching.dart';
import 'package:coach_my_body/ui/mypage/mypage_info.dart';
import 'package:coach_my_body/ui/mypage/mypage_card_widget.dart';
import 'package:coach_my_body/ui/mypage/mypage_my_activity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mypage_list_widget.dart';

class MyPageScreen extends StatelessWidget {
  bool coach = false;

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
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                '코치 전환',
              ),
              value: coach,
              onChanged: (bool coach) {},
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Color(0xFFC4C4C4),
                ),
                SizedBox(height: 21.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MypageInfo()));
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
                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text(
                    'cmb@gmail.com',
                    style: TextStyle(
                      color: AppColors.cmb_grey[300],
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0.0, vertical: -2),
                  title: Text(
                    '내 활동',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyActicity()));
                  },
                ),
                Container(
                  height: 80.0,
                  width: 328.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: AppColors.cmb_grey[50],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MypageCard(text: '내 레벨', count: '3'),
                      Container(
                          height: 22.0,
                          width: 1.0,
                          color: AppColors.cmb_grey[400]),
                      MypageCard(text: '획득 뱃지', count: '5'),
                      Container(
                          height: 22.0,
                          width: 1.0,
                          color: AppColors.cmb_grey[400]),
                      MypageCard(text: '운동 일수', count: '27')
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 5.0,
              color: AppColors.cmb_grey[50],
            ),
            Column(
              children: [
                MypageList(
                  text: tr(COACHING_SEARCH),
                  route: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MypageCoachSearching()));
                  },
                ),
                MypageList(text: tr(CONTACT_US)),
                MypageList(text: tr(APP_SETTING)),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0.0, vertical: -2),
                  title: Text(tr(LOGOUT)),
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
