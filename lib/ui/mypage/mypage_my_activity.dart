import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/mypage/mypage_badge.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'mypage.dart';

class MyActivity extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(_width * 0.0444),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '코마바님의 활동',
                style: TextStyle(
                    color: AppColors.cmb_grey[800],
                    fontSize: _width * 0.050,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: _width * 0.0888),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Level 3',
                    style: TextStyle(
                      color: AppColors.cmb_grey[700],
                      fontSize: _width * 0.0444,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: _width * 0.01111),
                  Text(
                    '다음 레벨까지 운동 기록 6회가 남았어요',
                    style: TextStyle(
                      color: AppColors.cmb_grey[300],
                      fontSize: _width * 0.0333,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: _width * 0.0388),
                  StepProgressIndicator(
                    totalSteps: 10,
                    currentStep: 4,
                    size: _width * 0.0333,
                    selectedColor: AppColors.cmb_blue,
                    unselectedColor: AppColors.cmb_grey[100],
                    customStep: (index, color, _) => Container(
                      decoration: BoxDecoration(
                        color: color,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: _width * 0.0888),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr(WORKOUT_DAYS),
                    style: TextStyle(
                        fontSize: _width * 0.0444, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: _width * 0.0277),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '운동 시작일',
                        style: TextStyle(
                          color: AppColors.cmb_grey[500],
                          fontSize: _width * 0.0333,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: _width * 0.0222),
                      Text(
                        '2021.04.04',
                        style: TextStyle(
                          color: AppColors.cmb_grey[700],
                          fontSize: _width * 0.0388,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '운동 시작한지',
                        style: TextStyle(
                          color: AppColors.cmb_grey[500],
                          fontSize: _width * 0.0333,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '27일',
                        style: TextStyle(
                          color: AppColors.cmb_grey[700],
                          fontSize: _width * 0.0388,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: _width * 0.0944),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '획득 뱃지 4',
                    style: TextStyle(
                      color: AppColors.cmb_grey[700],
                      fontSize: _width * 0.0444,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: _width * 0.0222),
                  Flexible(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 9,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: _width * 0.0222,
                          crossAxisCount: 3,
                          childAspectRatio: 3.45 / 4,
                        ),
                        itemBuilder: (context, index) {
                          MyBadge myBadge = myBadgeList[index];
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Badge(
                                      myBadge.title,
                                      myBadge.img,
                                      myBadge.description,
                                      myBadge.check),
                                  barrierColor: Color(0xCC000000));
                            },
                            child: GridTile(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: _width * 0.2888,
                                    height: _width * 0.2888,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF6F8F9),
                                      borderRadius: BorderRadius.circular(
                                          _width * 0.0222),
                                    ),
                                    child: Center(
                                      child: myBadge.check == true
                                          ? SvgPicture.asset(
                                              myBadge.img,
                                              width: _width * 0.2222,
                                              height: _width * 0.2222,
                                            )
                                          : Icon(CupertinoIcons.lock,
                                              color: Color(0xFFBFC6CD),
                                              size: _width * 0.0666),
                                    ),
                                  ),
                                  SizedBox(height: _width * 0.0111),
                                  Text(
                                    myBadge.check == true
                                        ? myBadge.title
                                        : '비공개',
                                    style: TextStyle(
                                        color: AppColors.cmb_grey[200],
                                        fontSize: _width * 0.0388,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyBadge {
//   String title;
//   String img;
//   String description;
//   bool check;
//
//   MyBadge({this.title, this.img, this.description, this.check});
// }
//
// List myBadgeList = [
//   MyBadge(
//       title: '꾸준함에 치얼스', img: Assets.badge1Path, description: '', check: true),
//   MyBadge(
//       title: '시작이 반',
//       img: Assets.badge2Path,
//       description: '코치마바디에 오신걸 환영해요!\n꾸준히 운동해서 뱃지를 수집해 보세요',
//       check: true),
//   MyBadge(
//       title: '프로 꾸준러', img: Assets.badge3Path, description: '', check: true),
//   MyBadge(
//       title: '4주만 더하자', img: Assets.badge4Path, description: '', check: true),
//   MyBadge(title: '', img: '', description: '', check: false),
//   MyBadge(title: '', img: '', description: '', check: false),
//   MyBadge(title: '', img: '', description: '', check: false),
//   MyBadge(title: '', img: '', description: '', check: false),
//   MyBadge(title: '', img: '', description: '', check: false),
// ];
