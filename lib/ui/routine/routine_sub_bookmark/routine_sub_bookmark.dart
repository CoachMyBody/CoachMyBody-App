import 'package:coach_my_body/providers/routine/bookmark_selcect_button_model.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/my_bookmark_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark_list.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark_detail.dart';
import 'package:provider/provider.dart';

class RoutineSubBookmarkScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    final bookMarkSelectButtonProvider =
        Provider.of<BookMarkSelectButtonModel>(context, listen: true);
    final myBookMarkProvider =
        Provider.of<MyBookMarkData>(context, listen: true);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: _width * 0.0444,
            right: _width * 0.0444,
            top: _width * 0.0444),
        child: RoutineSubBookmarkList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: bookMarkSelectButtonProvider.isClicked
            ? Container(
                color: Colors.black,
                height: _width * 0.1166,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextButton(
                          onPressed: () {
                            myBookMarkProvider.selectAllMyBookMark();
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
}
