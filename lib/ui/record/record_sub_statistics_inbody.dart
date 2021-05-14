import 'package:chips_choice/chips_choice.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InbodyHistoryView extends StatefulWidget {
  @override
  _InbodyHistoryViewState createState() => _InbodyHistoryViewState();
}

class _InbodyHistoryViewState extends State<InbodyHistoryView> {
  int _tag = 0;
  InbodyOptions _opts = InbodyOptions.weight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 37.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              tr(RECORD_SUB_STATISTICS_INBODY_TXT),
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          ChipsChoice<int>.single(
            value: _tag,
            onChanged: (val) {
              setState(() {
                _tag = val;
                switch (_tag) {
                  case 0:
                    _opts = InbodyOptions.weight;
                    break;
                  case 1:
                    _opts = InbodyOptions.smm;
                    break;
                  case 2:
                    _opts = InbodyOptions.pbf;
                    break;
                  default:
                    print('Invalid param');
                }
              });
            },
            choiceItems: C2Choice.listFrom<int, String>(
              source: inbodyOptions,
              value: (i, v) => i,
              label: (i, v) => v,
            ),
            choiceStyle: C2ChoiceStyle(
              showCheckmark: false,
              color: AppColors.cmb_grey[700],
              borderColor: AppColors.cmb_grey[700],
            ),
            choiceActiveStyle: C2ChoiceStyle(
              brightness: Brightness.dark,
              color: AppColors.cmb_grey[700],
            ),
          ),
          SizedBox(
            height: 230,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: LineChart(_buildWeightChartData(_opts)),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: Refactoring with common data..
  LineChartData _buildWeightChartData(InbodyOptions opts) {
    int _index = 0;

    return LineChartData(
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTitles: (value) {
            if (0 == _index % 7) {
              _index = 0;
            }
            // TODO: 날짜...
            return (6 - _index++).toString();
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      // Outline Border
      gridData: FlGridData(
        show: false,
      ),
      lineTouchData: LineTouchData(),
      // Preparing Data
      lineBarsData: <LineChartBarData>[
        // Drawing Lines
        LineChartBarData(
          spots: tmpInbodyData[opts],
          isCurved: false,
          colors: <Color>[
            AppColors.cmb_grey[100],
            AppColors.cmb_blue,
          ],
          dotData: FlDotData(
            show: true,
          ),
        ),
      ],
    );
  }
}

///
/// Dummy Data !!!!
///

/* Inbody Dummy Data */

List<String> inbodyOptions = [
  tr(RECORD_SUB_STATISTICS_WEIGHT),
  tr(RECORD_SUB_STATISTICS_SMM),
  tr(RECORD_SUB_STATISTICS_PBF),
];

enum InbodyOptions {
  weight,
  smm, // skeletal muscle mass
  pbf, // percent body fat
}

Map<InbodyOptions, List> tmpInbodyData = {
  InbodyOptions.weight: weightData,
  InbodyOptions.smm: smmData,
  InbodyOptions.pbf: pbfData,
};

List<FlSpot> weightData = <FlSpot>[
  FlSpot(0, 63),
  FlSpot(1, 62),
  FlSpot(2, 61),
  FlSpot(3, 67),
  FlSpot(4, 66),
  FlSpot(5, 65.5),
  FlSpot(6, 66.7),
];

List<FlSpot> smmData = <FlSpot>[
  FlSpot(0, 23.3),
  FlSpot(1, 23.8),
  FlSpot(2, 23.5),
  FlSpot(3, 22.9),
  FlSpot(4, 23.6),
  FlSpot(5, 23.7),
  FlSpot(6, 24.0),
];

List<FlSpot> pbfData = <FlSpot>[
  FlSpot(0, 16.4),
  FlSpot(1, 15.9),
  FlSpot(2, 16.3),
  FlSpot(3, 15.8),
  FlSpot(4, 15.4),
  FlSpot(5, 16.1),
  FlSpot(6, 16.5),
];
