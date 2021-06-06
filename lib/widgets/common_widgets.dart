import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class OutlinedTextField extends StatelessWidget {
  const OutlinedTextField({Key key, @required this.label,
  @required this.hint,
  @required this.controller, @required this.onChanged}) : super(key: key);

  final String label;
  final String hint;
  final TextEditingController controller;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 54,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: AppColors.cmb_grey[50],
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(width: 1, color: AppColors.cmb_grey[100])),
        child: Stack(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.start,
            ),
            TextField(
              controller: controller,
              textAlign: TextAlign.right,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle:
                TextStyle(fontSize: 16, color: AppColors.cmb_grey[200]),
              ),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}


class FlatNaviButton extends StatelessWidget {
  FlatNaviButton({Key key, this.bSelected, this.bShowNext, this.callback})
      : super(key: key);

  final bool bSelected;
  final bool bShowNext;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: bShowNext? Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        width: 80,
        height: 44,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: bSelected ? AppColors.cmb_blue : AppColors.cmb_grey[100],
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: TextButton(
          onPressed: bSelected ? callback : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              bShowNext
                  ? Text(
                      COMMON_NEXT_TXT,
                      style: TextStyle(
                          color: bSelected
                              ? AppColors.cmb_grey[0]
                              : AppColors.cmb_grey[200],
                          fontWeight: FontWeight.w400),
                    ).tr()
                  : SvgPicture.asset(
                      Assets.commNaviPrevIconPath,
                      color: bSelected
                          ? AppColors.cmb_grey[0]
                          : AppColors.cmb_grey[200],
                    ),
              SizedBox(width: 6),
              bShowNext
                  ? SvgPicture.asset(
                      Assets.commNaviNextIconPath,
                      color: bSelected
                          ? AppColors.cmb_grey[0]
                          : AppColors.cmb_grey[200],
                    )
                  : Text(
                      COMMON_PREV_TXT,
                      style: TextStyle(
                          color: bSelected
                              ? AppColors.cmb_grey[0]
                              : AppColors.cmb_grey[200],
                          fontWeight: FontWeight.w400),
                    ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
