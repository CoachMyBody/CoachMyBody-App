import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/models/routine_info.dart';
import 'package:coach_my_body/providers/write/write_data_provider.dart';
import 'package:coach_my_body/providers/write/write_navi_model.dart';
import 'package:coach_my_body/ui/routine/routine_create_exercise_type.dart';
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

  final workoutHourCntrl = TextEditingController();
  final workoutMinCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var myRoutineProvider =
        Provider.of<MyRoutinesProvider>(context, listen: true);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
              _buildCustomTextField(label: '시간', hint: '0시간', function: null),
              _buildCustomTextField(label: '분', hint: '00분', function: null),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCustomTextField(
      {@required String label,
      @required String hint,
      @required Function function}) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 54,
        margin: const EdgeInsets.only(right: 8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: AppColors.cmb_grey[50],
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(width: 1, color: AppColors.cmb_grey[100])),
        child: Stack(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.start,
            ),
            TextField(
              controller: workoutHourCntrl,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 16, color: AppColors.cmb_grey[200]),
              ),
              onTap: function ?? () {},
            ),
          ],
        ),
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
            style: TextStyle(fontSize: 12, color: AppColors.cmb_grey[300]),
          ),
          RoutinesListView(),
        ],
      ),
    );
  }
}

class RoutinesListView extends StatelessWidget {
  const RoutinesListView({Key key}) : super(key: key);

  static const MAX_NUM_ROUTINE_SIMPLE_VIEW = 7;

  @override
  Widget build(BuildContext context) {
    var myRoutinesProvider = Provider.of<MyRoutinesProvider>(context, listen: true);

    var bNeedtoAddRoutine = false;
    var numOfViews = MAX_NUM_ROUTINE_SIMPLE_VIEW;

    if (null == myRoutinesProvider.routines)
      bNeedtoAddRoutine = true;
    else {
      var numOfRoutines = myRoutinesProvider.routines.routines.length;
      numOfViews = (numOfRoutines > MAX_NUM_ROUTINE_SIMPLE_VIEW)
          ? MAX_NUM_ROUTINE_SIMPLE_VIEW
          : numOfRoutines;
    }

    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 12),
      height: 104,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: numOfViews + 1,
        itemBuilder: (BuildContext context, int index) => Container(
          width: 104,
          height: 108,
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: bNeedtoAddRoutine
                ? PlusDataContainer(
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RoutineCreateExerciseTypePage()));
                    },
                    label: '루틴 추가',
                  )
                : ((numOfViews == index)
                    ? PlusDataContainer(
                        callback: () {
                          // TODO: 더보기 뷰
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RoutineCreateExerciseTypePage()));
                        },
                        label: '더보기',
                      )
                    : RoutineSimpleView()),
          ),
        ),
      ),
    );
  }
}

class RoutineSimpleView extends StatelessWidget {
  const RoutineSimpleView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('selected');
      },
      onDoubleTap: () {
        print('show detail view');
      },
      child: Container(
        color: AppColors.cmb_grey[200],
      ),
    );
  }
}
