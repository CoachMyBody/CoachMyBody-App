import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MypageList extends StatelessWidget {
  MypageList({@required this.text, @required this.route});

  final String text;
  final Function route;

  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        text,
        style: TextStyle(
          color: AppColors.cmb_grey[700],
          fontSize: _width * 0.0444,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: AppColors.cmb_grey[700],
      ),
      onTap: route,
    );
  }
}
