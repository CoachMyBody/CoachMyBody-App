import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDownWidget extends StatelessWidget {
  CustomDropDownWidget({this.onPressed, @required this.label});

  final Function onPressed;
  String label;

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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                fontSize: size.width * 0.038, color: AppColors.cmb_grey[700]),
          ),
          Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppColors.cmb_grey[700],
            size: size.width * 0.063,
          ),
        ],
      ),
    );
  }
}
