import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class PlusDataContainer extends StatelessWidget {
  PlusDataContainer({Key key, this.callback, this.label}) : super(key: key);

  final Function callback;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 104,
        height: 104,
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: AppColors.cmb_grey[50],
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(Assets.addBlueIconPath),
            SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 12.0, color: AppColors.cmb_blue),
            )
          ],
        ),
      ),
    );
  }
}
