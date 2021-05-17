import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: _width * 0.8222,
          height: _width * 1.088,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.xmark_circle_fill,
                  size: _width * 0.0666,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: _width * 0.0333),
              Center(
                child: Container(
                  width: _width * 0.6000,
                  height: _width * 0.6000,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F8F9),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(CupertinoIcons.lock,
                      color: Color(0xFFBFC6CD), size: _width * 0.2666),
                ),
              ),
              SizedBox(height: _width * 0.0444),
              Center(
                  child: Text('비공개',
                      style: TextStyle(
                          color: AppColors.cmb_grey[200],
                          fontSize: _width * 0.0500,
                          fontWeight: FontWeight.w500))),
              SizedBox(height: _width * 0.0222),
              Center(
                child: Text('3일 연속으로 루틴을 기록해보세요!',
                    style: TextStyle(
                        color: AppColors.cmb_grey[500],
                        fontSize: _width * 0.0333,
                        fontWeight: FontWeight.w400)),
              ),
              Center(
                child: Text('새로운 뱃지를 획득할 수 있어요.',
                    style: TextStyle(
                        color: AppColors.cmb_grey[500],
                        fontSize: _width * 0.0333,
                        fontWeight: FontWeight.w400)),
              )
            ],
          ),
        ));
  }
}
