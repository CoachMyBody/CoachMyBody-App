import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class MypageInfo extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 21.0),
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('닉네임'),
                    TextField(
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
                    Text('생년월일'),
                    TextField(
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
                    Text('휴대폰번호'),
                    TextField(
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
                    Text('신체정보'),
                    TextField(
                      decoration: InputDecoration(
                          isDense: true, contentPadding: EdgeInsets.all(5.0)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 150.0),
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
    );
  }
}
