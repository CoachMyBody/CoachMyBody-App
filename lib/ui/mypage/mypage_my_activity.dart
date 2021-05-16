import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/mypage/mypage_badge.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  '코마바님의 활동',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Level 3',
                      style: TextStyle(
                        color: AppColors.cmb_grey[700],
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      '다음 레벨까지 운동 기록 6회가 남았어요',
                      style: TextStyle(
                          color: AppColors.cmb_grey[300], fontSize: 12.0),
                    ),
                    SizedBox(height: 10.0),
                    StepProgressIndicator(
                      totalSteps: 10,
                      currentStep: 4,
                      size: 13,
                      selectedColor: AppColors.cmb_accent[100],
                      unselectedColor: AppColors.cmb_grey[100],
                      customStep: (index, color, _) => Container(
                        decoration: BoxDecoration(
                          color: color,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 31.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr(WORKOUT_DAYS),
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 11.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '운동 시작일',
                          style: TextStyle(
                            color: AppColors.cmb_grey[300],
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          '2021.04.04',
                          style: TextStyle(
                            color: AppColors.cmb_grey[700],
                            fontSize: 14.0,
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
                            color: AppColors.cmb_grey[300],
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          '27일',
                          style: TextStyle(
                            color: AppColors.cmb_grey[700],
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '획득 뱃지 0',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 14.0),
                      Expanded(
                        child: GridView.builder(
                            itemCount: 12,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisCount: 3,
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
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 104.0,
                                          height: 104.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF6F8F9),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Center(
                                            child: Icon(CupertinoIcons.lock,
                                                color: Color(0xFFBFC6CD),
                                                size: 25.0),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '비공개',
                                        style: TextStyle(
                                            color: AppColors.cmb_grey[200],
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
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
