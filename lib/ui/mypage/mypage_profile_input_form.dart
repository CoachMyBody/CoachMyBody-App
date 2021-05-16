import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileInputForm extends StatelessWidget {
  ProfileInputForm({@required this.text, @required this.initialText});
  final String text;
  final String initialText;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.cmb_grey[300],
              fontSize: 12.0,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: AppColors.cmb_grey[50]),
            child: TextFormField(
              initialValue: initialText,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5.0),
                  border: InputBorder.none,
                  suffix: TextButton(
                    onPressed: () {},
                    child: Text(
                      COMMON_EDIT_TXT,
                      style: TextStyle(color: AppColors.cmb_accent[100]),
                    ).tr(),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
