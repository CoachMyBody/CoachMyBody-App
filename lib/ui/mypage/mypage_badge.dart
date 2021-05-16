import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.all(5.0),
        content: Container(
          width: 296.0,
          height: 392.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.xmark_circle_fill,
                  size: 25.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 216.0,
                  height: 216.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F8F9),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(CupertinoIcons.lock,
                      color: Color(0xFFBFC6CD), size: 95.0),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                  child: Text('비공개',
                      style: TextStyle(
                          color: AppColors.cmb_grey[200],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500))),
              SizedBox(height: 12.0),
              Center(
                child: Text('3일 연속으로 루틴을 기록해보세요!',
                    style: TextStyle(
                        color: AppColors.cmb_grey[500],
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400)),
              ),
              Center(
                child: Text('새로운 뱃지를 획득할 수 있어요.',
                    style: TextStyle(
                        color: AppColors.cmb_grey[500],
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400)),
              )
            ],
          ),
        ));
  }
}
