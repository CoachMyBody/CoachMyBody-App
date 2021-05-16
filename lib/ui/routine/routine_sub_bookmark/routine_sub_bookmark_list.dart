import 'package:flutter/material.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark_detail.dart';

class RoutineSubBookmarkList extends StatefulWidget {
  RoutineSubBookmarkList({@required this.text, @required this.route});

  final String text;
  final Function route;

  @override
  _RoutineSubBookmarkListState createState() => _RoutineSubBookmarkListState();
}

class _RoutineSubBookmarkListState extends State<RoutineSubBookmarkList> {

  //setState를 위한 변수들
  double opacity_value = 0;
  String btn_text = '선택';
  Icon tail_icon = Icon(Icons.keyboard_arrow_right);
  bool bottom_btn_show = false;
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              if (btn_text == '선택') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RoutineSubBookmarkDetail()));
              } else {
                if (opacity_value == 0.5) {
                  setState(() {
                    tail_icon = Icon(Icons.check);
                    opacity_value = 0;
                  });
                } else {
                  setState(() {
                    tail_icon = Icon(Icons.check_box_outline_blank);
                    opacity_value = 0.5;
                  });
                }
              }
            },
            child: Container(
              child: Stack(
                children: [
                  Container(
                    height: 80,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RoutineSubBookmarkDetail()));
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          width: 48,
                          height: 48,
                          padding: EdgeInsets.symmetric(vertical: 1.0),
                          child: Image.asset(
                            myBookmarkList[int.parse('0')].imageUrl,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      title: Text(
                        myBookmarkList[int.parse('0')].name,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      subtitle: Text(
                        myBookmarkList[int.parse('0')].coach,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: tail_icon,
                    ),
                  ),
                  Opacity(
                    opacity: opacity_value,
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          change_select_btn();
        },
        label: Text(btn_text),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: bottom_btn_show
            ? Container(
            color: Colors.black,
            height: 50.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextButton(
                      onPressed: () {
                        print('Pressed');
                      },
                      child: Text('전체 선택'),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,

                    child: TextButton(
                      onPressed: () {
                        print('Pressed');
                      },
                      child: Text('삭제'),
                    ),
                  ),
                ]))
            : Container(
          height: 0,
        ),
      ),
    );
  }


  void change_select_btn() {
    setState(() {
      if (btn_text == '선택') {
        opacity_value = 0.5;
        btn_text = '취소';
        tail_icon = Icon(Icons.check_box_outline_blank);
        bottom_btn_show = true;
      } else {
        opacity_value = 0;
        btn_text = '선택';
        tail_icon = Icon(Icons.keyboard_arrow_right);
        bottom_btn_show = false;
      }
    });
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
      coach: '#헬스'),
  MyBookmark(
      index: 1,
      imageUrl: 'assets/images/routine_testimg_2.png',
      name: '홍길동 코치의 7일만에 어깡 만들기 루틴!!',
      coach: '#헬스'),
];

int check = 0;

bookmarkSelect() {
  // change_select_btn(); 여기 호출이 어려워서 따로 선택 floating btn을 만듬
  if (check == 0) {
    print('test0');
    check = 1;
  } else if (check == 1) {
    print('test1');
    check = 0;
  }
}
