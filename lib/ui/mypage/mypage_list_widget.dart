import 'package:flutter/material.dart';

class MypageList extends StatelessWidget {
  MypageList({@required this.text, @required this.route});

  final String text;
  final Function route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: 0.0, vertical: -2),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: route,
    );
  }
}
