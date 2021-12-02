import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MypageCoachSearching extends StatelessWidget {
  double _width;
  final String _uniqueNumber = '9580808';
  bool isEnable = false;

  TextEditingController coachSearching = TextEditingController();
  FocusNode coachSearchingFN = FocusNode();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        coachSearchingFN.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(_width * 0.0444),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                COACH_SEARCHING,
                style: TextStyle(
                    color: AppColors.cmb_grey[800],
                    fontSize: _width * 0.0555,
                    fontWeight: FontWeight.w700),
              ).tr(),
              SizedBox(height: _width * 0.0916),
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
                              fontSize: _width * 0.0333,
                              fontWeight: FontWeight.w400),
                        ).tr(),
                        SizedBox(height: _width * 0.0222),
                        Text(
                          _uniqueNumber,
                          style: TextStyle(
                              color: AppColors.cmb_grey[800],
                              fontSize: _width * 0.0444,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: _uniqueNumber));
                      },
                      child: Text(
                        COMMON_COPY_TXT,
                        style: TextStyle(
                            color: AppColors.cmb_grey[700],
                            fontSize: _width * 0.0388,
                            fontWeight: FontWeight.w400),
                      ).tr(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _width * 0.0916),
              MergeSemantics(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      COACH_SEARCHING,
                      style: TextStyle(
                          color: AppColors.cmb_grey[500],
                          fontSize: _width * 0.0333,
                          fontWeight: FontWeight.w400),
                    ).tr(),
                    SizedBox(height: _width * 0.0222),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: _width * 0.0222,
                      ),
                      width: _width * 0.9111,
                      height: _width * 0.0833,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE9EDEF)),
                          borderRadius: BorderRadius.circular(_width * 0.01),
                          color: AppColors.cmb_grey[50]),
                      child: TextFormField(
                          focusNode: coachSearchingFN,
                          controller: coachSearching,
                          style: TextStyle(
                              color: AppColors.cmb_grey[700],
                              fontSize: _width * 0.0388,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: tr(COACH_SEARCHING_HINT_TXT),
                            hintStyle: TextStyle(
                              color: AppColors.cmb_grey[200],
                              fontSize: _width * 0.0388,
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIcon: coachSearchingFN.hasFocus
                                ? IconButton(
                                    icon: Icon(CupertinoIcons.xmark_circle_fill,
                                        size: _width * 0.0388),
                                    onPressed: () {
                                      coachSearching.clear();
                                      searchText = '';
                                    })
                                : SizedBox(
                                    width: 2.0,
                                  ),
                            border: InputBorder.none,
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: isEnable
                            ? AppColors.cmb_blue
                            : AppColors.cmb_grey[100],
                        minimumSize: Size(_width * 0.9555, _width * 0.1444)),
                    onPressed: () {},
                    child: Text(
                      COMMON_SEARCH_TXT,
                      style: TextStyle(
                          color: isEnable
                              ? AppColors.cmb_grey[00]
                              : AppColors.cmb_grey[200],
                          fontSize: _width * 0.0388,
                          fontWeight: FontWeight.w500),
                    ).tr(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
