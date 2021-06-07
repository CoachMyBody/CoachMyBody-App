import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRoutineTile extends StatelessWidget {
  final String img;
  final String title;
  final bool isSelectButtonClicked;
  final bool isSelected;
  final Function tapCallBack;

  MyRoutineTile(
      {this.img,
      this.title,
      this.isSelectButtonClicked,
      this.isSelected,
      this.tapCallBack});

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(_width * 0.0222),
        child: Image.asset(
          img,
          width: _width * 0.1666,
          height: _width * 0.1666,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: _width * 0.0388,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.spoqaHanSansNeo),
      ),
      trailing: isSelectButtonClicked
          ? isSelected
              ? Icon(
                  CupertinoIcons.check_mark,
                  color: AppColors.cmb_blue,
                  size: _width * 0.0388,
                )
              : SizedBox(
                  width: _width * 0.0388,
                  height: _width * 0.0388,
                )
          : Icon(
              CupertinoIcons.right_chevron,
              color: AppColors.cmb_grey[700],
              size: _width * 0.0388,
            ),
      onTap: tapCallBack,
    );
  }
}
