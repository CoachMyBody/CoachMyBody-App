import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class DetailCMBRecommendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(),
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            HeaderRoutineWidget(),
            Padding(padding: EdgeInsets.only(top: 32)),
            BodyRoutineWidget(),
          ],
        )
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

class BodyRoutineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
