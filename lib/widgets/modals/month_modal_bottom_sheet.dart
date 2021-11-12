import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/widgets/cmb_widgets/cmb_bottom_sheet.dart';
import 'package:coach_my_body/widgets/cmb_widgets/models/cmb_dropdown_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonthModalBottomSheet extends StatelessWidget {
  void _callBackMonthModalOKBtn(BuildContext context) {
    // var selected = Provider.of<SelectedDateViewModel>(context, listen: false);
    //
    // selected.setReturnedDate();
    // selected.setSelected(false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return CMBBottomSheet(
      buttonData: CMBBottomSheetButtonData(
        isEnable: true, // TODO: provider
        label: tr(COMMON_OK_TXT), // TODO: constant
        onPressed: () => _callBackMonthModalOKBtn(context), // TODO: callback function if clicking the button
      ),
      child: Column(
        children: <Widget>[
          CupertinoPicker(
            backgroundColor: AppColors.cmb_grey[0],
            itemExtent: 30,
            scrollController: FixedExtentScrollController(initialItem: 2),
            onSelectedItemChanged: (value) {
              // setState(() {
              //   _selectedValue = value;
              // });
            },
            children: [
              Text('0'),
              Text('2'),
              Text('4'),
            ],
          ),
        ],
      ),
    );
  }
}
