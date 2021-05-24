import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/routes.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    _initKakaoTalkInstalled();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

  bool _isKakaoTalkInstalled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/routine_testimg_1.png'),
                  fit: BoxFit.fill)),
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
                      color: AppColors.cmb_grey[0]),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    _login(_isKakaoTalkInstalled);
                  },
                  child: Text('로그인'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      await AccessTokenStore.instance.toStore(token);

      _sendToCMBServer();

      Navigator.pushNamedAndRemoveUntil(
          context, Routes.tapPage, (route) => false);
    } catch (e) {
      print("error on issuing access token: $e");
    }
  }

  void _loginWithKakao() async {
    try {
      var code = await AuthCodeClient.instance.request();
      await _issueAccessToken(code);
    } catch (e) {
      print(e);
    }
  }

  void _loginWithTalk() async {
    try {
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
    } catch (e) {
      print(e);
    }
  }

  Future<int> _sendToCMBServer() async {
    final User user = await UserApi.instance.me();

    print(
        "=========================[kakao account]=================================");
    print(user.kakaoAccount.toString());
    print(user.kakaoAccount.email);
    print(
        "=========================[kakao account]=================================");

    return 0;
  }

  void _login(bool isKakaoTalkInstalled) async {
    if (true == _isKakaoTalkInstalled) {
      _loginWithTalk();
    } else {
      _loginWithKakao();
    }
  }
}
