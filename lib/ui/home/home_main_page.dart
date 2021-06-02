import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/home/home_search_model.dart';
import 'package:coach_my_body/ui/home/home_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';
import 'home_detail_cmb_recommend.dart';
import 'home_detail_popular_routine.dart';

class HomeMainPage extends StatelessWidget {
  var searchProvider;

  @override
  Widget build(BuildContext context) {
    searchProvider = Provider.of<SearchViewModel>(context, listen: true);

    return searchProvider.isSearchTapped ? Scaffold(
      appBar: SearchAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: HomeSearchPage()
        ),
      ),
    ) : Scaffold(
      appBar: SearchAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeMenuWidget(),
              PopularRoutineWidget(),
              CMBRecommendWidget(),
              SizedBox(height: 20,)
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.write);
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.carpenter),
      ),
    );
  }
}

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(42);
}

class _SearchAppBarState extends State<SearchAppBar> {
  var searchProvider;

  bool isSearchTap = false;

  @override
  Widget build(BuildContext context) {
    searchProvider = Provider.of<SearchViewModel>(context, listen: true);

    return Padding(
      padding: EdgeInsets.only(top: 4),
      child: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
          decoration: BoxDecoration(
              color: AppColors.cmb_grey[50],
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: Container(
            child: TextField(
              onTap: () {
                print('검색창 눌림');
                searchProvider.isSearchTapped = true;
                // setState(() {
                //   isSearchTap = true;
                // });
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10
                ),
                border: InputBorder.none,
                hintText: HOME_MAIN_HINT_SEARCH_TXT.tr(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8
                  ),
                  child: Icon(
                    Icons.search,
                    color: AppColors.cmb_grey[500],
                    size: 24,
                  ),
                ),
                hintStyle: TextStyle(fontSize: 16, color: AppColors.cmb_grey[200]),
              ),
              style: TextStyle(fontSize: 20, color: AppColors.cmb_grey[300]),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        actions: <Widget>[
          searchProvider.isSearchTapped ? TextButton(
              onPressed: () {
                print('취소 버튼 눌림');
                searchProvider.isSearchTapped = false;
                // setState(() {
                //   isSearchTap = false;
                // });
              },
              child: Text(
                COMMON_CANCEL_TXT.tr(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              )
          ) : IconButton(icon: Icon(Icons.bookmark_border), iconSize: 28, color: Colors.black, onPressed: () {})
        ],
        elevation: 0,
      ),
    );
  }
}

class HomeMenuWidget extends StatefulWidget {
  final List<String> menuList = <String>['전체', '헬스', '필라테스', '요가', '유산소', '스트레스'];
  final List<Icon> iconList = <Icon>[Icon(Icons.padding), Icon(Icons.bookmark_border), Icon(Icons.search), Icon(Icons.ac_unit_sharp), Icon(Icons.account_balance_wallet_outlined), Icon(Icons.add_alarm_rounded)];

  @override
  _HomeMenuWidgetState createState() => _HomeMenuWidgetState();
}

class _HomeMenuWidgetState extends State<HomeMenuWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
      height: 84,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.menuList.length,
            itemBuilder: (BuildContext context, int index) {
              var isSelected = _currentIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected ? AppColors.cmb_grey[50] : Colors.white10
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                  width: 60,
                  height: 84,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Icon(widget.iconList[index].icon),
                        ),
                        Text(
                          '${widget.menuList[index]}',
                          style: TextStyle(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

class PopularRoutineWidget extends StatelessWidget {

  final List<String> titleList = <String>['홍길동 코치의 7일만에 어깡 만들기 루틴!', '7일만에 허벅지 다이어트 일주일 루틴!'];
  final List<AssetImage> imageList = <AssetImage>[AssetImage('assets/images/routine_testimg_1.png'), AssetImage('assets/images/routine_testimg_2.png'),
    AssetImage('assets/images/routine_testimg_3.png'), AssetImage('assets/images/routine_testimg_4.png')];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 888,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  HOME_MAIN_POPULAR_ROUTINES_TXT.tr(),
                  style: TextStyle(
                      fontFamily: "SpoqaHanSansNeo",
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Icon(Icons.clear_all)
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          Expanded(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.5),
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width * 114 / 160 / 2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageList[index % 4],
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
                          Padding(padding: EdgeInsets.only(top: 4.0)),
                          Text(
                            titleList[index % 2],
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.cmb_grey[700]
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 8.0)),
                          Row(
                            children: [
                              SizedBox(
                                width: 18.0,
                                height: 18.0,
                                child: CircleAvatar(
                                  child: Image.asset(
                                      'assets/images/test_image.png'
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 4)),
                              Text(
                                '홍길동 코치',
                                style: TextStyle(
                                    color: AppColors.cmb_grey[500],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 8)),
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
                              // TextButton(
                              //   onPressed: () {},
                              //   style: TextButton.styleFrom(
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(8)
                              //     ),
                              //     backgroundColor: AppColors.cmb_grey[100],
                              //   ),
                              //   child: Padding(
                              //     padding: const EdgeInsets.fromLTRB(4, 4, 4, 2),
                              //     child: Text(
                              //       '#헬스',
                              //       style: TextStyle(
                              //         fontSize: 10,
                              //         fontWeight: FontWeight.bold,
                              //         color: AppColors.cmb_grey[400]),
                              //     ),
                              //   )
                              // ),
                              // Padding(padding: EdgeInsets.all(4)),
                              // TextButton(
                              //     onPressed: () {},
                              //     style: TextButton.styleFrom(
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(8)
                              //       ),
                              //       backgroundColor: AppColors.cmb_grey[100],
                              //     ),
                              //     child: Padding(
                              //       padding: const EdgeInsets.fromLTRB(4, 4, 4, 2),
                              //       child: Text(
                              //         '#다이어트',
                              //         style: TextStyle(
                              //             fontSize: 10,
                              //             fontWeight: FontWeight.bold,
                              //             color: AppColors.cmb_grey[400]),
                              //       ),
                              //     )
                              // )
                            ],
                          )
                        ],
                      ),
                    );
                  }
              )
          ),
          SizedBox(
              width: double.infinity,
              height: 42,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.cmb_grey[100],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPopularRoutineScreen()));
                },
                child: Text(
                  HOME_MAIN_MORE_POPULAR_ROUTINES_TXT.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}

class CMBRecommendWidget extends StatelessWidget {
  final int LIST_COUNT = 5;
  final double CARD_HEIGHT = 88.0;

  final List<AssetImage> imageList = <AssetImage>[AssetImage('assets/images/routine_testimg_1.png'), AssetImage('assets/images/routine_testimg_2.png'),
    AssetImage('assets/images/routine_testimg_3.png'), AssetImage('assets/images/routine_testimg_4.png')];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 53, 0, 0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: CARD_HEIGHT * LIST_COUNT + 100 + 50,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              HOME_MAIN_CMB_RECOMMENDS_TXT.tr(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          Expanded(
            child: ListView.builder(
                primary: false,
                itemCount: LIST_COUNT,
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
                                    image: imageList[index % 4],
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
                                    '코마바가 추천하는 다이어트 루틴 짜는 팁',
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
          ),
          SizedBox(
              width: double.infinity,
              height: 42,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.cmb_grey[100],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailCMBRecommendScreen()));
                },
                child: Text(
                  HOME_MAIN_MORE_CMB_RECOMMENDS_TXT.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}