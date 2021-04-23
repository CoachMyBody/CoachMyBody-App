import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MypageCoachSearching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(tr(COACHING_SEARCH)),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('내 고유 번호'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('코치 찾기'),
                  TextField(
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(5.0),
                        hintText: '코치이름을 입력하세요'),
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
