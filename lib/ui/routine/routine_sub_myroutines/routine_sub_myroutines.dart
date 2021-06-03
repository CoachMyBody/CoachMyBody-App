import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/providers/routine/routine_select_button_model.dart';
import 'package:coach_my_body/ui/routine/routine_create_exercise_type.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/my_routine_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_sub_myroutines_list.dart';
import 'package:provider/provider.dart';

//routine_sub_myroutines
class RoutineSubMyroutinesScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final selectButtonProvider =
        Provider.of<RoutineSelectButtonModel>(context, listen: true);
    final myRoutineProvider = Provider.of<MyRoutineData>(context, listen: true);

    return Scaffold(
      body: RoutineSubMyroutinesList(),
      floatingActionButton: Visibility(
        visible: selectButtonProvider.isClicked ? false : true,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RoutineCreateExerciseTypePage()));
          },
          icon: Icon(Icons.add),
          label: Text('새 운동루틴 생성'),
          backgroundColor: AppColors.cmb_accent[100],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: selectButtonProvider.isClicked
            ? Container(
                color: Colors.black,
                height: 50.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextButton(
                          onPressed: () {
                            print('전체 선택 클릭됨');
                          },
                          child: Text('전체 선택'),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextButton(
                          onPressed: () {
                            print('Pressed');
                          },
                          child: Text('삭제'),
                        ),
                      ),
                    ]))
            : Container(
                height: 0,
              ),
      ),
    );
  }
}
