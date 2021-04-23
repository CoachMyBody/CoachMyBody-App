import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class MypageCard extends StatelessWidget {
  MypageCard({@required this.text, @required this.count});

  final String text;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 12.0,
            color: AppColors.cmb_grey[400],
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          count,
          style: TextStyle(fontSize: 18.0, color: AppColors.cmb_grey[800]),
        )
      ],
    );
  }
}
