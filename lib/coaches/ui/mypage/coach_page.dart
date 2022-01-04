import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/data/sharedpref/auth_preferences.dart';
import 'package:coach_my_body/routes.dart';
import 'package:coach_my_body/utils/managers/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CoachPageScreen extends StatelessWidget {
  const CoachPageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        child: FutureBuilder(
          future: (AuthMan().checkAuthStatus()),
          builder: (context, snapshot) {
            return FlutterSwitch(
              width: _width * 0.0777,
              height: _width * 0.0444,
              padding: _width * 0.005,
              toggleSize: _width * 0.0333,
              value: (AuthStat.coach != snapshot.hasData),
              onToggle: (value) {
                AuthPreferences().setIsCoachMode(false);

                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.tapPage, (route) => false);
              },
              activeColor: AppColors.cmb_blue,
              inactiveColor: AppColors.cmb_grey[100],
            );
          },
        ),
      ),
    );;
  }
}
