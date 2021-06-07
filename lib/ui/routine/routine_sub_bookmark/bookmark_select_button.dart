import 'package:coach_my_body/providers/routine/bookmark_selcect_button_model.dart';
import 'package:coach_my_body/providers/routine/routine_select_button_model.dart';
import 'package:coach_my_body/ui/routine/routine_sub_bookmark/my_bookmark_data.dart';
import 'package:coach_my_body/ui/routine/routine_sub_myroutines/my_routine_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookMarkSelectButton extends StatelessWidget {
  BookMarkSelectButton();

  @override
  Widget build(BuildContext context) {
    final bookMarkButtonProvider =
        Provider.of<BookMarkSelectButtonModel>(context, listen: true);
    final myBookMarkProvider =
        Provider.of<MyBookMarkData>(context, listen: true);

    return TextButton(
        onPressed: () {
          bookMarkButtonProvider.clickButton();
          if (!bookMarkButtonProvider.isClicked) {
            myBookMarkProvider.unSelectAllMyBookMark();
          }
        },
        child: bookMarkButtonProvider.isClicked ? Text('취소') : Text('선택'));
  }
}
