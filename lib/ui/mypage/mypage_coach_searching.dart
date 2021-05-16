import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MypageCoachSearching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr(COACH_SEARCHING),
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          MergeSemantics(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      UNIQUE_NUMBER,
                      style: TextStyle(
                        color: AppColors.cmb_grey[500],
                      ),
                    ).tr(),
                    Text('9590808')
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('복사'),
                )
              ],
            ),
          ),
          MergeSemantics(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  COACH_SEARCHING,
                  style: TextStyle(
                    color: AppColors.cmb_grey[300],
                    fontSize: 12.0,
                  ),
                ).tr(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: AppColors.cmb_grey[50]),
                  child: TextFormField(
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        hintText: '코치 이름을 입력하세요',
                        hintStyle: TextStyle(color: AppColors.cmb_grey[200]),
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        suffix: TextButton(
                          onPressed: () {},
                          child: Text(
                            COMMON_EDIT_TXT,
                            style: TextStyle(color: AppColors.cmb_accent[100]),
                          ).tr(),
                        )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.cmb_accent[100],
                      minimumSize: Size(double.infinity, 60.0)),
                  onPressed: () {},
                  child: Text(
                    '검색',
                    style: TextStyle(color: AppColors.cmb_grey[00]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
