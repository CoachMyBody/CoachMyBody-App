import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/models/user_info.dart';
import 'package:coach_my_body/repository/auth_repository.dart';
import 'package:coach_my_body/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height,
              child: Image(
                image: AssetImage(Assets.kakaoLoginBgImgPath),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.1111),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '로그인을 하시면  회원님의 관심사에 맞는 운동 루틴 추천과 운동 기록, 전문 트레이더의 코치를 받을 수 있습니다.',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.0333,
                        color: AppColors.cmb_grey[0]),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.width * 0.0222,
                  ),
                  _buildKakaoButton(size),
                  SizedBox(
                    height: size.width * 0.0444,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      await AccessTokenStore.instance.toStore(token);

      await _sendToCMBServer();

      await Navigator.pushNamedAndRemoveUntil(
          context, Routes.tapPage, (route) => false);
    } catch (e) {
      print('error on issuing access token: $e');
    }
  }

  void _loginWithKakao() async {
    try {
      var code = await AuthCodeClient.instance.request();
      _issueAccessToken(code);
    } catch (e) {
      print(e);
    }
  }

  void _loginWithTalk() async {
    try {
      var code = await AuthCodeClient.instance.requestWithTalk();
      _issueAccessToken(code);
    } catch (e) {
      print('카톡 로그인 에러 :  $e');
    }
  }

  Future<int> _sendToCMBServer() async {
    final user = await UserApi.instance.me();

    var authRepository = AuthRepository();

    /// result = 201 -> 회원 가입 성공 / 404 -> 존재하지 않는 회원
    /// 404인 경우 회원가입할건지에 대한 여부 물어야함
    var result = await authRepository.login(user.id.toString());
    print('로그인 결과 : $result');

    // 회원가입 로직
    if (result == 404) {
      /// *************
      /// 회원가입 하시겠습니까?
      /// *************

      UserInfo userInfo = UserInfo(user.kakaoAccount.email, 'KAKAO',
          user.kakaoAccount.profile.nickname, user.id.toString());
      result = await authRepository.register(userInfo);

      print('회원가입 결과 : $result');
      if (result == 201) {
        print('회원 가입 성공');
      } else if (result == 400) {
        print('요청 프로퍼티 오류');
      } else if (result == 409) {
        print('이미 존재하는 회원');
      }
    }

    print(
        "=========================[kakao account]=================================");
    print(user.id);
    print(user.kakaoAccount.toString());
    print(user.kakaoAccount.email);
    print(
        "=========================[kakao account]=================================");

    return 0;
  }

  void _login(bool isKakaoTalkInstalled) {
    // if (true == _isKakaoTalkInstalled) {
    //   _loginWithTalk();
    // } else {
    //   _loginWithKakao();
    // }

    Navigator.pushNamedAndRemoveUntil(
        context, Routes.tapPage, (route) => false);

    return;
  }

  Widget _buildKakaoButton(Size size) {
    return InkWell(
      onTap: () {
        _login(_isKakaoTalkInstalled);
      },
      child: Container(
          height: size.width * 0.13,
          decoration: BoxDecoration(
              color: Color(0xFFFEE500),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  Assets.kakaoIconImgPath,
                  width: 18,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('카카오로 로그인하기'),
              ],
            ),
          )),
    );
  }
}
