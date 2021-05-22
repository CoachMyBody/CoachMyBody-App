import 'package:carousel_slider/carousel_slider.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/data/sharedpref/constants/preferences.dart';
import 'package:coach_my_body/ui/login/login.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Widget> onBoardingLists = [Text('온보딩1', textAlign: TextAlign.center), Text('온보딩2', textAlign: TextAlign.center), Text('온보딩3', textAlign: TextAlign.center)];
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
              SizedBox(height: screenHeight * (300 / 640),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 72),
                child: Container(
                  alignment: Alignment.center,
                  color: AppColors.cmb_grey[100],
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }
                    ),
                    itemCount: onBoardingLists.length,
                    itemBuilder: (context, index, realIdx) {
                      return onBoardingLists[index];
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * (32 / 640),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget> (onBoardingLists, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? AppColors.cmb_grey[700] : AppColors.cmb_grey[100],
                    ),
                  );
                })
              ),
              SizedBox(height: screenHeight * (60 / 640),),
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
                      fontWeight: FontWeight.w400
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSkipButtonClicked() {
    var preferences = Preferences();

    preferences.setIsFirstClient(false);

    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.login,
      (route) => false
    );
  }
}
