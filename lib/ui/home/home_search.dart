import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSearchPage extends StatefulWidget {
  @override
  _HomeSearchPageState createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecentSearchWidget(),
        Container(height: 4, color: AppColors.cmb_grey[50],),
        SearchExerciseBySportWidget(),
        Container(height: 4, color: AppColors.cmb_grey[50],),
        SearchExerciseByBodyWidget(),
        Container(height: 4, color: AppColors.cmb_grey[50],),
        ExerciseKeywordWidget(),
        SizedBox(height: 40,),
      ],
    );
  }
}

class RecentSearchWidget extends StatelessWidget {
  final List<String> searchLists = <String>['다이어트 루틴1', '다이어트 루틴2', '다이어트 루틴3', '다이어트 루틴4'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    HOME_SEARCH_RECENT_SEARCH_WORD_TXT.tr(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.cmb_grey[500]
                    ),
                  ),
                  Text(
                    HOME_SEARCH_EMPTY.tr(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.cmb_grey[500]
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: searchLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: (searchLists.length - 1 == index) ? EdgeInsets.only(bottom: 0) : EdgeInsets.only(bottom: 24),
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(searchLists[index] + ' 눌림');
                        },
                        child: Text(
                          searchLists[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.cmb_grey[700]
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('최근 검색어 지우기');
                        },
                        child: Text(
                          'X',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.cmb_grey[200]
                          )
                        ),
                      )
                    ],
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

class SearchExerciseBySportWidget extends StatelessWidget {
  final List<String> exerciseList = <String>['헬스', '필라테스', '요가', '유산소', '점핑'];
  final List<AssetImage> imageList = <AssetImage>[AssetImage('assets/images/routine_testimg_1.png'), AssetImage('assets/images/routine_testimg_2.png'),
    AssetImage('assets/images/routine_testimg_3.png'), AssetImage('assets/images/routine_testimg_4.png')];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 20,
              width: double.infinity,
              child: Text(
                HOME_SEARCH_EXERCISE_BY_TYPES.tr(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.cmb_grey[700]
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 94,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exerciseList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print(exerciseList[index] + ' 눌렸당');
                      },
                      child: Container(
                        height: 94,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageList[index % imageList.length],
                                  fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              exerciseList[index % exerciseList.length],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchExerciseByBodyWidget extends StatelessWidget {
  final List<String> bodyList = <String>['전신', '등', '어깨', '가슴', '복부'];
  final List<AssetImage> imageList = <AssetImage>[AssetImage('assets/images/routine_testimg_1.png'), AssetImage('assets/images/routine_testimg_2.png'),
    AssetImage('assets/images/routine_testimg_3.png'), AssetImage('assets/images/routine_testimg_4.png')];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 20,
              width: double.infinity,
              child: Text(
                HOME_SEARCH_EXERCISE_BY_BODY.tr(),
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cmb_grey[700]
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 94,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bodyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print(bodyList[index] + ' 눌렸당');
                      },
                      child: Container(
                        height: 94,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageList[index % imageList.length],
                                      fit: BoxFit.fill
                                  ),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              bodyList[index % bodyList.length],
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExerciseKeywordWidget extends StatelessWidget {
  final List<String> keywordList = <String>['다이어트', '체력 키우기', '근육돼지',
  '유연한 몸', '건강'];
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Container(
        height: 128,
        child: Column(
          children: [
            Container(
              height: 20,
              width: double.infinity,
              child: Text(
                HOME_SEARCH_KEYWORDS.tr(),
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cmb_grey[700]
                ),
              ),
            ),
            SizedBox(height: 12,),
            Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                children: _getKeywordWidget()
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getKeywordWidget() {
    List<Widget> widgetList = <Container>[];

    for (var item in keywordList) {
      widgetList.add(
        Container(
          height: 28,
          padding: EdgeInsets.fromLTRB(16, 5, 16, 3),
          margin: EdgeInsets.fromLTRB(0, 0, 8, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Color(0xFFE9EDEF),
              width: 1
            )
          ),
          child: Text(
            '#' + item,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.cmb_grey[700]
            ),
          ),
        )
      );
    }

    return widgetList;
  }
}




