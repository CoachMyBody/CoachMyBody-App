import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/routes.dart';
import 'package:coach_my_body/ui/record/record_sub_routines_daily.dart';
import 'package:coach_my_body/ui/record/routine_data.dart';
import 'package:coach_my_body/widgets/custom_drop_down_widget.dart';
import 'package:coach_my_body/widgets/month_modal_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

///
/// Monthly Routines View
///
// ignore: must_be_immutable
class RecordSubMonthlyRoutines extends StatelessWidget {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: _size.width * 0.072,
        ),
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.027),
          child: CustomDropDownWidget(
            label: '21년 4월',
            onPressed: () {
              showModalBottomSheet<int>(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return MonthModalBottomSheet();
                },
              );
            }),
        ),
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.0555, top: 12),
          child: _buildDailyRoutinesTxt(),
        ),
        SizedBox(
          height: _size.width * 0.536,
        ),
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.0444),
          child: SizedBox(
            height: _size.width * 0.35,
            child: routines.isEmpty
                ? _buildEmptyItem(context)
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: routines.length, // TODO: Server API
                    itemBuilder: (BuildContext context, int index) =>
                        RecordRoutineListItem(routine: routines[index])),
          ),
        ),
      ],
    );
  }

  Widget _buildDailyRoutinesTxt() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            color: AppColors.cmb_grey[700], fontSize: _size.width * 0.0667),
        children: <TextSpan>[
          TextSpan(
              text: '총 3일', // TODO: provider
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: '동안\n운동했어요.'),
        ],
      ),
    );
  }

  Widget _buildEmptyItem(BuildContext context) {
    return Container(
      width: _size.width * 0.6,
      height: _size.width * 0.35,
      decoration: BoxDecoration(
        color: AppColors.cmb_grey[100],
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              RECORD_SUB_ROUTINES_EMPTY_TXT,
              style: TextStyle(fontSize: 16.0),
            ).tr(),
            SizedBox(
              height: 7.0,
            ),
            Container(
              width: _size.width * 0.331,
              height: _size.width * 0.116,
              decoration: BoxDecoration(
                color: AppColors.cmb_grey[200],
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.write);
                },
                child: Text(RECORD_SUB_ROUTINES_WRITE_BTN_TXT,
                        style: TextStyle(
                            fontSize: 14.0, color: AppColors.cmb_grey[0]))
                    .tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
