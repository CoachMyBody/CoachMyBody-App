import 'package:coach_my_body/data/sharedpref/constants/preferences.dart';
import 'package:coach_my_body/ui/login/login.dart';
import 'package:coach_my_body/ui/login/onboarding.dart';
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
    _checkIsFirstClient = checkIsFirstClient();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkIsFirstClient,
      builder: (context, snapshot) {
        print('Debug FutureBuilder');
        if (snapshot.hasData) {
          var result = snapshot.data;

          // 처음으로 앱 실행
          if (result) {
            return OnBoardingScreen();
          } else {
            return LoginScreen();
          }
        } else {
          return LoginScreen();
        }
      }
    );
  }

  Future<bool> checkIsFirstClient() async {
    print('Debug1');

    var preferences = AuthPreferences();

    var result = await preferences.getIsFirstClient();

    return result;
  }
}

