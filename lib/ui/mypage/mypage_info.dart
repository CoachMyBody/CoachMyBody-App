import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'mypage_profile_input_form.dart';

class MypageInfo extends StatelessWidget {
  double _width;
  String _nickname = '코마바';
  final String _birthday = '1999.01.31';
  final String _phoneNumber = '01012345678';
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        focusNode1.unfocus();
        focusNode2.unfocus();
        focusNode3.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            PROFILE_SETTING,
            style: TextStyle(
              color: AppColors.cmb_grey[700],
              fontSize: _width * 0.0444,
              fontWeight: FontWeight.w500,
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
                ProfileInputForm(
                  text: NICKNAME.tr(),
                  initialText: _nickname,
                  focusNode: focusNode1,
                ),
                ProfileInputForm(
                  text: BIRTHDAY.tr(),
                  initialText: _birthday,
                  focusNode: focusNode2,
                ),
                ProfileInputForm(
                  text: PHONE_NUMBER.tr(),
                  initialText: _phoneNumber,
                  focusNode: focusNode3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
