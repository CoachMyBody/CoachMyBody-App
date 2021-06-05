import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/models/routine_info.dart';
import 'package:coach_my_body/providers/write/write_data_provider.dart';
import 'package:coach_my_body/providers/write/write_view_model.dart';
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

  bool _bSelected = true; // TODO: required 다 채워진거로

  @override
  Widget build(BuildContext context) {
    var writeDataProvider =
        Provider.of<WriteDataProvider>(context, listen: true);

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
              _buildWorkoutTimeWidget(),
              DividerWidget(),
              _buildRoutineSelectWidget(),
              DividerWidget(),
              if (writeDataProvider.isRoutineSelected) RoutineSettingsWidget(),
              FlatNaviButton(
                bSelected: _bSelected,
                bShowNext: true,
                callback: _bSelected
                    ? () {
                        Provider.of<WriteNaviViewModel>(context, listen: false)
                            .isFirstPage = false;
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkoutTimeWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            WRITE_FIRST_STEP_WORKOUT_TIME_TXT,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ).tr(),
          SizedBox(
            height: 8,
          ),
          WorkOutTimeWidget(),
        ],
      ),
    );
  }

  Widget _buildRoutineSelectWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            WRITE_FIRST_STEP_SELECT_ROUTINE_TXT,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ).tr(),
          SizedBox(
            height: 4,
          ),
          Text(
            WRITE_FIRST_STEP_SELECT_ROUTINE_DESC,
            style: TextStyle(fontSize: 12, color: AppColors.cmb_grey[300]),
          ).tr(),
          RoutinesListWidget(),
        ],
      ),
    );
  }
}

class WorkOutTimeWidget extends StatelessWidget {
  WorkOutTimeWidget({Key key}) : super(key: key);

  final workoutHourCntrl = TextEditingController();
  final workoutMinCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var writeDataProvider =
        Provider.of<WriteDataProvider>(context, listen: true);

    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CustomDropDownWidget(
            label: writeDataProvider.getDate,
            onPressed: () {},
          ),
        ),
        _buildCustomTextField(
            label: tr(COMMON_HOUR_TXT),
            hint: tr(COMMON_HOUR_HINT),
            controller: workoutHourCntrl),
        _buildCustomTextField(
            label: tr(COMMON_MIN_TXT),
            hint: tr(COMMON_MIN_HINT),
            controller: workoutMinCntrl),
      ],
    );
  }

  Widget _buildCustomTextField(
      {@required String label,
      @required String hint,
      @required TextEditingController controller}) {
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
              controller: controller,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 16, color: AppColors.cmb_grey[200]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoutinesListWidget extends StatelessWidget {
  const RoutinesListWidget({Key key}) : super(key: key);

  static const MAX_NUM_ROUTINE_SIMPLE_VIEW = 7;

  @override
  Widget build(BuildContext context) {
    var myRoutinesProvider =
        Provider.of<MyRoutinesProvider>(context, listen: true);

    var bNeedtoAddRoutine = false;
    var numOfViews = MAX_NUM_ROUTINE_SIMPLE_VIEW;

    if (null == myRoutinesProvider.routines) {
      bNeedtoAddRoutine = true;
    } else {
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
        itemCount: (numOfViews >= MAX_NUM_ROUTINE_SIMPLE_VIEW)
            ? numOfViews + 1
            : numOfViews,
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
                : ((numOfViews == index &&
                        numOfViews >= MAX_NUM_ROUTINE_SIMPLE_VIEW)
                    ? PlusDataContainer(
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RoutineItemsGridView(
                                        routines: myRoutinesProvider.routines,
                                      )));
                        },
                        label: '더보기',
                      )
                    : RoutineSimpleView(
                        routine: myRoutinesProvider.routines.routines[index],
                      )),
          ),
        ),
      ),
    );
  }
}

class RoutineItemsGridView extends StatelessWidget {
  RoutineItemsGridView({Key key, this.routines}) : super(key: key);

