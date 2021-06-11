import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/mypage/mypage_badge.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
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
                    '획득 뱃지 0',
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
                        itemCount: 12,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: _width * 0.0222,
                          crossAxisCount: 3,
                          childAspectRatio: 3.45 / 4,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Badge(),
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
                                      child: Icon(CupertinoIcons.lock,
                                          color: Color(0xFFBFC6CD),
                                          size: _width * 0.0666),
                                    ),
                                  ),
                                  SizedBox(height: _width * 0.0111),
                                  Text(
                                    '비공개',
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
