import 'package:coach_my_body/coaches/ui/navigation/coach_bottom_navigation_bar.dart';
import 'package:coach_my_body/ui/login/login.dart';
import 'package:coach_my_body/ui/login/onboarding.dart';
import 'package:coach_my_body/ui/navigation/bottom_navigation_bar.dart';
import 'package:coach_my_body/utils/managers//auth_manager.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var _checkIsFirstClient;

  @override
  void initState() {
    super.initState();

    print('Debug RootPage initState');
    _checkIsFirstClient = AuthMan().checkAuthStatus();
    print('_checkIsFirstClient: $_checkIsFirstClient');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkIsFirstClient,
      builder: (context, snapshot) {
        print('Debug FutureBuilder');
        if (snapshot.hasData) {
          var result = snapshot.data;

          switch (result)
          {
            case AuthStat.initialed:
              return OnBoardingScreen();
            case AuthStat.member:
              return MemberBottomTabScreen();
            case AuthStat.coach:
              return CoachBottomNaviBar();
            default:
              return LoginScreen();
          }
        } else {
          // 아직 로딩중...
          return LoginScreen();
        }
      }
    );
  }
}

