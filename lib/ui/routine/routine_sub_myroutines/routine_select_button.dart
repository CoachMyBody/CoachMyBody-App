import 'package:coach_my_body/providers/routine/bookmark_selcect_button_model.dart';
import 'package:coach_my_body/providers/routine/routine_select_button_model.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/my_routine_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutineSelectButton extends StatelessWidget {
  RoutineSelectButton();

  @override
  Widget build(BuildContext context) {
    final buttonProvider =
        Provider.of<RoutineSelectButtonModel>(context, listen: true);
    final myRoutineProvider = Provider.of<MyRoutineData>(context, listen: true);

    return TextButton(
        onPressed: () {
          buttonProvider.clickButton();
          if (!buttonProvider.isClicked) {
            myRoutineProvider.unSelectAllMyRoutine();
          }
        },
        child: buttonProvider.isClicked ? Text('취소') : Text('선택'));
  }
}
