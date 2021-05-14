import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/ui/record/record_sub_statistics_inbody.dart';
import 'package:coach_my_body/ui/record/record_sub_statistics_photos.dart';
import 'package:flutter/material.dart';

class RecordSubStatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: AppColors.cmb_grey[0],
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              PhotoHistoryView(),
              PhotoTimelineView(),
              InbodyHistoryView(),
            ],
          )),
    );
  }
}
