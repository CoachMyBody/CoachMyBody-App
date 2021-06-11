import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomDropDownWidget extends StatelessWidget {
  CustomDropDownWidget({@required this.label, this.onPressed, this.width});

  String label;
  final Function onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          backgroundColor: AppColors.cmb_grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60.0)),
          )),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                  fontSize: size.width * 0.038, color: AppColors.cmb_grey[700], fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 4,),
            SvgPicture.asset(Assets.commDropDownIconPath)
          ],
        ),
      ),
    );
  }
}
