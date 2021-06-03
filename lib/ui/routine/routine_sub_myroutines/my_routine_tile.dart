import 'package:coach_my_body/providers/routine/routine_select_button_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRoutineTile extends StatelessWidget {
  final String img;
  final String title;
  final bool isSelectButtonClicked;
  final bool isSelected;
  final Function tapCallBack;

  MyRoutineTile(
      {this.img,
      this.title,
      this.isSelectButtonClicked,
      this.isSelected,
      this.tapCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: 48,
          height: 48,
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: Image.asset(
            img,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: isSelectButtonClicked
          ? isSelected
              ? Icon(Icons.check)
              : Icon(Icons.check_box_outline_blank)
          : Icon(Icons.keyboard_arrow_right),
      onTap: tapCallBack,
    );
  }
}
