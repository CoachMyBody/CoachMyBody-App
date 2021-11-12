import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/cmb_widgets/cmb_bottom_sheet.dart';
import 'package:coach_my_body/widgets/cmb_widgets/models/cmb_dropdown_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PhotoModalBottomSheet extends StatelessWidget {
  void _callBackPhotoModalOKBtn(BuildContext context) {

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return CMBBottomSheet(
      buttonData: CMBBottomSheetButtonData(
        isEnable: false, // TODO: provider
        label: tr(COMMON_OK_TXT), // TODO: constant
        onPressed: () => _callBackPhotoModalOKBtn(context), // TODO: callback function if clicking the button
      ),
      child: Column(
        children: <Widget>[
        ListTile(
                  leading: Text('연도'),
                ),
                ListTile(
                  leading: Text('월'),
                ),
        ],
      ),
    );
  }
}
