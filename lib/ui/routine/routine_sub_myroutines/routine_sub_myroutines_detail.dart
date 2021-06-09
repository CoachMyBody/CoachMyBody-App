import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/routine_sub_myroutines_detail_list.dart';

const IconData bookmark = IconData(0xe5f8, fontFamily: 'MaterialIcons');
const IconData upload = IconData(59100, fontFamily: 'MaterialIcons');
const IconData test = IconData(60165, fontFamily: 'MaterialIcons');
const IconData test2 = IconData(61434, fontFamily: 'MaterialIcons');

class RoutineSubMyroutinesDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // screen 사이즈

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('코마바님의 운동루틴'),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.cmb_grey[700]
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(test2),
            tooltip: 'Next choice',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: ListView(
          //child: Column(
          children: <Widget>[
            RoutineSubMyroutinesDetailList(
              text: tr('0'),
              route: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RoutineSubMyroutinesDetail()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: screenSize.width,
          height: 80,
          padding: EdgeInsets.all(10.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.cmb_accent[100],
              padding: EdgeInsets.all(10.0),
            ),
            onPressed: () {},
            child: Text(
              '운동 추가하기',
              style: TextStyle(color: AppColors.cmb_grey[00]),
            ),
          ),
        ),
      ),
    );
  }
}
