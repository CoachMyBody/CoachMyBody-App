import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'mypage_profile_input_form.dart';

class MypageInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('프로필 설정'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileInputForm(text: NICKNAME.tr(), initialText: '코마바'),
          ProfileInputForm(text: BIRTHDAY.tr(), initialText: '1999.01.31'),
          ProfileInputForm(text: PHONE_NUMBER.tr(), initialText: '01012345678')
        ],
      ),
    );
  }
}
