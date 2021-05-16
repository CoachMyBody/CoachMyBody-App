import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Setting extends StatelessWidget {
  bool isNotiTurnOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(APP_SETTING).tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '알림설정',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('푸시알림'),
                FlutterSwitch(
                  width: 35.0,
                  height: 20.0,
                  padding: 2.0,
                  toggleSize: 15.0,
                  value: isNotiTurnOn,
                  onToggle: (value) {},
                  activeColor: AppColors.cmb_accent[100],
                  inactiveColor: AppColors.cmb_grey[100],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('알림 지정 요일'),
                TextButton.icon(
                  onPressed: () {},
                  label: Icon(
                    CupertinoIcons.right_chevron,
                    size: 16,
                  ),
                  icon: Text('월요일'),
                  style: TextButton.styleFrom()
                      .copyWith(visualDensity: VisualDensity(horizontal: -2.0)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('알림 지정 시간'),
                TextButton.icon(
                  onPressed: () {},
                  label: Icon(
                    CupertinoIcons.right_chevron,
                    size: 16,
                  ),
                  icon: Text('09:00'),
                  style: TextButton.styleFrom()
                      .copyWith(visualDensity: VisualDensity(horizontal: -2.0)),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {},
                    child: Text(LOGOUT).tr(),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
