import 'package:flutter/material.dart';

class RoutineSubBookmarkList extends StatelessWidget {
  RoutineSubBookmarkList({@required this.text, @required this.route});

  final String text;
  final Function route;

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Container(
      // child : ColorFiltered(
      //   colorFilter: const ColorFilter.mode(Colors.grey,
      //     BlendMode.saturation,), child: myBookmarkList[0].imageUrl,
      //         )
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.saturation,
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
                width: 48,
                height: 48,
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.saturation,
                  ),
                  child: Image.asset(
                    myBookmarkList[int.parse(text)].imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                )

                // child: Image.asset(
                //   myBookmarkList[int.parse(text)].imageUrl,
                //   fit: BoxFit.fitHeight,
                // ),
                ),
          ),
          title: Text(
            myBookmarkList[int.parse(text)].name,
            style: TextStyle(
              fontSize: 16.0,
              // fontWeight: FontWeight.normal,
            ),
          ),
          subtitle: Text(
            myBookmarkList[int.parse(text)].coach,
            style: TextStyle(
              //  fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: route,
        ),
      ),
    );
  }
}

class MyBookmark {
  int index;
  String imageUrl;
  String name;
  String coach;

  MyBookmark({this.index, this.imageUrl, this.name, this.coach});
}

List myBookmarkList = [
  MyBookmark(
      index: 0,
      imageUrl: 'assets/images/routine_testimg_2.png',
      name: '홍길동 코치의 7일만에 어깡 만들기 루틴!',
      coach: '홍길동 코치'),
  MyBookmark(
      index: 1,
      imageUrl: 'assets/images/routine_testimg_2.png',
      name: '홍길동 코치의 7일만에 어깡 만들기 루틴!!',
      coach: '홍길동 코치'),
];
