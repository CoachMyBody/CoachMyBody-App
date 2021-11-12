import 'package:chips_choice/chips_choice.dart';
import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/write/write_second_step_photo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PhotoHistoryView extends StatelessWidget {
  const PhotoHistoryView();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            tr(RECORD_SUB_STATISTICS_PHOTO_HISTORY_TXT),
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildPhotoView(size: size, isBefore: true, image: '', date: ''),
            _buildPhotoView(
                size: size,
                isBefore: false,
                image: 'assets/images/test/statistics_test.png',
                date: '21.03.12'),
          ],
        ),
      ],
    );
  }

  Widget _buildPhotoView(
      {Size size, bool isBefore, String image, String date}) {
    assert(false == size.isEmpty);

    return InkWell(
      onTap: () {
        print(isBefore);
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Column(
            children: <Widget>[
              _buildImageContainer(size: size, image: image),
              _buildBottom(size: size, isBefore: isBefore, date: date),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer({Size size, String image}) {
    return Container(
      height: size.width * 0.4,
      width: size.width * 0.43,
      color: AppColors.cmb_grey[50],
      child: image.isEmpty
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(Assets.commAddGreyIconPath),
                SizedBox(
                  height: 4,
                ),
                Text(
                  RECORD_SUB_STATISTICS_ADD_HISTORY_BTN,
                  style: TextStyle(color: AppColors.cmb_grey[200]),
                ).tr()
              ],
            )
          : Image.asset(
              image,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _buildBottom({Size size, bool isBefore, String date}) {
    return Container(
      height: size.width * 0.1444,
      width: size.width * 0.43,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isBefore
              ? Text(
                  RECORD_SUB_STATISTICS_BEFORE_TXT,
                  style: TextStyle(color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.w500),
                ).tr()
              : Text(
                  RECORD_SUB_STATISTICS_AFTER_TXT,
                  style: TextStyle(color: AppColors.cmb_blue, fontSize: 14.0, fontWeight: FontWeight.w500),
                ).tr(),
          date.isEmpty
              ? Text(
                  RECORD_SUB_STATISTICS_EMPTY_PHOTO_TXT,
                  style:
                      TextStyle(color: AppColors.cmb_grey[300], fontSize: 14.0),
                ).tr()
              : Text(
                  date,
                  style:
                      TextStyle(color: AppColors.cmb_grey[300], fontSize: 14.0),
                ),
        ],
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
        Padding(
          padding: const EdgeInsets.only(top: 37.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                tr(RECORD_SUB_STATISTICS_MYPHOTOS_TXT),
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WritePhotoScreen()));
                },
                child: Container(
                  height: 18,
                  margin: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(Assets.commAddBlueIconPath),
                ),
              ),
            ],
          ),
        ),
        ChipsChoice<int>.single(
          padding: EdgeInsets.all(0),
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
          choiceStyle: AppColors.default_chip_style,
          choiceActiveStyle: AppColors.active_chip_style,
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
