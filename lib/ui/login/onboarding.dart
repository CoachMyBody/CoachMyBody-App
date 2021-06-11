import 'package:carousel_slider/carousel_slider.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/data/sharedpref/constants/preferences.dart';
import 'package:coach_my_body/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Widget> onBoardingLists = [
    OnBoardingTemplate(
        imagePath: 'assets/images/onboarding/onboarding1.svg',
        title: '강사들의 운동 루틴',
        desc: '전문 강사들의 운동 루틴을 확인하고\n나의 운동 루틴으로 만들 수 있어요.'),
    OnBoardingTemplate(
        imagePath: 'assets/images/onboarding/onboarding2.svg',
        title: '운동 기록을 간단하게',
        desc: '운동 직후 빠르게 또는 상세하게\n나의 스타일대로 기록할 수 있어요.'),
    OnBoardingTemplate(
        imagePath: 'assets/images/onboarding/onboarding3.svg',
        title: '사용 근육을 한 눈에',
        desc: '오늘 사용한 근육을 바로 확인하고\n다음 운동을 준비할 수 있어요.'),
    OnBoardingTemplate(
        imagePath: 'assets/images/onboarding/onboarding4.svg',
        title: '인바디 눈바디 데이터까지',
        desc: '지난 운동 기록으로 인바디, 눈바디\n데이터를 모아볼 수 있어요.'),
    OnBoardingTemplate(
        imagePath: 'assets/images/onboarding/onboarding5.svg',
        title: '원클릭 코치 전환',
        desc: '강사, 회원 원하는 모드로\n빠르게 전환이 가능해요.'),
  ];
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  alignment: Alignment.center,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        aspectRatio: 0.8,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    itemCount: onBoardingLists.length,
                    itemBuilder: (context, index, realIdx) {
                      return onBoardingLists[index];
                    },
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * (28 / 640),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(onBoardingLists, (index, url) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? AppColors.cmb_grey[700]
                            : AppColors.cmb_grey[100],
                      ),
                    );
                  })),
              SizedBox(
                height: screenHeight * (40 / 640),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 16),
                child: TextButton(
                    onPressed: _onSkipButtonClicked,
                    child: Text(
                      '건너뛰기',
                      style: TextStyle(
                          color: AppColors.cmb_grey[700],
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSkipButtonClicked() {
    var preferences = AuthPreferences();

    preferences.setIsFirstClient(false);

    Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
  }
}

class OnBoardingTemplate extends StatelessWidget {
  OnBoardingTemplate({Key key, this.imagePath, this.title, this.desc})
      : super(key: key);

  final String imagePath;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            imagePath,
            height: 372,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Text(
            desc,
            overflow: TextOverflow.visible,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.cmb_grey[400]),
          )
        ],
      ),
    );
  }
}
