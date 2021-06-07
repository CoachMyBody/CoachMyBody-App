import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyBookMarkTile extends StatelessWidget {
  final String img;
  final String title;
  final List<String> tags;
  final bool isSelectButtonClicked;
  final bool isSelected;
  final Function tapCallBack;

  MyBookMarkTile(
      {this.img,
      this.title,
      this.tags,
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
          width: _width * 0.2388,
          height: _width * 0.2388,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: _width * 0.0388,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.spoqaHanSansNeo),
      ),
      subtitle: ListView.builder(
        itemBuilder: (context, index) {
          final tag = tags[index];
          return SingleChildScrollView(
            child: Container(
              margin:
                  EdgeInsets.only(top: _width * 0.0111, right: _width * 0.0111),
              width: _width * 0.0888,
              height: _width * 0.0555,
              decoration: BoxDecoration(color: AppColors.cmb_grey[50]),
              child: Center(
                child: Text(
                  tag,
                  style: TextStyle(
                      fontSize: _width * 0.02778,
                      color: AppColors.cmb_grey[400],
                      fontFamily: FontFamily.spoqaHanSansNeo),
                ),
              ),
            ),
          );
        },
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
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
