import 'package:chips_choice/chips_choice.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class PhotoHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 234.0,
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(
                  width: 1,
                  color: AppColors.cmb_grey[100],
                ),
              ),
            ),
            Positioned(
              top: 88.54,
              left: 70.67,
              child: Icon(
                Icons.upload_rounded,
                color: AppColors.cmb_grey[300],
              ),
            ),
            Positioned(
              top: 181,
              child: Container(
                height: 54.0,
                width: 160.0,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(8.0)),
                  border: Border.all(
                    width: 1,
                    color: AppColors.cmb_grey[100],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'before',
                        style: TextStyle(
                            color: AppColors.cmb_grey[300], fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        '21.01.21',
                        style: TextStyle(
                            color: AppColors.cmb_grey[500], fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 8.0,
        ),
        SizedBox(
          width: 160,
          height: 234,
          child: Stack(
            children: <Widget>[
              Container(
                height: 234.0,
                width: 160.0,
                child: Image.asset(
                  'assets/images/test/statistics_test.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 181,
                child: Container(
                  height: 54.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                      color: AppColors.cmb_blue,
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(8.0))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 9.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'after',
                          style: TextStyle(
                              color: AppColors.cmb_grey[100], fontSize: 12.0),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          '21.05.25',
                          style: TextStyle(
                              color: AppColors.cmb_grey[100], fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PhotoTimelineView extends StatefulWidget {
  @override
  _PhotoTimelineViewState createState() => _PhotoTimelineViewState();
}

class _PhotoTimelineViewState extends State<PhotoTimelineView> {
  int _tag = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ChipsChoice<int>.single(
          value: _tag,
          onChanged: (val) {
            setState(() {
              _tag = val;
            });
          },
          choiceItems: C2Choice.listFrom<int, String>(
            source: photoHistoryOptions,
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
          height: 125,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: photoTimeLineData.length,
            itemBuilder: (BuildContext context, int index) => Container(
                width: 104,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: _buildTimelineWidget(index),
                )),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineWidget(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 104,
          height: 104,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          child: Image.asset(
            photoTimeLineData[index]['imagePath'],
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          photoTimeLineData[index]['date'],
          style: TextStyle(color: AppColors.cmb_grey[300], fontSize: 12.0),
        ),
      ],
    );
  }
}

/* Photo Dummy Data */

List<String> photoHistoryOptions = [
  '전체',
  '복근',
  '등',
];

List<Map> photoTimeLineData = [
  {
    'imagePath': 'assets/images/test/statistics_test_timeline_1.png',
    'date': '2021.03.28'
  },
  {
    'imagePath': 'assets/images/test/statistics_test_timeline_2.png',
    'date': '2021.03.31'
  },
  {
    'imagePath': 'assets/images/test/statistics_test_timeline_3.png',
    'date': '2021.04.04'
  },
  {
    'imagePath': 'assets/images/test/statistics_test_timeline_4.png',
    'date': '2021.04.07'
  },
];
