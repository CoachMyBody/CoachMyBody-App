import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class MypageCard extends StatelessWidget {
  MypageCard({@required this.text, @required this.count});

  final String text;
  final String count;

  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              color: AppColors.cmb_grey[500],
              fontSize: _width * 0.0333,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: _width * 0.01),
        Text(
          count,
          style: TextStyle(
              color: AppColors.cmb_grey[700],
              fontSize: _width * 0.05,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
