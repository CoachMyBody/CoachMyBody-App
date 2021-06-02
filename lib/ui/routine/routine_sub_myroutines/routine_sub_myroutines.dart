import 'package:coach_my_body/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_sub_myroutines_list.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_sub_myroutines_detail.dart';

//routine_sub_myroutines
class RoutineSubMyroutinesScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //child: Column(
        children: <Widget>[
          RoutineSubMyroutinesList(
            text: '0',
            route: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoutineSubMyroutinesDetail()));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text('새 운동루틴 생성'),
        backgroundColor: AppColors.cmb_accent[100],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
      ),
    );
  }
}
