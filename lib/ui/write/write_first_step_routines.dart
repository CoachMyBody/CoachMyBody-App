import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/models/routine_info.dart';
import 'package:coach_my_body/providers/write/write_data_provider.dart';
import 'package:coach_my_body/providers/write/write_view_model.dart';
import 'package:coach_my_body/ui/routine/routine_create_exercise_type.dart';
import 'package:coach_my_body/widgets/common_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RoutinesListWidget extends StatelessWidget {
  const RoutinesListWidget({Key key}) : super(key: key);

  static const MAX_NUM_ROUTINE_SIMPLE_VIEW = 7;

  @override
  Widget build(BuildContext context) {
    var myRoutinesProvider =
        Provider.of<MyRoutinesProvider>(context, listen: true);

    var bNeedtoAddRoutine = false;
    var numOfViews = 1;

    if (null == myRoutinesProvider.routines) {
      bNeedtoAddRoutine = true;
    } else {
      var numOfRoutines = myRoutinesProvider.routines.routines.length;
      if (0 == numOfRoutines) {
        bNeedtoAddRoutine = true;
      } else {
        bNeedtoAddRoutine = false;
        numOfViews = (numOfRoutines > MAX_NUM_ROUTINE_SIMPLE_VIEW)
            ? MAX_NUM_ROUTINE_SIMPLE_VIEW
            : numOfRoutines;
      }
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
          height: 108,
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: bNeedtoAddRoutine
                ? Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      PlusDataContainer(
                        callback: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RoutineCreateExerciseTypePage()));
                        },
                        label: tr(WRITE_FIRST_STEP_ADD_ROUTINE_TXT),
                      ),
                    ],
                  )
                : ((numOfViews == index &&
                        numOfViews >= MAX_NUM_ROUTINE_SIMPLE_VIEW)
                    ? PlusDataContainer(
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RoutineItemsGridView(
                                        routines: myRoutinesProvider
                                            .routines.routines,
                                      )));
                        },
                        label: tr(COMMON_VIEW_MORE_TXT),
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

  final List<RoutineSimpleInfo> routines;

  @override
  Widget build(BuildContext context) {
    var writeDataProvider =
        Provider.of<WriteDataProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 42.0,
        leadingWidth: 80.0,
        leading: InkWell(
          onTap: () {
            writeDataProvider.bRoutineSelected = false;
            writeDataProvider.routineId = 0;
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
              onTap: () {
                Navigator.pop(context);
              },
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: null == routines
            ? Text('There is no routine.')
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: routines.length,
                itemBuilder: (_, index) {
                  return RoutineSimpleView(
                    routine: routines[index],
                  );
                },
              ),
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
          } else {
            writeDataProvider.routineId = routine.id;
            writeDataProvider.bRoutineSelected = true;
            myRoutinesProvider
                .fetchDetailRoutine(writeDataProvider.getRoutineId);
          }
          writeDataProvider.checkRequiredData();
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
                  (writeDataProvider.isRoutineSelected &&
                          routine.id == writeDataProvider.getRoutineId)
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
              if (writeDataProvider.isRoutineSelected &&
                  routine.id == writeDataProvider.getRoutineId)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(top: 8, right: 8),
                    child: SvgPicture.asset(Assets.commCheckIconPath),
                  ),
                ),
            ],
          ),
        ));
  }
}

class RoutineSettingsWidget extends StatelessWidget {
  RoutineSettingsWidget({Key key}) : super(key: key);

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
              physics: BouncingScrollPhysics(),
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
                        ).tr(),
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
