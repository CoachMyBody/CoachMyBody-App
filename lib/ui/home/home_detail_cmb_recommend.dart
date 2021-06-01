import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

GlobalKey<_BodyRoutineWidgetState> globalKey = GlobalKey();

class DetailCMBRecommendScreen extends StatefulWidget {
  @override
  _DetailCMBRecommendScreenState createState() => _DetailCMBRecommendScreenState();
}

class _DetailCMBRecommendScreenState extends State<DetailCMBRecommendScreen> {
  ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(() {
      print('offset = ${scrollController.offset}');
      if (scrollController.offset >= scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        globalKey.currentState.fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                HeaderRoutineWidget(),
                Padding(padding: EdgeInsets.only(top: 32)),
                BodyRoutineWidget(key: globalKey),
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.write);
        },
        backgroundColor: AppColors.cmb_accent[100],
        child: Icon(Icons.carpenter),
      ),
    );
  }
}

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('검색버튼 클릭');
          },
          iconSize: 30,
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {
            print('북마크버튼 클릭');
          },
          iconSize: 30,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(42);
}

class HeaderRoutineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '헬린이들을 위한',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: AppColors.cmb_grey[600],
              ),
            ),
            Text(
              // 글자 더 진하게, 밑줄 추가 예정
              '코마바 추천',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Container(
              width: 272,
              child: Text(
                '레그익스텐션은 허벅지 앞쪾의 대퇴사두근 발달에 아주 좋고, 허벅지 앞쪽 근육에만 집중해서 할 수 있는 운동기구에요!',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cmb_grey[500]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyRoutineWidget extends StatefulWidget {
  BodyRoutineWidget({Key key}) : super(key: key);

  @override
  _BodyRoutineWidgetState createState() => _BodyRoutineWidgetState();
}

class _BodyRoutineWidgetState extends State<BodyRoutineWidget> {
  final int LIST_COUNT = 5;
  final double CARD_HEIGHT = 88.0;

  final List<AssetImage> imageList = <AssetImage>[AssetImage('assets/images/routine_testimg_1.png'), AssetImage('assets/images/routine_testimg_2.png'),
    AssetImage('assets/images/routine_testimg_3.png'), AssetImage('assets/images/routine_testimg_4.png')];

  List<String> realTitleList = <String>[];
  List<AssetImage> realImageList = <AssetImage>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '코마바 추천',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: realTitleList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    height: CARD_HEIGHT,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          height: 88,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: realImageList[index],
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 8),
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              index % 2 == 0 ? Icons.bookmark : Icons.bookmark_border,
                              color: index % 2 == 0 ? Color(0xFF1CB9FF) : Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 12)),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  realTitleList[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.cmb_grey[700]
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 4)),
                                Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.grey[100],
                                        ),
                                        margin: EdgeInsets.only(right: 4),
                                        padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                        child: Text(
                                          '#헬스',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.cmb_grey[600]
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.grey[100],
                                        ),
                                        margin: EdgeInsets.only(right: 4),
                                        padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                        child: Text(
                                          '#다이어트',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.cmb_grey[600]
                                          ),
                                        ),
                                      ),
                                    ]
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetch() {
    for (var i = 0; i < LIST_COUNT; i++) {
      realTitleList.add('코마바가 추천하는 다이어트 루틴 짜는 팁');
      realImageList.add(imageList[i % imageList.length]);
    }
    setState(() {

    });
  }
}

