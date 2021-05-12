import 'dart:math';

import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/record/routine_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
            centerTitle: true,
            automaticallyImplyLeading: false,
            // pinned: true,
            floating: true,
            expandedHeight: _width * 0.6388,
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
        Size size = MediaQuery.of(context).size;

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
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  routine.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: AppColors.cmb_grey[700].withOpacity(0.6),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Opacity(
                    opacity: opacity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          routine.date,
                          style: TextStyle(
                              color: AppColors.cmb_grey[300],
                              fontSize: size.width * 0.0388 * opacity),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: size.width * 0.1666 * opacity,
                          width: size.width * 0.9111,
                          child: Text(
                            routine.name,
                            style: TextStyle(
                                color: AppColors.cmb_grey[0],
                                fontSize: size.width * 0.0666 * opacity,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: AppColors.cmb_grey[0],
                                fontSize: size.width * 0.0388 * opacity),
                            children: <TextSpan>[
                              TextSpan(text: tr(RECORD_SUB_ROUTINES_DETAIL_TOTAL_TXT)),
                              TextSpan(
                                  text: routine.convertMinToString(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: tr(RECORD_SUB_ROUTINES_DETAIL_WORKOUT_TXT)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
