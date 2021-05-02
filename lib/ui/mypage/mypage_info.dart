import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MypageInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 58.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Color(0xFFC4C4C4),
                  ),
                ),
                SizedBox(height: 48.0),
                Text(
                  '코마바님의 정보',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 21.0),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr(NICKNAME),
                        style: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: 12.0,
                        ),
                      ),
                      TextFormField(
                        initialValue: '코마바',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            isDense: true, contentPadding: EdgeInsets.all(5.0)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr(BIRTHDAY),
                        style: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: 12.0,
                        ),
                      ),
                      TextFormField(
                        initialValue: '1999.01.31',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            isDense: true, contentPadding: EdgeInsets.all(5.0)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr(PHONE_NUMBER),
                        style: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: 12.0,
                        ),
                      ),
                      TextFormField(
                        initialValue: '010 3606 05**',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            isDense: true, contentPadding: EdgeInsets.all(5.0)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr(HEIGHT),
                        style: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: 12.0,
                        ),
                      ),
                      TextFormField(
                        initialValue: '160cm',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            isDense: true, contentPadding: EdgeInsets.all(5.0)),
                      )
                    ],
                  ),
                ),
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.4,
                )),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.cmb_grey[800],
                      minimumSize: Size(328.0, 52.0),
                    ),
                    onPressed: () {},
                    child: Text(
                      '정보 변경',
                      style: TextStyle(color: AppColors.cmb_grey[00]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
