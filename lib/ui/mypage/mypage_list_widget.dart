import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MypageList extends StatelessWidget {
  MypageList({@required this.text, @required this.route});

  final String text;
  final Function route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
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
