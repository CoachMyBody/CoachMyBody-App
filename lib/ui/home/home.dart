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
      body: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _testBody(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.carpenter),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _testBody() {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 3
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.cmb_grey[100],
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
