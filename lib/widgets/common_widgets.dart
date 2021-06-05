import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
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
