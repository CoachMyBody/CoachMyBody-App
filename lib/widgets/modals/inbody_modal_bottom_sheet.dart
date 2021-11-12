import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/cmb_widgets/cmb_bottom_sheet.dart';
import 'package:coach_my_body/widgets/cmb_widgets/models/cmb_dropdown_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InbodyModalBottomSheet extends StatelessWidget {
  void _callBackInbodyModalOKBtn(BuildContext context) {

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return CMBBottomSheet(
      buttonData: CMBBottomSheetButtonData(
        isEnable: false, // TODO: provider
        label: tr(COMMON_OK_TXT), // TODO: constant
        onPressed: () => _callBackInbodyModalOKBtn(context), // TODO: callback function if clicking the button
      ),
      child: Column(
        children: <Widget>[
          Text(RECORD_SUB_STATISTICS_INBODY_MODAL_TITLE).tr(),
        ],
      ),
    );
  }
}
