import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/routine_testimg_1.png'),
              fit: BoxFit.fill
            )
          ),
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '로그인을 하시면  회원님의 관심사에 맞는 운동 루틴 추천과 운동 기록, 전문 트레이더의 코치를 받을 수 있습니다.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.cmb_grey[0]
                  ),
                ),
                SizedBox(height: 8,),
                ElevatedButton(
                  onPressed: _test,
                  child: Text(
                    '로그인'
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _test() {
    Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.tapPage,
        (route) => false
    );
  }
}
