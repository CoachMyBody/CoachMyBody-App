import 'dart:math';

import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/ui/record/routine_data.dart';
import 'package:flutter/material.dart';

///
/// Daily Routines View
///
class RecordSubDailyRoutines extends StatelessWidget {
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text( // TODO: Dropdown button
              '4월 16일',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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

class RecordRoutineListItem extends StatelessWidget {
  RecordRoutineListItem({@required this.routine}) {
    assert(null != routine);
    assert(routine.name.isNotEmpty);
    assert(routine.date.isNotEmpty);
  }

  final RoutineData routine;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: routine.date,
      child: SizedBox(
        width: 216.0,
        height: 121.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: AppColors.cmb_grey[700],
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
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 8.0,
            left: 8.0,
            child: Text(
              routine.name,
              style: TextStyle(color: AppColors.cmb_grey[100], fontSize: 16.0),
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Text(
              routine.convertMinToString(),
              style: TextStyle(color: AppColors.cmb_grey[100], fontSize: 12.0),
            ),
          ),
          Positioned(
            bottom: 8.0,
            right: 4.0,
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: AppColors.cmb_grey[100],
              ),
              child: Text(
                routine.convertIsFeedbackToString(),
                style:
                TextStyle(color: AppColors.cmb_grey[500], fontSize: 10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///
/// Record detail view
///
class RecordDetailScreen extends StatelessWidget {
  RecordDetailScreen({@required this.routine});

  final RoutineData routine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(routine.date),
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            expandedHeight: 3.5 * kToolbarHeight,
            backgroundColor: AppColors.cmb_grey[700],
            flexibleSpace: _buildDetailHeaderSpace(routine),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.close),
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
        final fadeStart = max(0.0, 1.0 - kToolbarHeight / deltaExtent);
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
                  flex: 4,
                  child: SizedBox(
                    height: 10,
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
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        inRoutine.convertMinToString(),
                        style: TextStyle(
                          color: AppColors.cmb_blue,
                          fontSize: 15.0 * opacity,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  inRoutine.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0 * opacity,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 20,
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
