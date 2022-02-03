import 'package:coach_my_body/coaches/ui/mypage/coach_mypage_setting.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

import 'coach_mypage_info.dart';

class CoachMyPageScreen extends StatelessWidget {
  double _width;
  String _nickname;
  String _address;
  int _memberCount;
  int _feedbackCount;
  int _bookMark;
  String _description;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.cmb_grey[50],
      appBar: AppBar(
        backgroundColor: AppColors.cmb_grey[50],
        centerTitle: false,
        title: Text(
          '마이페이지',
          style: TextStyle(
              fontSize: _width * 0.0611,
              color: AppColors.cmb_grey[700],
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CoachMypageSetting()));
              })
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(
            radius: _width * 0.1083,
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/test/profile_image_test.png')),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text('Liam'),
                    Icon(Icons.check),
                  ],
                ),
                Text('송파구 서울'),
              ],
            ),
            SizedBox(
              width: _width * 0.2416,
              height: _width * 0.1000,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CoachMypageInfo()));
                },
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(_width * 0.0222),
                    side: BorderSide(color: AppColors.cmb_blue),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(_width * 0.0555)))),
                child: Text(
                  '프로필 편집',
                  style: TextStyle(
                      color: AppColors.cmb_blue,
                      fontWeight: FontWeight.w700,
                      fontSize: _width * 0.0388),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [Text('12'), Text('멤버')],
            ),
            Column(
              children: [Text('420'), Text('피드백')],
            ),
            Column(
              children: [Text('27'), Text('북마크')],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: _width * 0.04444),
          height: 2.0,
          width: 360.0,
          color: AppColors.cmb_grey[100],
        ),
        Text('필라테스 자격증 level1'),
        Container(
          margin: EdgeInsets.symmetric(vertical: _width * 0.04444),
          height: 2.0,
          width: 360.0,
          color: AppColors.cmb_grey[100],
        ),
        Text('공유한 루틴')
      ]),
    );
  }
}
