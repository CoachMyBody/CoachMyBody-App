import 'package:chips_choice/chips_choice.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class PhotoViewModel extends ChangeNotifier {
  String _imagePath;
  DateTime _dateTime;

  void setImagePath(String imgPath) {
    _imagePath = imgPath;
    notifyListeners();
  }

  String getImagePath() {
    return _imagePath;
  }

  void setDateTime(DateTime time) {
    _dateTime = time;
    notifyListeners();
  }

  DateTime getDateTime() {
    return _dateTime;
  }
}

class PhotoHistoryView extends StatelessWidget {
  const PhotoHistoryView();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildPhotoView(size, true, '', '21.01.13'),
        SizedBox(
          width: 8.0,
        ),
        _buildPhotoView(
            size, false, 'assets/images/test/statistics_test.png', '21.03.12'),
      ],
    );
  }

  Widget _buildPhotoView(Size size, bool isBefore, String image, String date) {
    return InkWell(
      onTap: () {
        print(isBefore);
      },
      child: Container(
        height: size.width * 0.65,
        width: size.width * 0.444,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.width * 0.65,
              width: size.width * 0.44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(
                  width: 1,
                  color: AppColors.cmb_grey[100],
                ),
              ),
              child: image.isEmpty
                  ? Icon(
                      Icons.upload_rounded,
                      color: AppColors.cmb_grey[300],
                    )
                  : Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: _buildBottom(size, isBefore, date),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottom(Size size, bool isBefore, String date) {
    return Container(
      height: size.width * 0.15,
      width: size.width * 0.44,
      decoration: BoxDecoration(
        color: isBefore ? AppColors.cmb_grey[0] : AppColors.cmb_blue,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0)),
        border: Border.all(
          width: 1,
          color: isBefore ? AppColors.cmb_grey[100] : AppColors.cmb_blue,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isBefore
                ? Text(
                    'before',
                    style: TextStyle(
                        color: AppColors.cmb_grey[300], fontSize: 12.0),
                  )
                : Text(
                    'after',
                    style: TextStyle(
                        color: AppColors.cmb_grey[100], fontSize: 12.0),
                  ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              date,
              style: TextStyle(
                  color: isBefore
                      ? AppColors.cmb_grey[500]
                      : AppColors.cmb_grey[100],
                  fontSize: 14.0),
            ),
          ],
        ),
      ),
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
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
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
