import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Setting extends StatelessWidget {
  bool isNotiTurnOn = true;
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            APP_SETTING,
            style: TextStyle(
              color: AppColors.cmb_grey[700],
              fontSize: _width * 0.0444,
              fontWeight: FontWeight.w700,
            ),
          ).tr(),
        ),
        body: Padding(
          padding: EdgeInsets.all(_width * 0.0444),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              NOTIFICATION_SETTING,
              style: TextStyle(
                  color: AppColors.cmb_grey[700],
                  fontSize: _width * 0.0444,
                  fontWeight: FontWeight.w700),
            ).tr(),
            SizedBox(height: _width * 0.075),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  PUSH_ALARM,
                  style: TextStyle(
                      color: AppColors.cmb_grey[700],
                      fontSize: _width * 0.0388,
                      fontWeight: FontWeight.w400),
                ).tr(),
                FlutterSwitch(
                  width: _width * 0.0777,
                  height: _width * 0.0444,
                  padding: _width * 0.005,
                  toggleSize: _width * 0.0333,
                  value: isNotiTurnOn,
                  onToggle: (value) {},
                  activeColor: AppColors.cmb_blue,
                  inactiveColor: AppColors.cmb_grey[100],
                ),
              ],
            ),
            SizedBox(height: _width * 0.075),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '알림 지정 요일',
                  style: TextStyle(
                      color: AppColors.cmb_grey[700],
                      fontSize: _width * 0.0388,
                      fontWeight: FontWeight.w400),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Icon(
                    CupertinoIcons.right_chevron,
                    size: _width * 0.036,
                    color: AppColors.cmb_grey[700],
                  ),
                  icon: Text(
                    '월요일',
                    style: TextStyle(
                        color: AppColors.cmb_grey[700],
                        fontSize: _width * 0.0388,
                        fontWeight: FontWeight.w400),
                  ),
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity(horizontal: _width * -0.005),
                  ),
                )
              ],
            ),
            SizedBox(height: _width * 0.075),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '알림 지정 시간',
                  style: TextStyle(
                      color: AppColors.cmb_grey[700],
                      fontSize: _width * 0.0388,
                      fontWeight: FontWeight.w400),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Icon(
                    CupertinoIcons.right_chevron,
                    size: _width * 0.036,
                    color: AppColors.cmb_grey[700],
                  ),
                  icon: Text(
                    '09:00',
                    style: TextStyle(
                        color: AppColors.cmb_grey[700],
                        fontSize: _width * 0.0388,
                        fontWeight: FontWeight.w400),
                  ),
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity(horizontal: _width * -0.005),
                  ),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text(
                    LOGOUT,
                    style: TextStyle(
                        color: AppColors.cmb_grey[700],
                        fontSize: _width * 0.0388,
                        fontWeight: FontWeight.w400),
                  ).tr(),
                ),
              ),
            )
          ]),
        ));
  }
}
