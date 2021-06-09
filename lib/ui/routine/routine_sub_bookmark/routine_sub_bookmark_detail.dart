import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_healthlist_photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coach_my_body/constants/colors.dart';

const IconData bookmark = IconData(0xe5f8, fontFamily: 'MaterialIcons');
const IconData upload = IconData(59100, fontFamily: 'MaterialIcons');
const IconData test = IconData(60165, fontFamily: 'MaterialIcons');

class RoutineSubBookmarkDetail extends StatelessWidget {
  int index;

  RoutineSubBookmarkDetail({this.index});

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width; // screen 사이즈

    final tagList = ['#헬스', '#어깨', '#근력'];

    final List<String> titleList = <String>[
      '따라하면 절반은 가는, 헬스장 기본 루틴',
      '핏의 완성, 어깨 집중 강화 운동',
      '홍길동 코치의 7일만에 어깡 만들기 루틴!'
    ];
    final List<String> bodyList = <String>[
      '''
헬스장 초보를 위한 기본 루틴을 추천드립니다! 기본적인 동작의 꾸준한 반복을 통해 테크닉을 단련하고 정확성을 높여주세요.
이 루틴은 몸의 전반적인 근육들이 골고루 쓰이면서 밸런스를 잡아주는데에 좋습니다. 단기간 고중량으로 운동을 진행하기보다는 저중량으로 횟수를 늘려 진행해보세요. 
처음에 동작잡기가 어렵다면 꼭 주변의 트레이너 분께 자세를 봐달라고 요청드리는 것을 추천드려요! 혼자 잘못된 자세로 반복하기 보다는, 잠깐 부끄럽더라도 정확한 동작으로 운동하는게 좋답니다! : ) 
      ''',
      '''
옷태나는 어깨를 만들기 위한 운동 루틴이에요! 어깨를 메인으로 작용시키는 동작들과 마지막으로 어깨를 포함한 전신운동인 데드리프트까지! 
숄더 레이즈와 오버헤드 프레스는 덤벨 등을 활용하여 난이도를 조절할 수 있으며, 프론트와 사이드 등으로 방향을 다양하게 설정해서 삼각근을 골고루 단련시킬 수 있답니다. 
또, 가슴과 어깨, 등은 서로 연결되어 있어 가슴운동과 등운동을 함께 진행해준다면 더욱 탄탄한 근육을 만들 수 있을거에요!
      ''',
      '''
집에서도 가능한 매트 필라테스 루틴이에요! 
매일 반복하면 2주만에 11자 복근을 만들 수 있답니다. 물론 유산소 운동은 필수! (유산소 운동없이 이 루틴만 한다면 복근은 착한 사람한테만 보일거에요..) 
목을 들어주는 동작이 많기때문에 목에 무리가 가지 않도록 주의해주세요! 목에 계속해서 힘이 들어간다면 수건 등을 뒷목에 두고 잡아 당기듯이 머리를 받쳐준다면 조금 나아질거에요! 
      '''
    ];

    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: _width * 0.0444),
              child: Icon(CupertinoIcons.ellipsis),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: _width * 0.0333, horizontal: _width * 0.0444),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        /*1*/
                        width: _width * 0.7111,
                        height: _width * 0.3444,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Container(
                              height: _width * 0.0666,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  final tag = tagList[index];
                                  return SingleChildScrollView(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: _width * 0.0111,
                                          right: _width * 0.0111),
                                      width: _width * 0.0888,
                                      height: _width * 0.0555,
                                      decoration: BoxDecoration(
                                          color: AppColors.cmb_grey[50]),
                                      child: Center(
                                        child: Text(
                                          tag,
                                          style: TextStyle(
                                            fontSize: _width * 0.02778,
                                            color: AppColors.cmb_grey[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: tagList.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            Container(
                              child: Text(
                                titleList[index],
                                style: TextStyle(
                                  fontSize: _width * 0.0666,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  test,
                                ),
                                SizedBox(width: _width * 0.0111),
                                Text(
                                  '홍길동 코치',
                                  style: TextStyle(
                                    fontSize: _width * 0.0333,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: _width * 0.0111),
                                Text(
                                  '짐매니아 헬스',
                                  style: TextStyle(
                                      fontSize: _width * 0.0277,
                                      color: AppColors.cmb_grey[400],
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      /*3*/
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: _width * 0.0333),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                CupertinoIcons.bookmark_fill,
                                color: AppColors.cmb_blue,
                                size: _width * 0.05,
                              ),
                              Icon(
                                CupertinoIcons.share,
                                color: Colors.black,
                                size: _width * 0.05,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/routine_testimg_3.png',
                  width: _width,
                  height: _width * 0.4444,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.all(_width * 0.0444),
                  child: Text(
                    bodyList[index],
                    softWrap: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: _width * 0.0444, left: _width * 0.0444),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '운동목록',
                        style: TextStyle(
                          fontSize: _width * 0.05,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: _width * 0.0222),
                      HealthListPhotos(),
                    ],
                  ),
                ),
                SizedBox(
                  height: _width * 0.1111,
                ),
                Container(
                  padding: EdgeInsets.all(_width * 0.0222),
                  child: Center(
                    child: Container(
                      width: _width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.cmb_blue,
                          padding: EdgeInsets.all(_width * 0.0444),
                        ),
                        onPressed: () {},
                        child: Text(
                          '나의 루틴으로 이동',
                          style: TextStyle(
                              fontSize: _width * 0.0388,
                              color: AppColors.cmb_grey[00]),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
