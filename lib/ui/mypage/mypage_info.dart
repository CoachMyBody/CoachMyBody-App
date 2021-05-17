import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'mypage_profile_input_form.dart';

class MypageInfo extends StatelessWidget {
  double _width;
  final String _nickname = '코마바';
  final String _birthday = '1999.01.31';
  final String _phoneNumber = '01012345678';
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          PROFILE_SETTING,
          style: TextStyle(
            color: AppColors.cmb_grey[700],
            fontSize: _width * 0.0444,
            fontWeight: FontWeight.w700,
          ),
        ).tr(),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: _width * 0.9111,
          height: _width * 0.5666,
          margin: EdgeInsets.symmetric(horizontal: _width * 0.0444),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileInputForm(text: NICKNAME.tr(), initialText: _nickname),
              ProfileInputForm(text: BIRTHDAY.tr(), initialText: _birthday),
              ProfileInputForm(
                  text: PHONE_NUMBER.tr(), initialText: _phoneNumber)
            ],
          ),
        ),
      ),
    );
  }
}
