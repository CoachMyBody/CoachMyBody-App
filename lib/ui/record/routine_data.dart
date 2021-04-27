import 'package:flutter/material.dart';

class RoutineData {
  const RoutineData(
      {@required this.name,
        @required this.mins,
        @required this.isFeedback,
        @required this.date});

  final String name;
  final int mins;
  final bool isFeedback;
  final String date;

  String convertMinToString() {
    assert(0 != mins);

    int hour = (mins / 60).floor();
    int min = mins % 60;

    return ' $hour시간 $min분';
  }

  String convertIsFeedbackToString() {
    if (false == isFeedback) {
      return ' 강사 피드백 대기 중';
    } else {
      return ' 피드백이 도착!';
    }
  }
}

/* Dummy Data */
const routines = [
  RoutineData(
      name: '안녕하세요! \n코마바입니다. 이게 텍스트가 잘리나요?',
      mins: 100,
      isFeedback: true,
      date: '2021년 3월 16일'),
  RoutineData(
      name: '지방을 불태워🔥\n10분만 달려요',
      mins: 10,
      isFeedback: false,
      date: '2021년 3월 19일'),
  RoutineData(
      name: '어이 거기 거북이\n목 한 번 집어넣고 갈까요?',
      mins: 20,
      isFeedback: false,
      date: '2021년 4월 1일'),
  RoutineData(
      name: '안녕하세요! \n코마바일까요.',
      mins: 100,
      isFeedback: false,
      date: '2021년 4월 5일'),
  RoutineData(
      name: '안녕하세요! \n테스트입니다.',
      mins: 100,
      isFeedback: false,
      date: '2021년 4월 6일'),
];
