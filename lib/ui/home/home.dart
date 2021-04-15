import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/textstyles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/navigation/bottomNavigationBar.dart';
import 'package:coach_my_body/widgets/sampleWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _testAppbar(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            // _testBody()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.carpenter),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _testAppbar() {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Colors.white,
      title: Container(
        margin: EdgeInsets.fromLTRB(16, 3, 0, 3),
        decoration: BoxDecoration(
            color: AppColors.cmb_grey[50],
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: Container(
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10
              ),
              border: InputBorder.none,
              hintText: '검색어를 입력하세요',
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8
                ),
                child: Icon(
                  Icons.search,
                  color: AppColors.cmb_grey[500],
                  size: 24,
                ),
              ),
              hintStyle: TextStyle(fontSize: 20, color: AppColors.cmb_grey[300]),
            ),
            style: TextStyle(fontSize: 20, color: AppColors.cmb_grey[300]),
            keyboardType: TextInputType.text,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.bookmark_border), color: Colors.black, onPressed: () {})
      ],
      elevation: 0,
    );
  }

  /*
  Widget _testBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.cmb_grey[100],
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: Container(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10
              ),
              border: InputBorder.none,
              hintText: '검색어를 입력하세요',
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Icon(
                  Icons.search,
                  color: AppColors.cmb_grey[500],
                  size: 18,
                ),
              ),
              hintStyle: TextStyles.textFieldContent,
            ),
            style: TextStyles.textFieldContent,
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    );
  }
  */
}
