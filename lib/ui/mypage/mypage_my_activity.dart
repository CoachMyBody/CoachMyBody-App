import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyActicity extends StatelessWidget {
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
                    '내 레벨',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    '레벨 4까지 운동 기록 4회가 남았어요',
                    style: TextStyle(
                        color: AppColors.cmb_grey[300], fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  StepProgressIndicator(
                    totalSteps: 8,
                    currentStep: 4,
                    size: 25,
                    selectedColor: AppColors.cmb_grey[600],
                    unselectedColor: Color(0xFFC4C4C4),
                    customStep: (index, color, _) => Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(5.0),
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
                    '운동 일수',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 11.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '시작 기준일',
                        style: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '2021.04.04',
                        style: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 11.0),
                        color: Color(0xFF9AA5AF),
                        height: 0.25,
                      ),
                    ),
                  ]),
                  SizedBox(height: 13.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '코마바와 운동 시작한지',
                        style: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '27일',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35.0),
              child: Column(
                children: [
                  Text(
                    '획득한 뱃지 0',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
