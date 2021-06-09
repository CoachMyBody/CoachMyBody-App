import 'package:coach_my_body/providers/routine/bookmark_selcect_button_model.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/my_bookmark_data.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/my_bookmark_tile.dart';
import 'package:flutter/material.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/routine_sub_bookmark_detail.dart';
import 'package:provider/provider.dart';

class RoutineSubBookmarkList extends StatelessWidget {
  RoutineSubBookmarkList();

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    final bookMarkSelectButtonProvider =
        Provider.of<BookMarkSelectButtonModel>(context, listen: true);

    return Consumer<MyBookMarkData>(builder: (context, myBookMarkData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final myBookMark = myBookMarkData.myBookMarks[index];
          return SingleChildScrollView(
            child: Stack(children: [
              Opacity(
                opacity: bookMarkSelectButtonProvider.isClicked
                    ? myBookMark.isSelected
                        ? 1
                        : 0.5
                    : 1,
                child: Container(
                  width: double.infinity,
                  height: _width * 0.2611,
                  child: MyBookMarkTile(
                    img: myBookMark.imageUrl,
                    title: myBookMark.title,
                    tags: myBookMark.tags,
                    isSelectButtonClicked:
                        bookMarkSelectButtonProvider.isClicked,
                    isSelected: myBookMark.isSelected,
                    tapCallBack: () {
                      bookMarkSelectButtonProvider.isClicked
                          ? myBookMarkData.selectMyBookMark(myBookMark)
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RoutineSubBookmarkDetail(
                                        index: 2,
                                      )));
                    },
                  ),
                ),
              )
            ]),
          );
        },
        itemCount: myBookMarkData.getMyBookMarkCount(),
      );
    });
  }
}
