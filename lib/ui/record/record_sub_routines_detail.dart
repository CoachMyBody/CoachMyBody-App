import 'dart:math';

import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/record/routine_data.dart';
import 'package:coach_my_body/widgets/cmb_widgets/cmb_common_widgets.dart';
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
                              TextSpan(
                                  text:
                                      tr(RECORD_SUB_ROUTINES_DETAIL_TOTAL_TXT)),
                              TextSpan(
                                  text: routine.convertMinToString(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: tr(
                                      RECORD_SUB_ROUTINES_DETAIL_WORKOUT_TXT)),
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
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '강사 피드백',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '회원님 꾸준히 운동 중이시군요! 루틴 선택 탁월하시네요 ㅎㅎ 앞으로 두 달동안은 이 루틴 그대로 가시면 될 것 같고, 운동 끝나고 단백질 주스 꼭 마셔주셔야 합니다. 한 시간 이내로요. 그리고 저녁 식단 조심하세요! 그러면 내일도 알찬 하루 보내시고 화이팅입니다!!!',
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.cmb_grey[500]),
              )
            ],
          ),
        ),
        DividerWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '운동 루틴',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    '루마니안 데드리프트',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cmb_grey[500]),
                  ),
                  Text(
                    '110kg·8회·5세트',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cmb_grey[700]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '슈러그',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cmb_grey[500]),
                  ),
                  Text(
                    '85kg·12회·3세트',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cmb_grey[700]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '티바로우',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cmb_grey[500]),
                  ),
                  Text(
                    '55kg·10회·5세트',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cmb_grey[700]),
                  ),
                ],
              )
            ],
          ),
        ),
        DividerWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '셀프 피드백',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '허리 쪽에 힘이 가해졌는지 약간의 통증 유발. 루틴 괜찮은건지 모르겠다.',
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.cmb_grey[500]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
