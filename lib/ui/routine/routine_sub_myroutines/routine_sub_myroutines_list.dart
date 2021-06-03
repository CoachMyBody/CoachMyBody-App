import 'package:coach_my_body/providers/routine/routine_select_button_model.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/my_routine_tile.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_sub_myroutines_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_routine_data.dart';

class RoutineSubMyroutinesList extends StatelessWidget {
  RoutineSubMyroutinesList();

  @override
  Widget build(BuildContext context) {
    final selectButtonProvider =
        Provider.of<RoutineSelectButtonModel>(context, listen: true);

    return Consumer<MyRoutineData>(builder: (context, myRoutineData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final myRoutine = myRoutineData.myRoutines[index];
          return Stack(children: [
            Opacity(
              opacity: selectButtonProvider.isClicked
                  ? myRoutine.isSelected
                      ? 1
                      : 0.5
                  : 1,
              child: MyRoutineTile(
                img: myRoutine.myRoutineImg,
                title: myRoutine.myRoutineTitle,
                isSelectButtonClicked: selectButtonProvider.isClicked,
                isSelected: myRoutine.isSelected,
                tapCallBack: () {
                  selectButtonProvider.isClicked
                      ? myRoutineData.selectMyRoutine(myRoutine)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RoutineSubMyroutinesDetail()));
                },
              ),
            )
          ]);
        },
        itemCount: myRoutineData.myRoutineCount,
      );
    });
  }
}
