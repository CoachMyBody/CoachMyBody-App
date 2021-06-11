import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Badge extends StatelessWidget {
  final String title;
  final String img;
  final String description;
  final bool check;

  Badge(this.title, this.img, this.description, this.check);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

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
                  child: check == true
                      ? SvgPicture.asset(
                          img,
                        )
                      : Icon(CupertinoIcons.lock,
                          color: Color(0xFFBFC6CD), size: _width * 0.2666),
                ),
              ),
              SizedBox(height: _width * 0.0444),
              Center(
                  child: Text(check == true ? title : '비공개',
                      style: TextStyle(
                          color: AppColors.cmb_grey[200],
                          fontSize: _width * 0.0500,
                          fontWeight: FontWeight.w500))),
              SizedBox(height: _width * 0.0222),
              Center(
                child: Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.cmb_grey[500],
                        fontSize: _width * 0.0333,
                        fontWeight: FontWeight.w400)),
              ),
              // Center(
              //   child: Text('새로운 뱃지를 획득할 수 있어요.',
              //       style: TextStyle(
              //           color: AppColors.cmb_grey[500],
              //           fontSize: _width * 0.0333,
              //           fontWeight: FontWeight.w400)),
              // )
            ],
          ),
        ));
  }
}
