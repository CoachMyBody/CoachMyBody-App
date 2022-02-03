import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:coach_my_body/ui/mypage/mypage_profile_input_form.dart';
import 'package:flutter/material.dart';

class CoachMypageInfo extends StatelessWidget {
  double _width;
  String _nickname = 'Liam';
  String _address = '송파구, 서울';
  String _phoneNumber = '01012345678';
  String _description;
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
        backgroundColor: AppColors.cmb_grey[50],
        appBar: AppBar(
          backgroundColor: AppColors.cmb_grey[50],
          centerTitle: true,
          title: Text(
            PROFILE_SETTING,
            style: TextStyle(
              color: AppColors.cmb_grey[700],
              fontSize: _width * 0.0444,
              fontWeight: FontWeight.w500,
            ),
          ).tr(),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  '완료',
                  style: TextStyle(
                      color: AppColors.cmb_blue,
                      fontSize: _width * 0.04444,
                      fontWeight: FontWeight.w400),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(_width * 0.0444),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                        radius: _width * 0.1444,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                            'assets/images/test/profile_image_test.png')),
                    Positioned(
                        right: _width * 0.0166,
                        bottom: _width * 0.0166,
                        child: CircleAvatar(
                            radius: _width * 0.0333,
                            child: Image.asset(
                                'assets/images/test/kakao_icon_test.png')))
                  ],
                ),
                ProfileInputForm(
                  text: '이름',
                  initialText: _nickname,
                  focusNode: focusNode1,
                ),
                ProfileInputForm(
                  text: '사는 곳',
                ),
                ProfileInputForm(
                  text: '연락처',
                  initialText: _phoneNumber,
                  focusNode: focusNode2,
                ),
                ProfileInputForm(
                  text: '소개',
                  initialText: _description,
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
