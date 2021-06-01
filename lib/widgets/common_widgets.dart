import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      color: AppColors.cmb_grey[50],
    );
  }
}
