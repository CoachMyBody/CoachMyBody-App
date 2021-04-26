import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Popover extends StatelessWidget {
  const Popover({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.cmb_grey[0],
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[_buildHandle(context), if (child != null) child],
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: AppColors.cmb_grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}

class OKButtonInBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      width: 328.0,
      height: 52.0,
      decoration: BoxDecoration(
        color: AppColors.cmb_grey[700],
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          COMMON_OK_TXT,
          style: TextStyle(color: AppColors.cmb_grey[0]),
        ).tr(),
      ),
    );
  }
}
