import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_healthlist_photos.dart';
import 'package:flutter/material.dart';
import 'package:coach_my_body/constants/colors.dart';

const IconData bookmark = IconData(0xe5f8, fontFamily: 'MaterialIcons');
const IconData upload = IconData(59100, fontFamily: 'MaterialIcons');
const IconData test = IconData(60165, fontFamily: 'MaterialIcons');

class RoutineSubBookmarkDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // screen 사이즈
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
                              '홍길동 코치의 7일만에 어깡 만들기 루틴!',
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
                  '인간은 위하여 구할 인간의 장식하는 할지니, 끓는다. '
                      '구할 가치를 장식하는 공자는 수 오아이스도 기관과 이것이다. '
                      '방황하였으며, 모래뿐일 황금시대의 뜨거운지라, 부패뿐이다. '
                      '물방아 과실이 것은 가는 굳세게 이상 것이다. 수 미묘한'
                      ' 같이 산야에 거친 옷을 끝까지 남는 교향악이다. 눈이'
                      ' 구하지 그들에게 말이다. 전 황금시대의 뜨거운지라, 부패뿐이다. '
                      '물방아 과실이 것은 가는 굳세게 이상 것이다. 수 미묘한'
                      ' 같이 산야에 거친 옷을 끝까지 남는 교향악이다. 눈이'
                      ' 구하지 그들에게 말이다. 전 황금시대의 뜨거운지라, 부패뿐이다. '
                      '물방아 과실이 것은 가는 굳세게 이상 것이다. 수 미묘한'
                      ' 같이 산야에 거친 옷을 끝까지 남는 교향악이다. 눈이'
                      ' 구하지 그들에게 말이다. 전 황금시대의 뜨거운지라, 부패뿐이다. '
                      '물방아 과실이 것은 가는 굳세게 이상 것이다. 수 미묘한'
                      ' 같이 산야에 거친 옷을 끝까지 남는 교향악이다. 눈이'
                      ' 구하지 그들에게 말이다. 전 황금시대의 뜨거운지라, 부패뿐이다. '
                      '물방아 과실이 것은 가는 굳세게 이상 것이다. 수 미묘한'
                      ' 같이 산야에 거친 옷을 끝까지 남는 교향악이다. 눈이'
                      ' 구하지 그들에게 말이다. 전인 풍부하게 이것을 얼마나'
                      ' 불어 석가는 공자는 있는 우리의 있다. 그들에게 온갖'
                      ' 꽃 이것을 광야에서 천고에 그리하였는가? 그들의 온갖'
                      ' 같으며, 보이는 인생의 것이다. 그림자는 살 얼음 힘있다.'
                      ' 어디 바이며, 이상 이것이다.L',
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
      )


    );
  }
}
