import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/ui/record/record_sub_routines_daily.dart';
import 'package:coach_my_body/ui/record/routine_data.dart';
import 'package:coach_my_body/widgets/month_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

///
/// Monthly Routines View
///
class RecordSubMonthlyRoutines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cmb_grey[0],
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet<int>(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return MonthModalBottomSheet();
                },
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '4월 16일',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: AppColors.cmb_blue,
                  size: 30.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '총 3개\n루틴 완료했다.', // TODO: state provider
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250.0,
          ),
          SizedBox(
            height: 121.0,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: routines.length, // TODO: Server API
                itemBuilder: (BuildContext context, int index) =>
                    RecordRoutineListItem(routine: routines[index])),
          ),
          Expanded(
              child: SizedBox(
                height: 50,
              )
          ),
        ],
      ),
    );
  }
}
