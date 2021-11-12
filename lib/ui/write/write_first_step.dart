import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/record/record_date_model.dart';
import 'package:coach_my_body/providers/write/write_data_provider.dart';
import 'package:coach_my_body/providers/write/write_view_model.dart';
import 'package:coach_my_body/ui/write/write_first_step_routines.dart';
import 'package:coach_my_body/widgets/cmb_widgets/cmb_dropdown_widget.dart';
import 'package:coach_my_body/widgets/cmb_widgets/models/cmb_dropdown_model.dart';
import 'package:coach_my_body/widgets/cmb_widgets/cmb_common_widgets.dart';
import 'package:coach_my_body/widgets/modals/day_modal_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WriteFirstStepScreen extends StatelessWidget {
  WriteFirstStepScreen({Key key}) : super(key: key);

  final _workoutHourCntrl = TextEditingController();
  final _workoutMinCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var writeDataProvider =
        Provider.of<WriteDataProvider>(context, listen: true);

    if (null != writeDataProvider.getHours) {
      _workoutHourCntrl.text = writeDataProvider.getHours.toString();
    }

    if (null != writeDataProvider.getMinutes) {
      _workoutMinCntrl.text = writeDataProvider.getMinutes.toString();
    }

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
                bSelected: writeDataProvider.isRequiredDataFull,
                bShowNext: true,
                callback: () {
                  Provider.of<WriteNaviViewModel>(context, listen: false)
                      .isFirstPage = false;
                },
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
          WorkOutTimeWidget(
            workoutHourCntrl: _workoutHourCntrl,
            workoutMinCntrl: _workoutMinCntrl,
          ),
        ],
      ),
    );
  }

  Widget _buildRoutineSelectWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              WRITE_FIRST_STEP_SELECT_ROUTINE_TXT,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ).tr(),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              WRITE_FIRST_STEP_SELECT_ROUTINE_DESC,
              style: TextStyle(fontSize: 12, color: AppColors.cmb_grey[300]),
            ).tr(),
          ),
          RoutinesListWidget(),
        ],
      ),
    );
  }
}

class WorkOutTimeWidget extends StatelessWidget {
  WorkOutTimeWidget({Key key, this.workoutHourCntrl, this.workoutMinCntrl})
      : super(key: key);

  final TextEditingController workoutHourCntrl;
  final TextEditingController workoutMinCntrl;

  @override
  Widget build(BuildContext context) {
    var writeDataProvider =
        Provider.of<WriteDataProvider>(context, listen: true);

    var viewedDate = writeDataProvider.timeToShow.month.toString() +
        COMMON_MONTH_TXT.tr() +
        COMMON_YEAR_MONTH_DIVIDER_TXT.tr() +
        writeDataProvider.timeToShow.day.toString() +
        COMMON_DAY_TXT.tr();

    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CMBDropDownWithSheetWidget(
            label: viewedDate,
            data: CMBDropDownSheetData(
              whenCompleted: () {
                print('whenCompleted here');

                var selected = Provider.of<SelectedDateViewModel>(context, listen: false);
                selected.setSelected(false);
              },
              sheet: DayModalBottomSheet(),
              // sheet: CMBBottomSheet()
            ),
          ),
          // child: CustomDropDownWidget(
          //   label: viewedDate,
          //   onPressed: () {
          //     showModalBottomSheet(
          //         backgroundColor: Colors.transparent,
          //         isScrollControlled: true,
          //         context: context,
          //         builder: (_) => DayModalBottomSheet()).whenComplete(() {
          //       // do something when closing modal
          //       print('bye');
          //       var selected = Provider.of<SelectedDateViewModel>(context, listen: false);
          //       selected.setSelected(false);
          //     });
          //   },
          // ),
        ),
        OutlinedTextField(
            label: tr(COMMON_HOUR_TXT),
            hint: tr(COMMON_HOUR_HINT),
            controller: workoutHourCntrl,
            onChanged: (text) {
              if (true == text.isEmpty) {
                writeDataProvider.hours = null;
                return;
              }
              writeDataProvider.hours = int.parse(text);
            }),
        SizedBox(
          width: 8.0,
        ),
        OutlinedTextField(
          label: tr(COMMON_MIN_TXT),
          hint: tr(COMMON_MIN_HINT),
          controller: workoutMinCntrl,
          onChanged: (text) {
            if (true == text.isEmpty) {
              writeDataProvider.minutes = null;
              return;
            }
            writeDataProvider.minutes = int.parse(text);
          },
        ),
      ],
    );
  }
}