  final RoutineSimpleInfoList routines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 42.0,
        leadingWidth: 80.0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 11.0, horizontal: 16.0),
            child: Text(COMMON_CANCEL_TXT).tr(),
          ),
        ),
        actions: <Widget>[
          Center(
            child: InkWell(
              onTap: () {}, // TODO: update selected routine
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  COMMON_OK_TXT,
                  style: TextStyle(color: AppColors.cmb_blue),
                ).tr(),
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: null == routines
          ? Text('There is no routine.')
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: routines.routines.length,
              itemBuilder: (_, index) {
                return RoutineSimpleView(
                  routine: routines.routines[index],
                );
              },
            ),
    );
  }
}

class RoutineSimpleView extends StatelessWidget {
  RoutineSimpleView({Key key, this.routine}) : super(key: key);

  final RoutineSimpleInfo routine;

  @override
  Widget build(BuildContext context) {
    var myRoutinesProvider =
        Provider.of<MyRoutinesProvider>(context, listen: true);
    var writeDataProvider =
        Provider.of<WriteDataProvider>(context, listen: true);

    return InkWell(
        onTap: () {
          if (routine.id == writeDataProvider.getRoutineId &&
              true == writeDataProvider.isRoutineSelected) {
            writeDataProvider.bRoutineSelected = false;
            print(writeDataProvider.isRoutineSelected);
          } else {
            writeDataProvider.routineId = routine.id;
            writeDataProvider.bRoutineSelected = true;
            myRoutinesProvider
                .fetchDetailRoutine(writeDataProvider.getRoutineId);
            print(writeDataProvider.isRoutineSelected);
          }
        },
        onDoubleTap: () {
          print('show detail view');
        },
        child: Container(
          width: 104,
          height: 104,
          decoration: BoxDecoration(
            color: AppColors.cmb_grey[50],
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
              image: AssetImage('assets/images/test/routine_test_img.png'),
              colorFilter: ColorFilter.mode(
                  writeDataProvider.isRoutineSelected
                      ? AppColors.cmb_blue.withOpacity(0.8)
                      : AppColors.cmb_grey[700].withOpacity(0.6),
                  BlendMode.srcATop),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Text(
                  routine.title,
                  overflow: TextOverflow.visible,
                  style: TextStyle(color: AppColors.cmb_grey[0]),
                ),
              ),
              if (writeDataProvider.isRoutineSelected)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(top: 8, right: 8),
                    child: SvgPicture.asset(Assets.checkIconPath),
                  ),
                ),
            ],
          ),
        ));
  }
}

class RoutineSettingsWidget extends StatelessWidget {
  RoutineSettingsWidget({Key key}) : super(key: key);

  // bool _bOpened = false;

  @override
  Widget build(BuildContext context) {
    var myRoutinesProvider =
        Provider.of<MyRoutinesProvider>(context, listen: true);

    var openedProvider =
        Provider.of<WriteRoutineSettingOpened>(context, listen: true);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              openedProvider.bOpened = !openedProvider.isOpened;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  WRITE_FIRST_STEP_ROUTINE_SETTING_TXT,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ).tr(),
                openedProvider.isOpened
                    ? Icon(Icons.keyboard_arrow_up)
                    : Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
          SizedBox(
            height: 4,
            width: MediaQuery.of(context).size.width,
          ),
          if (openedProvider.isOpened)
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: myRoutinesProvider.selected.exercises.length,
              itemBuilder: (BuildContext context, int index) => Container(
                height: 60,
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(myRoutinesProvider
                              .selected.exercises[index].name),
                          Text(
                            myRoutinesProvider
                                    .selected.exercises[index].exerciseLab
                                    .toString() +
                                tr(WORKOUT_EXERCISE_LAB_TXT) +
                                ' ' +
                                (myRoutinesProvider
                                        .selected.exercises[index].exerciseSet
                                        .toString() +
                                    tr(WORKOUT_EXERCISE_SET_TXT)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          // TODO: edit
                        },
                        child: Text(
                          COMMON_EDIT_TXT,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.cmb_grey[700]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
