import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_healthlist_photos.dart';
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
    final screenSize = MediaQuery.of(context).size; // screen 사이즈

    final List<String> titleList = <String>['따라하면 절반은 가는, 헬스장 기본 루틴', '핏의 완성, 어깨 집중 강화 운동', '홍길동 코치의 7일만에 어깡 만들기 루틴!'];
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
          leading: Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Container(
                              //padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                titleList[index],
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*3*/
                      SizedBox(width: 60.0),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(
                        test,
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        /*1*/

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    '홍길동 코치',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        bookmark,
                        color: Colors.blue[500],
                      ),
                      Icon(
                        upload,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/routine_testimg_3.png',
                  width: 600,
                  height: 170,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    bodyList[index],
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  //padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '운동목록',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                HealthListPhotos(),
                SizedBox(
                  height: 70.0,
                ),
                Container(
                  child: Center(
                    child: Container(
                      width: screenSize.width,
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.cmb_grey[800],
                          padding: EdgeInsets.all(10.0),
                        ),
                        onPressed: () {},
                        child: Text(
                          '나의 루틴으로 이동',
                          style: TextStyle(color: AppColors.cmb_grey[00]),
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
