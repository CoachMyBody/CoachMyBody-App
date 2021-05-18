import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileInputForm extends StatelessWidget {
  ProfileInputForm({
    @required this.text,
    @required this.initialText,
    this.focusNode,
  });
  final String text;
  String initialText;
  FocusNode focusNode;

  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.cmb_grey[500],
              fontSize: _width * 0.0333,
            ),
          ),
          SizedBox(height: _width * 0.01),
          Container(
            width: _width * 0.9111,
            height: _width * 0.1111,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_width * 0.01),
                color: AppColors.cmb_grey[50]),
            child: TextFormField(
              focusNode: focusNode,
              initialValue: initialText,
              style: TextStyle(
                  color: AppColors.cmb_grey[700],
                  fontSize: _width * 0.0444,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: _width * 0.025, left: _width * 0.0222),
                  border: InputBorder.none,
                  suffix: TextButton(
                    onPressed: () {},
                    child: Text(
                      COMMON_EDIT_TXT,
                      style: TextStyle(
                          color: AppColors.cmb_blue,
                          fontSize: _width * 0.0333,
                          fontWeight: FontWeight.w400),
                    ).tr(),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
