import 'dart:math';

import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/routes.dart';
import 'package:coach_my_body/ui/record/routine_data.dart';
import 'package:coach_my_body/widgets/day_modal_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

///
/// Daily Routines View
///
class RecordSubDailyRoutines extends StatelessWidget {
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: _width * 0.072,
        ),
        Padding(
          padding: EdgeInsets.only(left: _width * 0.027),
          child: TextButton(
            onPressed: () {
              showModalBottomSheet<int>(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return DayModalBottomSheet();
                },
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '4월 16일',
                  style: TextStyle(
                      fontSize: _width * 0.0667,
                      fontWeight: FontWeight.bold,
                      color: AppColors.cmb_grey[700]),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: AppColors.cmb_blue,
                  size: _width * 0.083,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: _width * 0.0472),
          child: Text(
            '총 3개\n루틴 완료했다.', // TODO: state provider
            style: TextStyle(
                fontSize: _width * 0.0667, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: _width * 0.536,
        ),
        Padding(
          padding: EdgeInsets.only(left: _width * 0.0444),
          child: SizedBox(
            height: _width * 0.35,
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

  Widget _buildEmptyItem(BuildContext context) {
    return Container(
      width: _width * 0.6,
      height: _width * 0.35,
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
              width: _width * 0.331,
              height: _width * 0.116,
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

// ignore: must_be_immutable
class RecordRoutineListItem extends StatelessWidget {
  RecordRoutineListItem({@required this.routine}) {
    assert(null != routine);
    assert(routine.name.isNotEmpty);
    assert(routine.date.isNotEmpty);
  }

  final RoutineData routine;

  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Hero(
      tag: routine.date,
      child: SizedBox(
        width: _width * 0.6,
        height: _width * 0.336,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(4.0))),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                assert(null != routine);
                return RecordDetailScreen(routine: routine);
              }));
            },
            child: _buildItem(),
          ),
        ),
      ),
    );
  }

  Widget _buildItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: _width * 0.011,
          color: AppColors.cmb_grey[600],
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: _width * 0.0222,
                top: _width * 0.0333,
                child: SizedBox(
                  width: _width * 0.555,
                  child: Text(
                    routine.name,
                    style: TextStyle(
                        color: AppColors.cmb_grey[600],
                        fontSize: _width * 0.04,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Positioned(
                left: _width * 0.0222,
                top: _width * 0.177,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.alarm,
                      size: _width * 0.038,
                      color: AppColors.cmb_grey[300],
                    ),
                    Text(
                      routine.convertMinToString(),
                      style: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: _width * 0.0333,
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: _width * 0.0222,
                top: _width * 0.233,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.mode_comment_outlined,
                      size: _width * 0.038,
                      color: AppColors.cmb_grey[300],
                    ),
                    Text(
                      routine.convertIsFeedbackToString(),
                      style: TextStyle(
                          color: AppColors.cmb_grey[300],
                          fontSize: _width * 0.0333,
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

///
/// Record detail view
///
// ignore: must_be_immutable
class RecordDetailScreen extends StatelessWidget {
  RecordDetailScreen({@required this.routine});

  final RoutineData routine;

  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              routine.date,
              style: TextStyle(
                  color: AppColors.cmb_grey[100],
                  fontSize: _width * 0.0333,
                  fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            expandedHeight: _width * 0.705,
            backgroundColor: AppColors.cmb_grey[800],
            flexibleSpace: _buildDetailHeaderSpace(routine),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.close_sharp,
                  color: AppColors.cmb_grey[100],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: _buildDetailBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailHeaderSpace(RoutineData inRoutine) {
    if (null == inRoutine) {
      assert(null != inRoutine);
    }

    return LayoutBuilder(
      builder: (context, c) {
        if (null == context) {
          assert(null != context);
        }

        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        assert(null != settings);

        final deltaExtent = settings.maxExtent - settings.minExtent;
        final t =
            (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
                .clamp(0.0, 1.0) as double;
        final fadeStart = max(0.0, 1.0 - kToolbarHeight * 3 / deltaExtent);
        const fadeEnd = 1.0;

        final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);

        return Hero(
          tag: routine.date,
          child: Opacity(
            opacity: opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: _width * 0.111,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.alarm,
                        color: AppColors.cmb_blue,
                        size: _width * 0.0388 * opacity,
                      ),
                      Text(
                        inRoutine.convertMinToString(),
                        style: TextStyle(
                          color: AppColors.cmb_blue,
                          fontSize: _width * 0.0388 * opacity,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _width * 0.0333,
                ),
                SizedBox(
                  width: _width * 0.622,
                  child: Text(
                    inRoutine.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _width * 0.0722 * opacity,
                    ),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: _width * 0.0555,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailBody() {
    return Container(
      child: Text('test'),
    );
  }
}
