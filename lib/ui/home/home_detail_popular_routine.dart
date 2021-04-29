import 'package:coach_my_body/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

class DetailPopularRoutineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(),
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderRoutineWidget(),
                SizedBox(height: 16,),
                //Expanded(child: BodyRoutineWidget())
              ],
            )
          ],
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
        height: 400,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '전문 트레이너가\n알려주는 인기 루틴',
                style: TextStyle(
                  color: AppColors.cmb_grey[700],
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Container(
              height: MediaQuery.of(context).size.width * 144 / 328,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('assets/images/routine_testimg_2.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 21,
                height: 16,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/test/content_icon.png')
                  )
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 4)),
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 272,
                child: Text(
                  '슬퍼하는 그리워 어머님, 프랑시스 봅니다. 지나가는 덮어 추억과 까닭이요, 너무나 별들을 내린 듯합니다. 속의 불러 계집애들의 있습니다.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cmb_grey[700]
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 12)),
            Row(
              children: [
                Text(
                  '이재성 코치',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.cmb_grey[700],
                    fontWeight: FontWeight.bold
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 4)),
                Text(
                  '짐매니아 헬스',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cmb_grey[300]
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BodyRoutineWidget extends StatefulWidget {
  @override
  _BodyRoutineWidgetState createState() => _BodyRoutineWidgetState();
}

class _BodyRoutineWidgetState extends State<BodyRoutineWidget> {
  final List<String> titleList = <String>['홍길동 코치의 7일만에 어깡 만들기 루틴!', '7일만에 허벅지 다이어트 일주일 루틴!'];
  final List<AssetImage> imageList = <AssetImage>[AssetImage('assets/images/routine_testimg_1.png'), AssetImage('assets/images/routine_testimg_2.png'),
    AssetImage('assets/images/routine_testimg_3.png'), AssetImage('assets/images/routine_testimg_4.png')];

  List<String> realTitleList = <String>[];
  List<AssetImage> realImageList = <AssetImage>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFour();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '야야야'
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
    //   child: Container(
    //     color: Colors.grey[300],
    //     child: Column(
    //       children: [
    //         Container(
    //           height: 24,
    //           alignment: Alignment.centerRight,
    //           child: Icon(Icons.clear_all),
    //         ),
    //         SizedBox(height: 16,),
    //         Expanded(
    //           child: GridView.builder(
    //               physics: NeverScrollableScrollPhysics(),
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 2,
    //                 childAspectRatio: 2 / 3,
    //                 mainAxisSpacing: 16.0,
    //                 crossAxisSpacing: 8.0,
    //               ),
    //               itemCount: realTitleList.length,
    //               itemBuilder: (context, index) {
    //                 return Container(
    //                   child: Column(
    //                     children: [
    //                       Container(
    //                         width: double.infinity,
    //                         height: MediaQuery.of(context).size.width * 114 / 160 / 2,
    //                         decoration: BoxDecoration(
    //                             image: DecorationImage(
    //                                 image: realImageList[index],
    //                                 fit: BoxFit.cover
    //                             ),
    //                             borderRadius: BorderRadius.circular(8)
    //                         ),
    //                         child: Container(
    //                           margin: EdgeInsets.fromLTRB(0, 0, 8, 8),
    //                           alignment: Alignment.bottomRight,
    //                           child: Icon(
    //                             index % 2 == 0 ? Icons.bookmark : Icons.bookmark_border,
    //                             color: index % 2 == 0 ? Color(0xFF1CB9FF) : Color(0xFFFFFFFF),
    //                           ),
    //                         ),
    //                       ),
    //                       SizedBox(height: 4,),
    //                       Text(
    //                         realTitleList[index],
    //                         style: TextStyle(
    //                             fontSize: 14,
    //                             fontWeight: FontWeight.bold,
    //                             color: AppColors.cmb_grey[700]
    //                         ),
    //                       ),
    //                       SizedBox(height: 8,),
    //                       Row(
    //                         children: [
    //                           SizedBox(
    //                             width: 18.0,
    //                             height: 18.0,
    //                             child: CircleAvatar(
    //                               child: Image.asset(
    //                                   'assets/images/test_image.png'
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(padding: EdgeInsets.only(right: 4)),
    //                           Text(
    //                             '홍길동 코치',
    //                             style: TextStyle(
    //                                 color: AppColors.cmb_grey[500],
    //                                 fontSize: 12,
    //                                 fontWeight: FontWeight.bold
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                       SizedBox(height: 8,),
    //                       Row(
    //                         children: [
    //                           Container(
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(4),
    //                               color: Colors.grey[100],
    //                             ),
    //                             height: 50,
    //                             margin: EdgeInsets.only(right: 4),
    //                             padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
    //                             child: Text(
    //                               '#헬스',
    //                               style: TextStyle(
    //                                   fontSize: 10,
    //                                   color: AppColors.cmb_grey[600]
    //                               ),
    //                             ),
    //                           ),
    //                           Container(
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(4),
    //                               color: Colors.grey[100],
    //                             ),
    //                             height: 50,
    //                             margin: EdgeInsets.only(right: 4),
    //                             padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
    //                             child: Text(
    //                               '#다이어트',
    //                               style: TextStyle(
    //                                   fontSize: 10,
    //                                   color: AppColors.cmb_grey[600]
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 );
    //               }
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  // 원래는 비동기 처리해야함
  void fetch(int index) {
    setState(() {
      realTitleList.add(titleList[index % titleList.length]);
      realImageList.add(imageList[index % imageList.length]);
    });
  }

  void fetchFour() {
    for (var i = 0; i < 4; i++) {
      fetch(i);
    }
  }
}

