import 'package:flutter/material.dart';

class HealthListPhotos extends StatefulWidget {
  @override
  _HealthListPhotosViewState createState() => _HealthListPhotosViewState();
}

class _HealthListPhotosViewState extends State<HealthListPhotos> {
  @override
  Widget build(BuildContext context) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 104,
          height: 104,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Image.asset(
            photoTimeLineData[index]['imagePath'],
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 3.0,
        ),




        Container(
          // padding: const EdgeInsets.all(32),
          child:              /*1*/
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  Container(
                    child: Text(
                      '데드리프트',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '15회, 4세트',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '#헬스, #전신',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
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
