import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/record/record_sub_statistics_inbody.dart';
import 'package:coach_my_body/ui/record/record_sub_statistics_photos.dart';
import 'package:easy_localization/easy_localization.dart';
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  tr(RECORD_SUB_STATISTICS_INBODY_TXT),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              InbodyHistoryView(),
              Padding(
                padding: const EdgeInsets.only(top: 17.0, bottom: 12.0),
                child: Text(
                  tr(RECORD_SUB_STATISTICS_PHOTOS_TXT),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              PhotoHistoryView(),
              Padding(
                padding: const EdgeInsets.only(top: 37.0),
                child: Text(
                  tr(RECORD_SUB_STATISTICS_TIMELINE_TXT),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              PhotoTimelineView(),
            ],
          )),
    );
  }
}
