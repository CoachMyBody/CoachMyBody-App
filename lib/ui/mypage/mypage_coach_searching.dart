import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MypageCoachSearching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1.0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                tr(COACH_SEARCHING),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 19.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '내 고유 번호',
                    style: TextStyle(
                      color: AppColors.cmb_grey[300],
                      fontSize: 12.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('9590808'),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(3.0),
                          visualDensity:
                              VisualDensity(horizontal: 0.0, vertical: -2.0),
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          '복사',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '코치 찾기',
                    style: TextStyle(
                      color: AppColors.cmb_grey[300],
                      fontSize: 12.0,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(5.0),
                        hintText: '코치이름을 입력하세요',
                        hintStyle: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: 12.0,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
