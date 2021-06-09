import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class HealthListPhotos extends StatefulWidget {
  @override
  _HealthListPhotosViewState createState() => _HealthListPhotosViewState();
}

class _HealthListPhotosViewState extends State<HealthListPhotos> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 170,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: photoTimeLineData.length,
            itemBuilder: (BuildContext context, int index) => Container(
                width: 104,
                height: 104,
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
    var _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(_width * 0.0222)),
          child: Image.asset(
            photoTimeLineData[index]['imagePath'],
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: _width * 0.0222,
        ),
        Container(
          child: /*1*/
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Column(
                children: [
                  Container(
                    child: Text(
                      '데드리프트',
                      style: TextStyle(
                          fontSize: _width * 0.0388,
                          fontWeight: FontWeight.w400,
                          color: AppColors.cmb_grey[700]),
                    ),
                  ),
                ],
              ),
              Text(
                '15회, 4세트',
                style: TextStyle(
                  fontSize: _width * 0.0333,
                  fontWeight: FontWeight.w400,
                  color: AppColors.cmb_grey[700],
                ),
              ),
              Text(
                '#헬스, #허벅지',
                style: TextStyle(
                  fontSize: _width * 0.0277,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<Map> photoTimeLineData = [
  {'imagePath': 'assets/images/routine_testimg_2.png', 'date': '2021.03.28'},
  {'imagePath': 'assets/images/routine_testimg_2.png', 'date': '2021.03.31'},
  {'imagePath': 'assets/images/routine_testimg_2.png', 'date': '2021.04.04'},
  {'imagePath': 'assets/images/routine_testimg_2.png', 'date': '2021.04.07'},
];
