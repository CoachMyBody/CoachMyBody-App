import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/write/write_navi_model.dart';
import 'package:coach_my_body/widgets/common_widgets.dart';
import 'package:coach_my_body/widgets/custom_drop_down_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WriteFirstStepScreen extends StatelessWidget {
  WriteFirstStepScreen({Key key}) : super(key: key);

  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/write/first_step_frame.svg', // TODO
              width: MediaQuery.of(context).size.width,
            ),
            _buildWorkoutTime(),
            DividerWidget(),
            _buildRoutineSelect(),
            DividerWidget(),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 80,
                height: 44,
                margin: EdgeInsets.only(top: 20, right: 16),
                decoration: BoxDecoration(
                  color: _isSelected
                      ? AppColors.cmb_blue
                      : AppColors.cmb_grey[100],
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: TextButton(
                  onPressed: _isSelected
                      ? () {
                          Provider.of<WriteNaviViewModel>(context,
                                  listen: false)
                              .isFirstPage = false;
                        }
                      : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        COMMON_NEXT_TXT,
                        style: TextStyle(
                            color: _isSelected
                                ? AppColors.cmb_grey[0]
                                : AppColors.cmb_grey[200],
                            fontWeight: FontWeight.w400),
                      ).tr(),
                      SizedBox(width: 6),
                      SvgPicture.asset(
                        Assets.commNaviNextIconPath,
                        color: _isSelected
                            ? AppColors.cmb_grey[0]
                            : AppColors.cmb_grey[200],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutTime() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '운동 시간',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomDropDownWidget(
                  label: '5월 04일',
                  onPressed: () {},
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 54,
                  margin: const EdgeInsets.only(right: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: AppColors.cmb_grey[50],
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border:
                          Border.all(width: 1, color: AppColors.cmb_grey[100])),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '시간',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                      TextField(
                        onTap: () {},
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0시간',
                          hintStyle: TextStyle(
                              fontSize: 16, color: AppColors.cmb_grey[200]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 104,
                  height: 54,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: AppColors.cmb_grey[50],
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border:
                          Border.all(width: 1, color: AppColors.cmb_grey[100])),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '분',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                      TextField(
                        onTap: () {},
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '00분',
                          hintStyle: TextStyle(
                              fontSize: 16, color: AppColors.cmb_grey[200]),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRoutineSelect() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '루틴 선택',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '운동이 1개 이상인 루틴만 기록 가능해요.',
            style: TextStyle(
                fontSize: 12,
                color: AppColors.cmb_grey[300]),
          ),
          InkWell(
            onTap: () {
              // TODO
            },
            child: Container(
              margin: EdgeInsets.only(top: 12),
              height: 104,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: 104,
                  height: 108,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      color: AppColors.cmb_grey[200],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
