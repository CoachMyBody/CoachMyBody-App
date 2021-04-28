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
            HeaderRoutineWidget(),
            Padding(padding: EdgeInsets.only(top: 16)),
            BodyRoutineWidget()
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

class BodyRoutineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
              height: 24,
              alignment: Alignment.centerRight,
              child: Icon(Icons.clear_all),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),

          ],
        ),
      ),
    );
  }
}

