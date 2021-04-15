import 'package:flutter/material.dart';


class SampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Text('SampleWidget'),
      )
    );
  }
}